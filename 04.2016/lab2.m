% Метод Гаусса
clc,clear all; 
%n=input('Введите разрядность матрицы: ');
%{
for i= 1:n
   for j=1:n
       fprintf('A[%d,%d]=',i,j);
       A(i,j)=input('');
   end
end
for i = 1:n
    fprintf('B[%d]=',i);
       B(i,1)=input('');
end
%}


A=[
    1,2,1,4;
    2,0,4,3;
    4,2,2,1;
    -3,1,3,2
    ];
B=[13;28;20;6];
n=4;
r=size(A,1);
%obrA = inv(A);
%ravno= obrA * B;
%disp('Матричный метод\n');disp(r);
%disp(ravno);
AB=[A,B];
disp(AB);

if(rank(A)==rank(AB))
     if (rank(A)==r)
                disp('Одно решение(совместна и определена)');   
                k=1;
                while k<=r
                   if(AB(k,k)==0)
                       disp('Ноль в диагонали!');
                       max=AB(1,k);
                       nmax=1;
                        for i=1:1:r
                            if max<=AB(i,k)
                                max=AB(i,k);
                                nmax=i;
                            end
                        end
                         temp=AB(k,:);
                          AB(k,:)=AB(nmax,:);
                         AB(nmax,:)=temp;
                   else
                         for i=k+1:r
                              M= AB(i,k)/AB(k,k);
                              AB(i,:)=AB(i,:) - M*AB(k,:);
                        
                         end
                     k=k+1;
                   end
                end
                disp(AB);
                %Обратный ход
                for i=r:-1:1
                  s=0;
                  x(i)=0;
                 for k=i:1:r
                     s=s+AB(i,k)*x(k);
                 end
                 x(i)=(AB(i,end)-s)/AB(i,i);
                end
                disp('Решения СЛАУ:');
                for i= 1:r
                   fprintf('x(%d)=%g ; ',i,x(i)); 
                end
     else
     disp('Система имеет больше одного решения(совместна, но неопределена');    
     end
else
     disp('Нет решений(несовместна)');    
end


   
