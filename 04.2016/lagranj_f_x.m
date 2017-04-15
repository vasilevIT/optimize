function y=lagranj_f_x(P,value)
xx=value;
y=0;
w=length(P);
for i=1:w
    y=y+ xx^(w-i) * P(i);
end
