clc
clf
clear

R = 5;              % [ohm]
L = 10 * 10^-3;    % [H]
m = 0.1;            % [kg]
l = 0.1;            % [m]
J = 1/3 * (m * l^2);% [kg * m^2]
ke = 4 * 10^-3;  % [V / (rad/s)] 4.35 * 10^-3
kt = 3 * 10^-3;  % [Nm / A] 3.53 * 10^-3
D = 0.001;          % 減衰係数
G = 10;            % 減速比

A = [-R / L, 0, -ke * G / L;
     0, 0, 1;
     kt * G / J, 0, -D / J];
B = [1 / L;
     0;
     0];
C = [0, 1, 0];

dt = 0.001;
t = 0 : dt : 10;
x0 = [0; 0; 0];

x1 = [];
x2 = [];
x3 = [];
x = x0;
u = 1;
for n = t
%     x = expm(A * n)  * x0;
    dx = A * x + B * u;
    x = x + dx * dt;
    
    x1 = [x1, x(1)];
    x2 = [x2, x(2)];
    x3 = [x3, x(3)];
    
end

figure(1)
plot(t, x1)
legend('i')

figure(2)
plot(t, x2)
legend('θ')

figure(3)
plot(t, x3)
legend('dθ')
    