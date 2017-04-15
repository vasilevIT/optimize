clc,clear all
f = imread('moon.tif');

  H = [];
  n_h = 16;
  m_h = 16;
  
%h = fspecial('gaussian');
  k_h = 0.0025;
  for i = 1:n_h
     for j = 1:m_h
        t = -k_h*((i-n_h/2)^2-(j-m_h/2)^2)^(5/6);
        H(i,j) = exp(t);
     end
  end
PQ = (size(f));
F = fft2(double(f), PQ(1), PQ(2));
H2 = fft2(double(H), PQ(1), PQ(2));
G = H2.*F./150;%без деления - белая картинка
ffi = ifft2(G);
%imshow(F_fH)
%figure
X = uint8((ffi));
imshow(X);

F2 = [];
k=-120;
for i = 1:PQ(1)
    for j = 1:PQ(2)
        F2(i,j) = (1/H2(i,j) * H2(i,j)^2/(H2(i,j)^2+k))*G(i,j);
    end
end
F2 = ifft2(F2);
F2=F2(1:size(f,1), 1:size(f,2));
figure, imshow(uint8(abs(F2)),[]);
%% 
