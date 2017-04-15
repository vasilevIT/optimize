  I = imread('eight.tif');
  n = size(I,1);
  m = size(I,2);
  imshow(I);
  title('Фото до');
  figure;
  imhist(I);
  title('Гистограмма до');
  figure;
  
  h=[];
  k=255;
  for i = 1:k
    h(i) = 0;
  end
  for i = 1:n-1
    for j = 1:m-1
      h(round(I(i, j))+1) = h(round(I(i, j))+1) + 1;
    end
  end
  h(1) = h(1) / (n * m);
  for i = 2:k
    h(i) = h(i) / (n * m);
    h(i) = (h(i - 1) + h(i));
  end
  for i = 1:n-1
    for j = 1:m-1
      I(i, j) = h(round(I(i, j))+1)*k;
    end
  end
 
  %I = histeq(I);
  imhist(I);
  title('Гистограмма после');
  figure;
  imshow(I);
  title('Фото после');