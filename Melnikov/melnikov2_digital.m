t=0.01;
a = 0.1;
len = 200/t;
u = 1/tan(1/2);
A = u^2 - sqrt(2) + 1;
B = 2*(1-u^2);
C = u^2 + sqrt(2) +1;
z=[];
y=[];
for i=1:len
   x(i) = cos(a*t*i) + cos(2*t*i) + 2; 
end
y(1) =0;
y(2) =0;
z(1) = 0;
for i=3:len
 y(i) = (1/C) *(x(i-2) + 2*x(i-1) + x(i) + B*y(i-1) - A*y(i-2));
end

plot(y);