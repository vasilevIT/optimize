%indexF.m вычисляет индексы эффективность
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
     if (b(i)==0)%зеленые
            pareto(i)=1;
            table(i,3)=1;
            k=k+1;
     end
     if (b(i)>0 && b(i)<count*0.02)%желтые
         table(i,3)=0.9;
     end
     if (b(i)>=count*0.02 && b(i)<count*0.1)%оранжевые
         table(i,3)=0.75;
     end
     if (b(i)>=count*0.1)%красные
         table(i,3)=0.5;
     end
     table(i,4)=b(i);
end
f=table;
end
