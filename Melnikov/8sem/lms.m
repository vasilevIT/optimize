function lms()
N=10000;
X(1:N)=0;
d(1:N)=0;
Y(1:N)=0;
for i=1:N
    X(i)=sin((2*40*pi)/N*i);
    d(i)=cos((2*40*pi)/N*i);
end;
Xls(1:N,1:5)=0;
Xls(1:N,1)=X(1:N);
Xls(2:N,2)=X(1:N-1);
Xls(3:N,3)=X(1:N-2);
Xls(4:N,4)=X(1:N-3);
Xls(5:N,5)=X(1:N-4);

Xinv_ls=inv(Xls'*Xls);
Cls=Xinv_ls*Xls'*d(:);
Yls=Xls*Cls;
u = 0.4;            
ha = adaptfilt.lms(5,u,1,[0,0,0,0,0]);
[y,e] = filter(ha,X,d);
subplot(2,1,1);
hold on
plot(Yls,'r');
plot(X,'b');
plot(d,'g:');
 B=[7.8850   ; 3.9257  ; -0.0260 ;  -3.9677 ;  -7.8968];
legend('output signal','input signal','desired signal');
hold off
subplot(2,1,2);
hold on
plot(y,'r');
plot(X,'b');
plot(d,'g');
legend('output signal','input signal','desired signal');
hold off
disp('Коэффициенты LS');
disp(Cls');
disp('Коэффициенты LMS');
disp(ha.Coefficients);
end