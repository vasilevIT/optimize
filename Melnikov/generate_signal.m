function f = generate_signal(t)
%    t=0.5;
    a = 0.1;
    len = 200/t;
    for i=1:len
       x(i) = cos(a*t*i) + cos(2*t*i) + 2; 
    end
    f=x;
end