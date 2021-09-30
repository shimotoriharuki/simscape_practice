clear

% 状態空間表現
m = 0.1;
d = 0.01;
L = 0.1;
I = (1/3)*m*L^2;

A = [0 1; 0 -d/I];
B = [0; 1/I];
C = [1 1];
D = 0;


% 拡大系
Ab = [A zeros(2, 1); -C 0];
Bb = [B; 0];

% 可制御性
Uc = [Bb Ab*Bb Ab^2*Bb];
if det(Uc) ~= 0
    disp('可制御である')
else
    disp('可制御でない')
end


% ゲインを求める
% p = [-5 -1+1i -1-1i];
% Gain = place(Ab, Bb, p);

Q = [0.1 0 0; 0 0.1 0; 0 0 10];
R = 10000;
Gain = lqr(Ab, Bb, Q, R);

f = [Gain(1) Gain(2)]; %状態フィードバックゲイン
k = -Gain(3);  % サーボ系のゲイン

% シミュレーション
dt = 0.01;
t = 0 : dt : 10;
z = 0; % 偏差の積分
r = 1; % 目標値
v = [0; 0]; % 外乱
x0 = [0; 0]; % 初期値
u = 0; % 入力の初期値

x1 = [];
x2 = [];
u1 = [];
x = x0;
for n = t
    dxb = Ab * [x; z] + Bb * u + [v; r];
    x = x + dxb(1:2, 1) * dt;
    z = z + dxb(3) * dt;
    u = -f*x + k*z;
    
    x1 = [x1 x(1)];
    x2 = [x2 x(2)];
    u1 = [u1 u];

end

figure(1);
plot(t, x1, t, x2)
legend('θ', 'dθ')

figure(2)
plot(t, u1)
legend('u')
