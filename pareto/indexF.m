function f = indexF(table)
 %вычисляем b(i)
 count = length(table);
b = zeros(1,count);
pareto = zeros(count,1);
k=0;
for i=1:count
    
    for j=1:count
        if(i~=j)
            if (((table(i,1)>table(j,1)) && (table(i,2)>table(j,2)) ))
                b(i) = b(i) + 1;
            end
        end
    end
     if (b(i)==0)
            pareto(i)=1;
            k=k+1;
     end
end
pareto2=zeros(k,2);
m=1;
for i=1:count
    if (pareto(i)==1)
       pareto2(m,1) = table(i,1);  
       pareto2(m,2) = table(i,2);
       m = m+1;
    end
end
f=pareto2;
end