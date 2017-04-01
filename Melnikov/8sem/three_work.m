% 3 work
clc, clear all
%read signal
d = sin(5*(0:pi/180:4))';%wavread('limp.wav',200000);

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
for i = M+1:N
   y(i) = 0;
   for j = 1:M
       y(i) = y(i) + h(j)*d(i-j);
   end
end

%generated noize
z=[];
for i = M+1:N
   z(i) = y(i) + randn()*g;
end
z = [1,2,3,4,5,6,7];
N=7;
M=6;
%build V matrix
V = [];
q = floor(M/2);
for i = 1:(M+1)
    
    k = 1;
    if (i>q)
      k = i-q;
    end
    for j = 1:N
        %zeros  
            if (ceil((j+i)/2)<=q)
                V(j,i) =  0;
            else
                if (k<=N)
                 V(j,i) =  z(k);
                 k = k + 1;
                else
                 V(j,i) =  0;
                end
                    
            end
    end
end

%hold on;
%plot(abs(fft(z)));
%sound(z,46000);

