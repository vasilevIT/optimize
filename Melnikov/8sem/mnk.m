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

%строим матрицу X и столбец Y
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
%МНК

tic
B = inv(X'*X)*X'*Y;
t(1) = toc;
tic
[Q,R] = qr(X);
QY = (Q'*Y);
QY = QY(1:4);
%B_QR = inv(R(1:4,1:4))*QY;%R\(Q'*Y);
%решаем вручную
m=4;
B_QR = [];
for i = 1:m
   k=(m-i+1);
   temp= QY(k);
   for j = m:-1:k+1 
       temp = temp -  R(k,j)*B_QR(j);
   end
   B_QR(k) = (temp)/R(k,k);
end

t(2) = toc;
%или без цикла
%{
B_QR_HAND(4) = QY(4)/R(4,4);
B_QR_HAND(3) = (QY(3) - R(3,4)*B_QR_HAND(4))/R(3,3);
B_QR_HAND(2) = (QY(2) - R(2,4)*B_QR_HAND(4) - R(2,3)*B_QR_HAND(3))/R(2,2);
B_QR_HAND(1) = (QY(1) - R(1,4)*B_QR_HAND(4) - R(1,3)*B_QR_HAND(3) - R(1,2)*B_QR_HAND(2))/R(1,1);
%}
% решаем с помощью SVD
tic
[U,S,V] = svd(X,0);
X_SVD = U*S*V';
UY = U'*Y;
B_SVD = V*inv(S(1:4,1:4))*UY(1:4);

t(3) = toc;
k = 0;
myF2=@(x)(B_QR(1) + B_QR(2)*x + B_QR(3)*x^2 + B_QR(4)*x^3);
for i = 1:N
    x2(i) = k;
    y2(i) = myF2(k);
    k = k + h;
    
end

plot(x,y1,x,y,x2,y2);

legend('������','������+���','����� ���');
fprintf('�����:  ���. | ���  |  QR  | SVD\n');
for i=1:4
fprintf('b(%d)     %.2f | %.2f | %.2f | %.2f\n',i,b(i),B(i),B_QR(i),B_SVD(i)); 
end
t = t.*1000;
fprintf('����� �������(msec): ��� |  QR  | SVD\n');
fprintf('                    %.2f | %.2f | %.2f\n',t(1),t(2),t(3));
 