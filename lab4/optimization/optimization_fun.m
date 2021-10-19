function objective_value = optimization_fun(input_x,w,t_speed)
    
    q0 = input_x(1:3);
    dq0 = input_x(4:6);
    sol = solve_eqns(q0, dq0, 10, input_x(6:end));
    CoT = analyse(sol,input_x(3:end),false).CoT;
    Speed = analyse(sol,input_x(3:end),false).velocity;
    objective_value = w(1) * abs(Speed-t_speed) + w(2) * CoT;
end

