N=256;%����� �����
dt=T/(N-1);
t=linspace(0,N-1);%������� ������� �������
%f=exp(-t.^2);%���������� ���������� �������
%f = sin(2*pi/N*(0:N-1)*5);
f = 1/5*cos(pi/N*(0:N-1)*54) + cos(pi/N*(0:N-1)*10);
%f = hamming(128);
F=new_fft(f);%���������� �������������� �����
%Fx = fft(f);
subplot(211);
plot(f);%��������� �������� �������
subplot(212);
hold off;
plot(real(F));
hold on 
plot(ifft(F));
%plot(imag(Fx),'r-.');