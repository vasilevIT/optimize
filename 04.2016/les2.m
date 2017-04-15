

e=(1/2)*10^-4;
a=-3;
b=-2;
c=(a+b)/2;
x=(1/(c*c)-3);
n=1;
while ((abs(x-c)>e) && (n<50))
    
    c=x;
    x=(1/(c*c)-3);
    n=n+1;
end

f=abs(x-c);


