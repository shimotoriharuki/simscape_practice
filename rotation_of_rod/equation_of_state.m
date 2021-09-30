clear

m = 1;
d = 0.01;
L = 0.1;
I = (1/3)*m*L^2;

A = [0 1; 0 -d/I];
B = [0; 1/I];
C = [1 0];
D = 0;

% sys = ss(A, B, C, D);

Uc = [B A*B]
det(Uc)

Uo = [C; C*A]
det(Uo)

x0 = [0; 0];

dt = 0.01;
t = 0:dt:1;
u = 1;

x = x0;
i = 0;
for n = t
    i = i + 1;
%     x = expm(A * n) * x0;
    dx = A * x + B * u; % 状態空間表現を用いて状態変数の微分を計算
    x = x + dx * dt; % 状態変数の微分を積分して状態変数を計算
    x1(i) = x(1);
    x2(i) = x(2);

end

plot(t, x1, t, x2)
legend('θ', 'dθ');