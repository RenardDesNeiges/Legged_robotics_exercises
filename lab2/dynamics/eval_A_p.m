function A_p = eval_A_p(q_p)
    % load relevant parameters
    [m1, m2, m3, l1, l2, l3, g] = set_parameters();
    m = m1;
    q1_p = q_p(1); q2_p = q_p(2); q3_p = q_p(3);
    
    %    This function was generated by the Symbolic Math Toolbox version 8.6.
    %    16-Oct-2021 17:48:38

    t2 = l1.^2;
    t3 = l3.^2;
    t4 = -q2_p;
    t5 = -q3_p;
    t6 = q1_p+t4;
    t7 = q1_p+t5;
    t8 = cos(t6);
    t9 = cos(t7);
    t10 = l1.*l2.*t8.*2.0;
    t11 = l1.*l3.*t9.*2.0;
    t12 = -t10;
    A_p = reshape([m.*(t2.*9.0+t11+t12).*(-1.0./4.0),(m.*t2)./4.0,l1.*l3.*m3.*t9.*(-1.0./2.0),(m.*(t10-l2.^2))./4.0,0.0,0.0,m.*(t3+t11).*(-1.0./4.0),0.0,m3.*t3.*(-1.0./4.0)],[3,3]);


end