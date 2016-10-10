function f = mat(table)
    m = 0;
    for i=1:length(table)
        m = m + table(1,i)*table(2,i);
    end
    f=m;
end