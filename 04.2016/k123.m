function f = k123(x1,x2)
%% ����� ������������ ��������������� ������ � �������������� �������������
n = 2;
if (x1==0)
    x1=3;
end 
if (x2==0)
    x2=3;
end 
h = 0.5;
y=0.0;
yy=[];
xx=[];
h=0.5;
e=0.1;
i = 2;
mixarr=[x1,x2,f2(x1,x2)];
while(true)
    %����� �� x1
    x1 = mixarr(i-1,1);
    x2 = mixarr(i-1,2);
    y1 = f2(mixarr(i-1,1),mixarr(i-1,2));
    yy(1)=y1;
    xx(1) = x1;
    y2 = f2(mixarr(i-1,1)-h,mixarr(i-1,2));
    
    if (y2>y1)
         x1=x1-h;
         yy(2)=y2;
         xx(2) = x1;
        y3 = f2(x1-h,x2);
        yy(3) = y3;
         x1=x1-h;
    xx(3) = round(x1*100)/100;%x1;
       
    else
        y2 = f2(x1+h,x2);
        x1=x1+h;
    xx(2) = x1;
        y3 = f2(x1+h,x2); 
         yy(2)=y2;
         yy(3) = y3;
        x1=x1+h;
    xx(3) = round(x1*100)/100;
    end
    %������ ������� �� xx,yy
    %{
    fprintf('����� ������ �� ������ :');
    fprintf('%g ',xx)
    fprintf(' , ');
    fprintf('%g ',yy)
    fprintf('\n\n');
    %}
    koff = lagranj(xx,yy);%polyfit(xx,yy,2);
    
    %�����������
    %proizv =polyder(koff);
    %roots2 = fzero(proizv);
    %z = linspace(-5, 5, 100);
    %yy1 = polyval(koff,z);
    %plot(z,yy1);
   % clear roots
    extremums = dixomitr(koff);
    minn = real(max(extremums));
    x1=round(minn*100)/100;
    mixarr(i,1) = x1;
    mixarr(i,2) = x2;
    mixarr(i,3) = f2(mixarr(i,1),mixarr(i,2));
    i=i+1;
    %{
    if (i == 5)
     break;
    end
    %}
    
    %����� x2
    y1 = f2(x1,x2);
    yy2(1)=y1;
    xx2(1) = x2;
    y2 = f2(x1,x2-h);
    if (y2>y1)
         x2=x2-h;
         yy2(2)=y2;
         xx2(2) = x2;
         x2=x2-h;
         y3 = f2(x1,x2);
         yy2(3) = y3;
         xx2(3) = round(x2*100)/100;
    else
        y2 = f2(x1,x2+h);
        x2=x2+h;
        xx2(2) = x2;
        y3 = f2(x1,x2+h); 
         yy2(2)=y2;
         yy2(3) = y3;
        x2=x2+h;
    xx2(3) = round(x2*100)/100;
    end
    
    %������ ������� �� xx2,yy2
    %{
    fprintf('����� ������ �� ������ 2:');
    fprintf('%g ',xx2)
    fprintf(' , ');
    fprintf('%g ',yy2)
    fprintf('\n\n');
    %}
    koff = lagranj(xx2,yy2);%polyfit(xx2,yy2,2);
   % break;
    extremums = dixomitr(koff);
    minn = real(min(extremums));
    x2=minn;
    mixarr(i,1) = x1;
    mixarr(i,2) = x2;
    mixarr(i,3) = f2(mixarr(i,1),mixarr(i,2));
   % break;
   %{
    if (i == 5)
     break;
    end
    %}
    if ( f2(mixarr(i,1),mixarr(i,1)) - f2(mixarr(i-1,2),mixarr(i-1,2)) <= abs(e) )
        break;
    end
    i=i+1;
end
fprintf('X=(%g ; %g)\n',mixarr(i-1,1),mixarr(i-1,2));
fprintf('F(X) = %.4f\n',f2(mixarr(i-1,1),mixarr(i-1,2)));
figure('Units', 'normalized', 'OuterPosition', [0.25 0 0.75 1]);
plot(mixarr(:,1),mixarr(:,2),'red','LineWidth',2);

legend( '�����' );
grid on
hold on
for i=1:size(mixarr)
   
    siz = size(mixarr);
    siz = siz(1);
    r=sqrt( (mixarr(siz,1)-mixarr(i,1))^2 + (mixarr(siz,2)-mixarr(i,2))^2 );%-mixarr(i,1)+mixarr(siz,1);
    Centr = [mixarr(siz,1),mixarr(siz,2)];
    t=[0:pi/180:2*pi]; % ��� ���� 
    x=r*cos(t)+Centr(1); 
    y=r*sin(t)+Centr(2); 
    plot(x,y,'black --','LineWidth',0.2); 
    hold on
   % break;
end

r=0.001;
    Centr = [mixarr(siz,1),mixarr(siz,2)];
    t=[0:pi/180:2*pi]; % ��� ���� 
    x=r*cos(t)+Centr(1); 
    y=r*sin(t)+Centr(2); 
    plot(x,y,'black --','LineWidth',0.2); 
    hold on
    





