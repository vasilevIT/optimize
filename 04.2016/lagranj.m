function [C,L] = lagranj(X,Y)
w=length(X);
n=w-1;
L=zeros(w,w);
%Формирование коэффициентов
for k=1:n+1
    V=1;
    for j=1:n+1
       if (k~=j)
          V=conv(V,poly(X(j)))/(X(k)-X(j));
       end
    end
    L(k,:)=V;
end
C=Y*L;