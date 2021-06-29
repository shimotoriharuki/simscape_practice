clear

% 状態空間表現
m = 0.1;
d = 0.01;
L = 0.1;
I = (1/3)*m*L^2;

A = [0 1; 0 -d/I];
B = [0; 1/I];
C = [1 0];
D = 0;

u = 0;
x0 = [1; 0];
x = x0;
v = [0; 0];

% 拡大系
Ab = [A zeros(2, 1); -C 0];
Bb = [B; 0];

% 可制御性
Uc = [Bb Ab*Bb Ab^2*Bb];
det(Uc)

% ゲインを求める
p = [-5 -1+1i -1-1i];
K = place(Ab, Bb, p);
F = [K(1) K(2)];
k = -K(3);

% シミュレーション
dt = 0.01;
t = 0 : dt : 5;
z = 0;
r = 0;

x1 = [];
x2 = [];
for n = t
    dxb = Ab * [x; z] + Bb * u + [v; r];
    x = x + dxb(1:2, 1) * dt;
    z = z + dxb(3) * dt;
    u = -F*x + k*z;
    
    x1 = [x1 x(1)];
    x2 = [x2 x(2)];

end

plot(t, x1, t, x2)
