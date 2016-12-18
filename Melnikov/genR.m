function R = genR(n,G)
    R=[];
    for i=1:n
        for j=1:n
            if(i==j)
                R(i,j) = 1/2 * cos(0.1*(j-i)) + G^2;
            else
                R(i,j) = 1/2 * cos(0.1*(j-i));
            end
        end
    end
    
end