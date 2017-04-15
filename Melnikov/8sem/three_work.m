    % 3 work
    clc, clear all
    %read signal
    %[y,Fs] = audioread('placebo.wav');
    len = 100000;
    Fs = 32000;
    y = wavread('placebo.wav',len);
    
    d = y(1:len,1);
    N = size(d,1);
    g = 0.005;
    %sound(d,46000);
    %plot(abs(fft(d)));
    h = [1,0.3,0.2,0.1,-0.1];
    h_hard = [1,0.3,-0.2,0.1,-1.1];
    %h = h_hard;
    M = size(h,2);
    y = [];

    %changes
    %and generated noize
    z=[];
    for i = 1:N
       y(i) = 0;
       for j = 1:M
           if ((i-j)>0)
              y(i) = y(i) + h(j)*d(i-j);
           else
              y(i) = y(i) + 0; 
           end
       end
    end
    
    for i = 1:N
       z(i) = y(i) + randn()*g;    
    end
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
    u2 = u0(:,1:M) *Vt;
    u = u2*d;
    x = V*u;
    %hold on;
    %plot(abs(fft(z)));
    %sound(x ,32000);
    % строим частотные характеристики и спектральную плотность сигнала
    figure
    plot(abs(fft(d)));
    hold on
    plot(abs(fft(x)));

    figure 
    [q1,z1] = freqz(h);
    [q2,z2] = freqz(u);
    plot(real(z1),real(q1),real(z2),real(q2));
    legend('Искажающий фильтр, H', 'Восстанавливающий фильтр, Y');
    xlabel('w');
    ylabel('|H|');

