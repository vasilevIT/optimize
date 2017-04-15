n=100;
M=[];
f = inline('cos(0.5*x)^2 + 2*y*cos(0.5*x) + y^2');
myRand = [];
for i=1:n
    myRand(i) = randn();
end
sum=0;
for i=1:n
    sum = sum + f(i,myRand(i));
end

