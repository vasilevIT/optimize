
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

%{
A=[
    1,2,1,4;
    2,0,4,3;
    4,2,2,1;
    -3,1,3,2
    ];
B=[13;28;20;6];
%}


%{

A=[
    1,2,1,4;
    2,0,4,3;
    4,2,2,1;
    -3,1,3,2
    ];

B=[13;28;20;6];
%}
%{
A=[
    4,-1,1;
    2,6,-1;
    1,2,-3;
];

B=[
    4;7;0;
];
%}

%{

A=[
    4,-1,1;
    2,6,-1;
    1,2,-3;
];
B=[
    4;7;0;
];
%}

%{
for i=1:n
    for j=1:n
        if (i~=j)
         x(i)=-C(i,j)/C(i,i)*x(j);
        end
    end
    x(i)=x(i)+D(i)/C(i,i);
end
%}


% Метод Гаусса
clc,clear all; 

A=[
  4.51,-1.8,3.6;
  3.1,2.3,-1.2;
  1.8,2.5,4.6;
];

B=[
   -1.7;3.6;2.2;
];

n=size(A,1);

AB=[A,B];
disp(AB);

if(rank(A)==rank(AB))
     if (rank(A)==n)
                disp('Одно решение(совместна и определена)');   
                k=1;
                while k<=n
                   if(AB(k,k)==0)
                       disp('Ноль в диагонали!');
                       max=AB(1,k);
                       nmax=1;
                        for i=1:1:n
                            if max<=AB(i,k)
                                max=AB(i,k);
                                nmax=i;
                            end
                        end
                         temp=AB(k,:);
                          AB(k,:)=AB(nmax,:);
                         AB(nmax,:)=temp;
                   else
                         for i=k+1:n
                              M= AB(i,k)/AB(k,k);
                              AB(i,:)=AB(i,:) - M*AB(k,:);
                        
                         end
                     k=k+1;
                   end
                end
                disp(AB);
                %Обратный ход
                for i=n:-1:1
                  s=0;
                  x(i)=0;
                 for k=i:1:n
                     s=s+AB(i,k)*x(k);
                 end
                 x(i)=(AB(i,end)-s)/AB(i,i);
                end
                disp('Решения СЛАУ:');
                for i= 1:n
                   fprintf('x(%d)=%g ; ',i,x(i)); 
                end
     else
     disp('Система имеет больше одного решения(совместна, но неопределена');    
     end
else
     disp('Нет решений(несовместна)');    
end



for k=1:n
    if(A(k,k)==0)
                       disp('Ноль в диагонали!');
                       max=A(1,k);
                       nmax=1;
                        for i=1:1:n
                            if max<=A(i,k)
                                max=A(i,k);
                                nmax=i;
                            end
                        end
                         temp=A(k,:);
                          A(k,:)=A(nmax,:);
                         A(nmax,:)=temp;
    end
end




disp(' ');
e=input('Уточнение корней. Введите точность:');
n=size(A,1);
tA=A';
C=tA*A;
D=tA*B;
Cx=D;
x1=x;
m=1;
k=0;
x=[0,0,0];
x2=x;

while (m>e)
    k=k+1;
    if(k==100)
        break;
    end
    m=0; 
   for i=1:n
       sum=D(i);
       for j=1:(i-1)
         
                sum=sum-C(i,j)*x(j);% x(i)=x(i)-C(i,j)/C(i,i)*x(j);
           
       end
       
        for j=(i+1):n
           
                 sum=sum-C(i,j)*x2(j);%x(i)=x(i)-C(i,j)/C(i,i)*x2(j); 
            
        end
         x(i)=sum/C(i,i);
   end
   
    
    max=abs(x(1)-x2(1));
    for i=1:n
        if (max<abs(x(i)-x2(i))) 
                 max=abs(x(i)-x2(i));
        end
    end
    m=max;
   
    x2=x;   
end
    disp(' ');
    disp('Количество итераций:');
    disp(k);
     disp('Решения СЛАУ после уточнения:');
                for i= 1:n
                   fprintf('x(%d)=%g ; ',i,x(i)); 
                end

   
