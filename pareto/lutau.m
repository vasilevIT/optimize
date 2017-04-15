%lutau.m
clear all
n=2;
q = [];
count=20;
table=zeros(2,count);
qq=zeros(2,count);
for i=1:count
   q = lptau(i,n);
   q(1) = q(1);
   q(2) = q(2);
   qq(1,i) = q(1);
   qq(2,i) = q(2);
   
   table(1,i) = f1(q(1),q(2));
   table(2,i) = f2(q(1),q(2));
end
table = sortrows(table');
pareto = markBad(table);
plot(linSv(pareto,0.5,0.5));
return;
tic%засекаем время работы алгоритма
table = indexF(table);
toc
for i=1:count%рисуем ЛП-сетку
    plot(qq(1,i),qq(2,i),'.','MarkerSize',8);
    hold on
end

ylabel('x2');
xlabel('x1');
figure


for i=1:count
    if(table(i,3)==1)%Парето точки, зеленый цвет
        plot(table(i,1),table(i,2),'.','MarkerSize',8,'color','green');
      end
      if(table(i,3)==0.9)%желтые цвет
        plot(table(i,1),table(i,2),'.','MarkerSize',8,'color','yellow');
      end
      if(table(i,3)==0.75)%оранжевый
        plot(table(i,1),table(i,2),'.','MarkerSize',8,'color',[255 ,165,0]/255);
       end
      if(table(i,3)==0.5)%красный
        plot(table(i,1),table(i,2),'.','MarkerSize',8,'color','red');
       end
   hold on
end

ylabel('F2(x1,x2)');
xlabel('F1(x1,x2)');
