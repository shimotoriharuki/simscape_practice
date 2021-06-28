%{
syms theta(t) L m

dth = diff(theta, t)
Lagrangian = (L/4) * m * theta * (-sin(theta) + cos(theta)) + (1/6) * m * L * dth^2 
Lagrangian = simplify(Lagrangian)

eq = functionalDerivative(Lagrangian, theta)==0
isolate(eq, dth)
chr = latex(eq)

assume(m,'positive')
assume(L,'positive')

eq = subs(eq, sin(theta), theta)

Sol = dsolve(eq,theta(0) == 0)
%}

syms m L theta(t) T D
I = (1/3) * m * L^2

ddtheta = diff(theta, t, t);
dtheta = diff(theta, t);

T = I * ddtheta + D * dtheta; % 運動方程式

assume(m,'positive')
assume(L,'positive')
Sol = dsolve(T, [theta(0) == 0 dtheta(0) == 0.1])

chr = latex(Sol)

%%
m = 0.1;
D = 0.01;
L = 0.1;
t = 0 : 0.001 : 1;

res = (L^2*m)/(30*D) - (L^2*m*exp(-(3*D*t)/(L^2*m)))/(30*D)

plot(t, res)

