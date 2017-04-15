clc,clear all
I=imread('onion.png');
I=rgb2gray(I);
imshow(I)
PQ = paddedsize(size(I));
D0 = 0.05*PQ(1);
%вычисляем искажения
H = [];
n_h = PQ(1);
m_h = PQ(2);
%искажение атмосферы
k_h = 0.00025;
for i = 1:n_h
 for j = 1:m_h
    t = -k_h*((i-n_h/2)^2-(j-m_h/2)^2)^(5/6);
    H(i,j) = exp(t);
 end
end
%H = lpfilter('gaussian', PQ(1), PQ(2), D0);
F=fft2(double(I),size(H,1),size(H,2));
% искажения
N = [];
for i = 1:n_h
 for j = 1:m_h
     N(i,j) = randn()*0.5;
 end
end
G = H.*F + N;
% получаем обратно картинку
LPF_I=real(ifft2(G));

% обрезаем до исходного размера
LPF_I=LPF_I(1:size(I,1), 1:size(I,2));
%выводим картинку

figure, imshow(LPF_I, [])

% спектр
Fc=fftshift(F);
Fcf=fftshift(G);
S1=log(1+abs(Fc));
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])
F2 = [];
k=0.000025;
%после апроксимации получаем:
for i = 1:size(H,1)
    for j = 1:size(H,2)
        F2(i,j) = (1/H(i,j) * H(i,j)^2/(H(i,j)^2+k))*G(i,j);
    end
end
F2 = ifft2(F2);
% спектр
Fcf2=fftshift(fft2(F2));
S3=log(1+abs(Fcf2));
figure, imshow(S3,[])
F2=F2(1:size(I,1), 1:size(I,2));
% изображение
figure, imshow(real(F2),[]);