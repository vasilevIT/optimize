%аналог
t = 0.01;
hold on;
y(1) =0;
z(1) = 0;
x = generate_signal(t);
len = size(x);
len = len(2);
for i=1:len
   z(i+1) = z(i) + (x(i)-z(i)*2^(1/2) - y(i) )*t;
   y(i+1) = y(i) + z(i)*t;
end
plot(0:t*50:len*t - t*50,x(1:50:len));
plot(0:t*50:len*t - t*50,y(1:50:len));
hold on
%цифра
t=0.5;
x = generate_signal(t);
len = size(x);len = len(2);
u = 1/tan(1/4);
A = u^2 - u*sqrt(2) + 1;
B = 2*(1-u^2);
C = u^2 + u*sqrt(2) + 1;
y=[];z=[];
y(1) =0;y(2) =0;
for i=3:len
 y(i) = (1/C) *(x(i-2) + 2*x(i-1) + x(i) - B*y(i-1) - A*y(i-2));
end
plot(0:t:len*t - t,y);
xlabel('t,сек');
ylabel('x');
legend('Unfilter signal','Analog filter','Digital filter');
figure
%аналоговая 
freqs(1,[1,sqrt(2),2])
figure
%цифра
freqz([1,2,1],[C,B,A])