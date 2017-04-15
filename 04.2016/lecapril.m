xi=linspace(-5,10,100);
fx = [-2 12]
yi = polyval(fx,xi)
fx2 = [-3 15]
yi2 = polyval(fx2,xi)
 plot(xi,yi2)
 grid on
 hold on
 plot(xi,yi)
 x0=linspace(0,25,100);
 
 x00=linspace(0,10,100);
 y0 = zeros(size(x0));
 hold on
 plot(x00,y0,'red');
 hold on
 plot(y0,x0,'red');
 hold on

fill([0,10,0],[0,5.5,12.5], 'b')