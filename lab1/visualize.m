%%
% This function plots the configuration of the double pendulum.
% q = [q1, q2 ] are the generalized coordinates.
%%
function visualize(q)

    [~, ~, l1, l2, ~] = set_parameters;
    q1 = q(1);
    q2 = q(2);
    
    x1 =  l1 * sin(q1);
    y1 = -l1 * cos(q1);
    x2 =  l1 * sin(q1) + l2 * sin(q2);
    y2 = -l1 * cos(q1) - l2 * cos(q2);
    
    %% 
    % Here plot a schematic of the configuration of the double pendulum at 
    % the generalized coordinate q = [q1, q2]:
    clf
    lw = 2;
    % links
    plot([0, x1], [0, y1], 'linewidth', lw); 
    hold on
    plot([x1, x2], [y1, y2], 'linewidth', lw); 
    
    % point masses
    mz = 40;
    plot(x1, y1, '.', 'markersize', mz); 
    hold on
    plot(x2, y2, '.', 'markersize', mz); 
    axis equal;
    xlim([-1, 1]);
    ylim([-1.5, 0.5]);
end