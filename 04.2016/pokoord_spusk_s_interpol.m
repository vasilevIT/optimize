%% ћетод циклического покоординатного спуска с параболической интерпол€цией
clc,clear all
a = [3,3]; 
y=0.0;
h=0.0;
e=0.0;
l=0.0;
b=0.0;
c=0.0; 
i=0;
n=0;
 n=2;
% S=input('введите начальный шаг поиска','s');%writeln('введите начальный шаг поиска'); readln(h);
 h = 0.5;%str2num(S);
e = 0.001;%input('¬велиие точность');%writeln('введите точность '); readln(e);
%{
for i = 1:n
    S = input('введите начальные x() = ','s');%('введите начальные x',i,'=');
    a(i) = str2num(S);
    %readln(a[i]); 
end;
%}
l = h;
%LABEL l1;
xxx=0;
while (true)
    for i = 1:n 
        b =0.9E38;
        nn=0;
        while(true)
            while(true)
                a(i) = a(i)+h;
                y = f2(a(1),a(2));
                c = b; b = y;
                if ( (y-c>=0) || (nn>20))
                    break;%goto (l2);
                end;
                nn=nn+1;
            end;
            h = -h/3;
            if (abs(h) < abs(l/3) || (nn>20))
                break;%goto(l2);
            end;
        end;
        h = l; 
    end;
    l = l/9; 
    h = l;
    if ((e/9>l) || (xxx>40))
        break;%goto (l1);
    end
end
%writeln('fmin=',y:4:10);
fprintf('fmin=',y:4:10);
for i = 1:n

    fprintf('xex');
    fprintf('x min=',a(i):4:10); 
    %fprintf();
end;
