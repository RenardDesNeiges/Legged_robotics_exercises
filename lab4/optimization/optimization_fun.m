function objective_value = optimization_fun(input_x)
    
    q0 = input_x(1:3);
    dq0 = input_x(4:6);
    sol = solve_eqns(q0, dq0, 10, input_x(6:end));
    CoT = analyse(sol,input_x(3:end),false).CoT;
    Speed = analyse(sol,input_x(3:end),false).Velocity;
    objective_value = w(1) * (Speed-tspeed) + w(2) * CoT;

% handle corner case when model walks backwards (e.g., objective_value =
% 1000)

% handle case when model falls (e.g., objective_value = 1000)


end

