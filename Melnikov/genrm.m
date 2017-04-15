function r = genrm(n)
    r=[];
    x = ceil(n/2);
    for i=1:n
       r(i) = 1/2 * cos(0.1*abs(x-i)); 
    end
    r = r';
end