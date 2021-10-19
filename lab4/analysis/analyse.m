function results = analyse(sln, parameters, to_plot)



% calculate actuation (you can use the control function)

full_q = double.empty(0,6);
full_T = double.empty(0,1);
full_x = double.empty(0,1);
full_z = double.empty(0,1);
full_dx = double.empty(0,1);

step_time =  double.empty(0,1);
step_len =  double.empty(0,1);

prev_x = 0;
for i = 1:size(sln.Y,2)
   step_q = sln.Y{i};
   step_T = sln.T{i};
   full_q = [full_q;step_q];
   full_T = [full_T;step_T];
   
   step_x = zeros(size(step_q,1),1);
   step_dx = zeros(size(step_q,1),1);
   step_z = zeros(size(step_q,1),1);
   step_dz = zeros(size(step_q,1),1);
   for t = 1:size(step_q,1)
       q = step_q(t,1:3);
       dq = step_q(t,4:6);
       [step_x(t), step_z(t), step_dx(t), step_dz(t)] = kin_hip(q,dq);
   end
   step_x = step_x + prev_x-step_x(1);
   prev_x = step_x(end);
   
   full_x = [full_x;step_x];
   full_dx = [full_dx;step_dx];
   full_z = [full_z;step_z];
   
   step_time = [step_time,step_T(end)-step_T(1)];
   step_len = [step_len,step_x(end)-step_x(1)];
end


full_u = zeros(size(full_T,1),2);
for t = 1:size(full_T,1)
   q =  full_q(t,1:3);
   dq =  full_q(t,3:6);
   full_u(t,:) = control(t, q, dq, [0,0,0], [0,0,0], 1, parameters);
end

if to_plot
    figure

    subplot(2,1,1)
    plot(full_T,full_q(:,1:3))
    subplot(2,1,2)
    plot(full_T,full_q(:,4:6))

    figure
    subplot(2,1,1)
    plot(full_T,full_x)
    subplot(2,1,2)
    plot(full_T,full_z)
    
    figure
    plot(full_T,full_dx)
    hold on
    yline(mean(full_dx))
    
   
    figure
    subplot(2,2,1)
    plot(full_q(:,1),full_q(:,4))
    subplot(2,2,2)
    plot(full_q(:,2),full_q(:,5))
    subplot(2,2,3)
    plot(full_q(:,3),full_q(:,6))
    
   
    figure
    plot(full_T,full_u)
end

% calculate gait quality metrics (distance, step frequency, step length,
% velocity, etc.)

results.distance = full_x(end)-full_x(1);
results.step_frequency = 1/mean(step_time);
results.step_length = mean(step_len);
results.velocity = mean(full_dx);

end