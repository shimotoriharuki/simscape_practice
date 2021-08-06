clear

% シミュレーション
R = 5; %抵抗
L = 0.5^-3; %インダクタ
Ke = 4.385 * 10^-3; %回転定数[V / rad/s] 4.385 * 10^-3
Kt = 3.53 * 10^-3; %トルク定数 [Nm/A] 3.53 * 10^-3
m = 0.1;
l = 0.1;
J = (1/3)*m*l^2;
D = 0.01;

A = [-R/L, 0, Ke/L;
     Kt/D, 0, -J/D;
     Kt/J, 0, -D/J];
B = [1/L; 0; 0];
C = [0, 1 0];

dt = 0.01;
t = 0:dt:100;

x0 = [0; 0; 0];

x1 = [];
x2 = [];
x3 = [];
u = 5;
x = x0;
for n = t
   xd = A * x + B * u;
   x = x + xd * dt;
   
   x1 = [x1, x(1)];
   x2 = [x2, x(2)];
   x3 = [x3, x(3)];
end

figure(1)
plot(t, x1);
title('i');


figure(2)
plot(t, x2);
title('θ');

figure(3)
plot(t, x3);
title('dθ');

% 可制御性と可観測性
Uc = [B, A*B, A^2*B]
det(Uc)

Uo = [C; C*A; C*A^2]
det(Uo)