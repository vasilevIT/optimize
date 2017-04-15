function fx = dixomitr(P)
        result=0;
        a=-10;
        b=20;
        iter=0;
        res=0;
        e=0.00001;
        d=4*e;
        i=0;
        while (((d/2)>e) && (i<10))
            i=i+1;
            d=abs(b-a);%длина отрезка
            p1=a+d/4; %точка в первой "половинке"
            p2=a+d*3/4; %точка во второй "половинке"
            f1=P(1)*(p1)^2+P(2)*p1+P(3);
            f2=P(1)*(p2)^2+P(2)*p2+P(3);
            if ( f1 )>( f2 )
                a=a;
                b=a+d/2;
                fx=f1;
            else
                a=a+d/2;
                b=b;
                fx=f2;
            end
        end
        fx=(p1+p2)/2;
        %fprintf('Количество итераций: %g',i);
        %fprintf('корень: %g',(p1+p2)/2);