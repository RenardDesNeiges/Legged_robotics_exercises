%%
% Evaluate the Coriolis matrix C, given q, dq
function C = eval_C(q, dq)
    

    % load relevant parameters
    [m1, m2, m3, l1, l2, l3, g] = set_parameters()
    q1 = q(1); q2 = q(2); q3 = q(3);

    %    This function was generated by the Symbolic Math Toolbox version 8.6.
    %    12-Oct-2021 13:17:47

    t2 = -q2;
    t3 = -q3;
    t4 = q1+t2;
    t5 = q1+t3;
    t6 = sin(t4);
    t7 = sin(t5);
    C = reshape([0.0,(dq1.*l1.*l2.*m2.*t6)./2.0,dq1.*l1.*l3.*m3.*t7.*(-1.0./2.0),dq2.*l1.*l2.*m2.*t6.*(-1.0./2.0),0.0,0.0,(dq3.*l1.*l3.*m3.*t7)./2.0,0.0,0.0],[3,3]);

end