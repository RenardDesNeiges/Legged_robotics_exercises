%% run simulation
q0 = [pi/3; -pi/9];
dq0 = [0; 0]; 

options = odeset('RelTol',1e-3);
tspan = [0 5];
y0 = [q0; dq0];
t0 = 0;

[T, Y] = ode45(@(t, y) eqns(t, y), tspan, y0, options);

tic();
for i=2:2:length(T)
    visualize(Y(i,1:2))
    %pause(T(i)-T(i-1))
    drawnow
end

t_anim = toc();
real_time_factor = T(end) / t_anim;
fprintf('Real time factor:');
disp(real_time_factor);