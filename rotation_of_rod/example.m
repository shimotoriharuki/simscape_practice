% スクリプトと中身とコメントを書く
clear
clf

A = [0 1; -5 -6];
B = [0; 1];
C = [1 0];
Q = [1 0; 0 1];
R = 1;

F = lqr(A, B, Q, R);

t = 0 : 0.01 : 4;
i = 0;
x0 = [1; 0];
for n = t
  i = i + 1;
  x = expm((A - B*F)*n) * x0;
  x1(i) = x(1, 1);
  x2(i) = x(2, 1);
end

hold on
plot(t, x1, t, x2)

Q = [100 0; 0 1];
R = 10;

F = lqr(A, B, Q, R);

t = 0 : 0.01 : 4;
i = 0;
x0 = [1; 0];
for n = t
  i = i + 1;
  x = expm((A - B*F)*n) * x0;
  x1(i) = x(1, 1);
  x2(i) = x(2, 1);
end

plot(t, x1, t, x2)
hold off