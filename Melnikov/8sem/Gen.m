function [Y,X]= Gen(B,x0,xn,h)
xn=xn/h-x0;
X(1:xn,1:4)=0;
dh=h;
Y(1:xn)=0;
for i=1:xn
    X(i,1)=1; X(i,2)=dh;X(i,3)=dh^2; X(i,4)=dh^3;
    Y(i)=B(1)+X(i,2)*B(2)+X(i,3)*B(3)+X(i,4)*B(4)+randn()*0.01;
    dh=dh+h;
end
