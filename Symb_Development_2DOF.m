clear;close all;clc;
% 
syms M1 M2 M3;
syms x1 x1d x1dd x2 x2d x2dd;
syms L1 L2 L3;
syms u1 u2 u3;
syms g

p1x = L1*cos(x1);
p1y = L1*sin(x1);
p2x = p1x+L2*cos(x1+x2);
p2y = p1y+L2*sin(x1+x2);

v1x = -L1*sin(x1)*x1d;
v1y = +L1*cos(x1)*x1d;
v2x = v1x-L2*sin(x1+x2)*(x1d+x2d);
v2y = v1y+L2*cos(x1+x2)*(x1d+x2d);

KE = 0.5*M1*( v1x^2 + v1y^2) + 0.5*M2*( v2x^2 + v2y^2);
KE = simplify(KE);

PE = M1*g*p1y + M2*g*p2y;
PE = simplify(PE);

Px1= u1;
Px2= u2;

pKEpx1d = diff(KE,x1d);
ddtpKEpx1d = diff(pKEpx1d,x1)*x1d+ ...
             diff(pKEpx1d,x1d)*x1dd+ ...
             diff(pKEpx1d,x2)*x2d + ...
             diff(pKEpx1d,x2d)*x2dd;
pKEpx1 = diff(KE,x1);
pPEpx1 = diff(PE,x1);


pKEpx2d = diff(KE,x2d);
ddtpKEpx2d = diff(pKEpx2d,x1)*x1d+ ...
             diff(pKEpx2d,x1d)*x1dd+ ...
             diff(pKEpx2d,x2)*x2d + ...
             diff(pKEpx2d,x2d)*x2dd;
pKEpx2 = diff(KE,x2);
pPEpx2 = diff(PE,x2);

eqx1 = simplify( ddtpKEpx1d - pKEpx1 + pPEpx1 - Px1);
eqx2 = simplify( ddtpKEpx2d - pKEpx2 + pPEpx2 - Px2);

Sol = solve(eqx1,eqx2,'x1dd,x2dd');
Sol.x1dd = simplify(Sol.x1dd);
Sol.x2dd = simplify(Sol.x2dd);

syms y1 y2 y3 y4
fx1=subs(Sol.x1dd,{x1,x1d,x2,x2d},{y1,y2,y3,y4})
fx2=subs(Sol.x2dd,{x1,x1d,x2,x2d},{y1,y2,y3,y4})


% 
% 
% 
% 
% 
