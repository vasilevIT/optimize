xi=linspace(0,20,100);
fx = [1 2 -12]
yi = polyval(fx,xi)
fx2 = [-3 15]
yi2 = polyval(fx2,xi)
 plot(xi,yi2)
 hold on
 plot(xi,yi)