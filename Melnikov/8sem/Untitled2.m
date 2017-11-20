B=[2,3.5,188.1,-38.7]; 
X0=0;Xn=10;
h=0.1; 
[Y,X]=Gen(B,X0,Xn,h);
X0(1:100)=0;
for i=1:100
    X0(i)=i;
end
Y=Y(:);

Xinv=inv(X'*X)
Bt=Xinv*X'*Y
plot(X0,Y);