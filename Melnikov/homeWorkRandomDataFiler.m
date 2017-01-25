clc, clear all

t = 600;
x = [];
y = [];
myRand = [];
u = 0;
for i=1:t
    x(i) = cos(0.1*u);
    myRand(i) = randn();
    y(i) = x(i) + myRand(i);
    u = u + 1;
end
plot(x);
hold on;
plot(y);

%уравнение фильтрации
%расчет M
x_2=[];
%расчет матрицы R
R = zeros(3,3);
G = 1;
len = 64;%длина фильтра
R = genR(len,G);
r = genrm(len);
%нахождение коэффициентов a(1:3)
a = inv(R)*r;
%фильтрация
for i=1+len/2 : t-len/2
x_2(i) = filtrRand(y,i,len,a);
end
hold off
legend('y = cos(0.5x)','y = cos(0.5x) + randz()');
title('До фильтрации');
figure
plot(x);
hold on
plot(x_2);
legend('y = cos(0.5x)','Отфильтрованный сигнал');
title('После фильтрации');
