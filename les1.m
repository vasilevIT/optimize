
an=0;
bn=3;
e=0.001;
while((bn+an)>2*e)
   c=(bn+an)/2;
   
   if ((4*(1-an*an))*((4*(1-c*c)))<0)
       bn=c;
   else
       an=c;
   end
end