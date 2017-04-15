clc,clear all
%f = 'exp(1)^x-x-2'; %Сама функция
f= 'x^3-1.1*x-2.2*x+1.8'
%df=char(diff(sym(f))); %Производная
x0=-2;%Начало исследуемой области
x1=2;%Конец исследуемой области
x_tab=[];%Таблицы
y_tab=[];
n=0; %счетчик отрезков

e=0.001; %Погрешность
radical=[]; %массив значений X при F(x)=0
n1=0; %Счетчик корней

%Локализация
for i = x0:((x1-x0)/100):x1;
 x_tab(n+1)=i;
 y_tab(n+1)=Fx(f,i);
 n=n+1;
end

for i = 1:(n-2)
%Бисекция
    if (y_tab(i)*y_tab(i+1) < 0 )
     a=x_tab(i);
     b=x_tab(i+1);
     c=(a+b)/2;
        while ((b-a)>2*e)
            f1=Fx(f,a);
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

%clear i;clear a;clear b;clear f1;clear f2;clear x_tab;clear y_tab;clear c;
