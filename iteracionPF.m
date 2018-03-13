function iteracionPF(g,x,dg,tol)
global error x
if(abs(eval(dg))<1)
    
n=0;
error=100;
while(error>tol)
    n=n+1;
    aux=x;
    x=g(x);
error=abs(((x-aux)/x)*100);
end
else
      x=0;
    disp('ingrese otra gx ')
    error=NaN;
end

end