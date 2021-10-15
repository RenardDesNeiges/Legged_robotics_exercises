function dy = eqns(t, y)
% n this is the dimension of the ODE, note that n is 2*DOF, why? 
% y1 = q1, y2 = q2, y3 = dq1, y4 = dq2

[m1, m2, l1, l2, g] = set_parameters;

q =  [y(1); y(2)];
dq = [y(3); y(4)];

M = eval_M(l1,l2,m1,m2,q(1),q(2));
C = eval_C(dq(1),dq(2),l1,l2,m2,q(1),q(2));
G = eval_G(g,l1,l2,m1,m2,q(1),q(2));

n = 4;   
dy = zeros(n, 1);
dy(1) = y(3);
dy(2) = y(4);
dy(3:4) = M \ (-C*dq - G);

end