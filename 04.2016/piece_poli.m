function [pl_y] = piece_poli(x,f_x)
P=lagranj(x,f_x);
a=x(1);
b=x(length(x)); 
pl=a:(b-a)/60:b;
pl_y=[];
k=1;
for i=a:(b-a)/60:b
    pl_y(k)=lagranj_f_x(P,i);
    k=k+1;
end