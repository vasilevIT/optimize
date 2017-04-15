
 
I = imread('moon.tif'); % pout.tif
I = uint16(I);
  %n = size(I,1);
  %m = size(I,2);
  %imshow(I);
  %title('Фото до');
  
%  I = rgb2gray(imread('autumn.tif'));%colors(rgb)
  %I = imresize(I,[206,206]);
  n = size(I,1);
  m = size(I,2);
  %imshow(I);
  %title('Фото до');
  H = [];
  n_h = 16;
  m_h = 16;
  k_h = 0.0025;
  for i = 1:n_h
     for j = 1:m_h
        H(i,j) = exp(-k_h*(pow2(i-n_h/2)+pow2(j-m_h/2)))^(5/6);
     end
  end
  
  F = fft2(I,size(I,1)+8,size(I,2)+8);
  %I2 = uint8(ifft2(F));
  %return;
  %дополняем нулями до size(G,1) ; size(G,2)
  %F = [zeros(n,m_h/2),F,zeros(n,m_h/2)];
  %F = [zeros(n_h/2,m+m_h);F;zeros(n_h/2,m+m_h)];
  
  %свертка
  G = H.*F;
  %G = zeros(n+m_h,m+m_h);
  %{
  for i = 1+ceil(m_h/2):n-ceil(n_h/2)
     for j = 1+ceil(m_h/2):m-ceil(m_h/2)
         temp = F(i-ceil(m_h/2):(i+ceil(m_h/2)-1),(j-ceil(m_h/2):(j+ceil(m_h/2)-1)));
         temp2 = conv2(H,temp,'same');
         G(i-ceil(m_h/2):(i+ceil(m_h/2)-1),j-ceil(m_h/2):(j+ceil(m_h/2)-1)) = temp2;
     end
  end
  %}
  %F = F(9:n+8,9:m+8);
  %X = ifft2(F);