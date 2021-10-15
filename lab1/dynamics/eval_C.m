function C = eval_C(g,l1,l2,m1,m2,q1,q2)
%EVAL_C
%    C = EVAL_C(G,L1,L2,M1,M2,Q1,Q2)

%    This function was generated by the Symbolic Math Toolbox version 8.6.
%    28-Sep-2021 13:51:11

t2 = sin(q1);
t3 = m1+m2;
t4 = -q2;
t5 = g.*m1.*t2;
t6 = g.*m2.*t2;
t7 = q1+t4;
t9 = g.*l1.*t2.*t3;
t8 = sin(t7);
t10 = l2.*m2.*t8;
t11 = t5+t6+t10;
t12 = l1.*t11;
C = reshape([t9,t9,t12,t12],[2,2]);
