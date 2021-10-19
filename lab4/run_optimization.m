clc;
clear;
close all;

%% optimize
% optimize the initial conditions and controller hyper parameters
q0 = [pi/9; -pi/9; 0];
dq0 = [0; 0; 8]; 
x0 = [q0; dq0; control_hyper_parameters()];

% use fminsearch and optimset to control the MaxIter
%   -check use with "help", and start with: 
%   options = optimset('Display', 'iter', 'MaxIter', 100);  
% ...




optifun = @(x) -analyse(solve_eqns(q0, dq0, 10, x(3:end)),x(3:end),false).step_length;
opt = fminsearch(optifun,x0);

%% simulate solution

% extract parameters
q0 = opt(1:3);
dq0 = opt(4:6);
x_opt = opt(7:11);

% simulate
num_steps = 10;
sln = solve_eqns(q0, dq0, num_steps, x_opt);
animate(sln);
results = analyse(sln, x_opt, true);