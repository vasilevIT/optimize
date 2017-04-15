
clc,clear
%x=[1,3,4];
%f_x=[12,4,6];
x=[0,1,2,3,4,5,6,7,8];
f_x=[1,1.8,2.2,1.4,1,0,3,5,3];


%кусочно-полиномиальна€ интерпол€ци€
points=length(x)*20-20;
a=x(1);
b=x(length(x)); 
z=1;
 distant=[];
 distant_y=[];
 m=1;
 pl=[];
 pl_y=[];
 f=false;
for i=1:length(x)
   
     distant(z)=x(i);
    distant_y(z)=f_x(i);
    if (z==3)
        pl_y(((m-1)*61+1):(m*61))=piece_poli(distant, distant_y);
        points=points+20;
      
        if(f)
           points=points+1; 
        end
          f=true;
        disp(distant);
        distant=[];
        distant_y=[];
        z=1;
        m=m+1;
         distant(z)=x(i);
         distant_y(z)=f_x(i);
    end
    z=z+1;
    
end
pl=a:(b-a)/points:b;
plot(pl,pl_y);




%{
xi=linspace(x(1),x(length(x)),100);
yi=interp1(x,f_x,xi,'spline');
figure; 
plot(xi,yi)
%}
