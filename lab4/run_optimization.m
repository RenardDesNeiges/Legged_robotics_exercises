clc;
clear;
close all;

%% optimize for speed
% optimize the initial conditions and controller hyper parameters
q0 = [pi/9; -pi/9; 0];
dq0 = [0; 0; 8]; 
x0 = [q0; dq0; control_hyper_parameters()];

% use fminsearch and optimset to control the MaxIter
%   -check use with "help", and start with: 
%   options = optimset('Display', 'iter', 'MaxIter', 100);  
% ...



target_speed = 6;
w = [10,10];
optifun1 = @(x) optimization_fun(x,w,target_speed);
opt = fminsearch(optifun1,x0);

%% simulate solution

% extract parameters
q0 = opt(1:3);
dq0 = opt(4:6);
x_opt = opt(7:11);

% simulate
num_steps = 10;
sln = solve_eqns(q0, dq0, num_steps, x_opt);
animate(sln);
disp("speed optimization")
results_speed = analyse(sln, x_opt, true)


