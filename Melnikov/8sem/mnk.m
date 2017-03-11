%{
1. Сгенерировать данные, добавив к ним шум
2. Построить систему уравнений(уравнение для каждой точки)
3. Решить задачу МНК и получить коэффициенты полинома
4. Вывести график нашей функции и найденной функции
%}
clc, clear all
N=500;
x1 = 0 ;
x2 = 10;
h = 0.01;
x = [];
y1 = [];
y = [];
k = 0;
b = [2,3.5,188.1,-38.7]';
myF=@(x)(b(1) + b(2)*x + b(3)*x^2 + b(4)*x^3);
for i = 1:N
    x(i) = k;
    y1(i) = myF(k);
    y(i) = myF(k) + randn()*10;
    
    k = k + h;
    
end
plot(x,y1);
hold on
plot(x,y)

%строим матрицу X, B, Y
X = zeros(N,4);
B = [0,0,0,0];
Y = [];
k = 0;
for i = 1:N
    X(i,1:4) = [1,k,k^2,k^3];
    Y(i) = y(i);
    k = k + h;
end
Y = Y';
B = inv(X'*X)*X'*Y;
[Q,R] = qr(X);
QY = (Q'*Y);
QY = QY(1:4);
B_QR = inv(R(1:4,1:4))*QY;%R\(Q'*Y);

k = 0;
myF2=@(x)(B_QR(1) + B_QR(2)*x + B_QR(3)*x^2 + B_QR(4)*x^3);
for i = 1:N
    x2(i) = k;
    y2(i) = myF2(k);
    k = k + h;
    
end
hold on
plot(x2,y2)

[U,S,V] = svd(X);
X_SVD = U*S*V';
UY = U'*Y;
B_SVD = V*inv(S(1:4,1:4))*UY(1:4);

