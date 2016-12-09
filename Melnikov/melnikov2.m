t=0.01;
a = 0.1;
len = 200/t;
x=[];
z=[];
y=[];
for i=1:len
   x(i) = cos(a*t*i) + cos(2*t*i) + 2; 
end
y(1) =0;
z(1) = 0;
for i=1:len
   z(i+1) = z(i) + (x(i)-z(i)*2^(1/2) - y(i) )*t;
   y(i+1) = y(i) + z(i)*t;
end
hold off
plot(0:t*50:len*t - t*50,y(1:50:len));
hold on
%цифра
t=0.5;
a = 0.1;
len = 200/t;
u = 1/tan(1/4);
A = u^2 - sqrt(2) + 1;
B = 2*(1-u^2);
%C = u^2 + sqrt(2)*u + 1;
C = u^2 + sqrt(2) + 1;
z=[];
y=[];
for i=1:len
   x(i) = cos(a*t*i) + cos(2*t*i) + 2; 
end
y(1) =0;
y(2) =0;
for i=3:len
 y(i) = (1/C) *(x(i-2) + 2*x(i-1) + x(i) - B*y(i-1) - A*y(i-2));
end
plot(0:t:len*t - t,y);
figure
%вычислительная 
freqs(1,[1,sqrt(2),2])
figure
%цифра
freqz([1,2,1],[C,B,A])
%TODO построить частотную характеристику двух систем
% fregs
%fregz