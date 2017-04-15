clc; clear all; close all;
f = fopen('x.dat','r') ;
x = fread( f, 'double') ;
fclose(f);
figure
plot(abs(fft(x)));
title('АЧХ до фильтрации');
n = 128;
H=[];
H(1:n/6) = 1;
H(n/6+3:n-n/6) = 0;
H(n-n/6+2:n) = 1;
H=H(:);
H = H .* cos(pi*(0:n-1))';
h = ifft(H);
b=h(:);
a = 0.5;
ham=[];
for i=-(n)/2-0.00001:(n)/2+0.00001-1
ham(length(ham)+1) =a+ (1-a)*cos((2*pi*i)/n);
end
ham = ham(:);
y1=[];
figure
plot(abs(fft(b,n*4)));
title('До применения окна');
b = b.* ham;
figure
plot(abs(fft(b,n*4)));
title('После применения окна');
for i=n+2:length(x)
    y1(i)=0;
   for k=1:n
      y1(i) = y1(i) + b(k)*x(i-k-1); 
   end
end
y1 = y1(:);
figure
plot(abs(fft(y1)));
title('АЧХ после фильтрации');
sound(y1,32000);