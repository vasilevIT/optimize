function fx = bes(y_tab)
for i = 1:size(y_tab)
%Бисекция
    if (y_tab(i)*y_tab(i+1) < 0 )
     a=x_tab(i);
     b=x_tab(i+1);
     c=(a+b)/2;
        while ((b-a)>2*e)
            f1=;%Fx(f,a);
            f2=Fx(f,c);
          if ( f1*  f2<0)
                b=c;
          else
                 a=c;
          end
          c=(a+b)/2;
        end 
         radical(n1+1)=c;
         n1=n1+1;
    end
end

fprintf('Всего корней %d. \nКорни равны:',n1);
for i=1:n1
   fprintf('%g ; ',radical(i)); 
end
fprintf('\n'); 