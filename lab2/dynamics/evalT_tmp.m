function T = evalT_tmp(dq1,dq2,dq3,l1,l2,l3,m1,m2,m3,q1,q2,q3)
%EVALT_TMP
%    T = EVALT_TMP(DQ1,DQ2,DQ3,L1,L2,L3,M1,M2,M3,Q1,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 8.6.
%    18-Oct-2021 20:50:29

t2 = dq1.^2;
t3 = l1.^2;
T = (dq2.^2.*l2.^2.*m2)./8.0+(dq3.^2.*l3.^2.*m3)./8.0+(m1.*t2.*t3)./8.0+(m2.*t2.*t3)./2.0+(m3.*t2.*t3)./2.0-(dq1.*dq2.*l1.*l2.*m2.*cos(q1-q2))./2.0+(dq1.*dq3.*l1.*l3.*m3.*cos(q1-q3))./2.0;
