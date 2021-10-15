function [T, V] = eval_energy(q, dq)    

    % load relevant parameters
    [m1, m2, m3, l1, l2, l3, g] = set_parameters()
    q1 = q(1); q2 = q(2); q3 = q(3);
    dq1 = dq(1); dq2 = dq(2); dq3 = dq(3);
    
    %    This function was generated by the Symbolic Math Toolbox version 8.6.
    %    15-Oct-2021 17:05:50
    t2 = dq1.^2;
    t3 = l1.^2;
    T = (dq2.^2.*l2.^2.*m2)./8.0+(dq3.^2.*l3.^2.*m3)./8.0+(m1.*t2.*t3)./8.0+(m2.*t2.*t3)./2.0+(m3.*t2.*t3)./2.0-(dq1.*dq2.*l1.*l2.*m2.*cos(q1-q2))./2.0+(dq1.*dq3.*l1.*l3.*m3.*cos(q1-q3))./2.0;

    %    This function was generated by the Symbolic Math Toolbox version 8.6.
    %    15-Oct-2021 17:05:50

    t2 = cos(q1);
    t3 = l1.*t2;
    V = g.*m2.*(t3-(l2.*cos(q2))./2.0)+g.*m3.*(t3+(l3.*cos(q3))./2.0)+(g.*m1.*t3)./2.0;
end