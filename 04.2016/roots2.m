function x=roots2(P)
    
    %производная
    proizv =polyder(P);
    k=1;
    n=1;
    y = [];
    for i = -100:0.1:100
        y(n) = proizv(1)*i + proizv(2);
        if ( ((round(y(n)*10)/10) <= 0.1) && ((round(y(n)*10)/10) >= -0.1) )
            x(k) = i;
            k = k+1;
        end
        n = n+1;
    end