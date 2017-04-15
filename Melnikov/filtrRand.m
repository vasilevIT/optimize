function x = filtrRand(y,i,len,a)
        x=0;
        n = ceil(len/2);
        for j=1:len
            x = x + a(j) * y(i-(j-n));
        end
end