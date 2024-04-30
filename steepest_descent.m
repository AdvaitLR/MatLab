clc
clear

f = @(x, y) 3*x^2 - 4*x*y + 2*y^2 + 4*x + 6;
g = @(x, y) [(6*x - 4*y + 4), (4*y - 4*x)];

A = zeros(5, 1);
B = zeros(5, 1);
C = zeros(5, 1);

A(1) = 0;
B(1) = 0;

for i = 2:5
    d = -g(A(i-1), B(i-1)) / norm(g(A(i-1), B(i-1)));
    fk = @(k) f(A(i-1) + k*d(1), B(i-1) + k*d(2));
    ak = fminbnd(fk, 0, 10000);
    A(i) = A(i-1) + ak*d(1);
    B(i) = B(i-1) + ak*d(2);
end

for i=1:5
    C(i) = f(A(i), B(i));
end

T = table(A, B, C);
disp(T);
