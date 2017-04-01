% 3 work
clc, clear all
%read signal
d = wavread('placebo.wav',100000);
d = d(:,1);
N = size(d,1);
g = 0.005;
%sound(d,46000);
%plot(abs(fft(d)));
h = [1,0.3,0.2,0.1,-0.1];
h_hard = [1,0.3,0.2,0.1,-1.1];
M = size(h,2);
y = [];

%changes
%plot(abs(fft(d)));
for i = 1:N
   y(i) = 0;
   for j = 1:M
       if ((i-j)>0)
          y(i) = y(i) + h(j)*d(i-j)*20;
       else
          y(i) = y(i) + 0; 
       end
   end
end

%generated noize
z=[];
for i = 1:N
   z(i) = y(i) + randn()*g;
end
%z = [1,2,3,4,5,6,7];
%N=7;
M=5;
%build V matrix
V = [];
q = floor(M/2);
smesh = -q+1;
for i = 1:N
    k = smesh;
   for j = 1:M
       if (k<1)
           V(i,j) = 0;
       else
           if (k>N)
            V(i,j) = 0;
           else
            V(i,j) = z(k);
           end
       end
       k = k + 1;
   end
   smesh = smesh + 1;
end
Vt = V';
u0 = inv(Vt*V);
u2 = u0(:,1:5) *Vt;
u = u2*d;
x = V*u;
%hold on;
%plot(abs(fft(z)));
sound(x ,32000);

% строим частотные характеристики и спектральную плотность сигнала

