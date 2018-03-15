function iteracionPF(g,x,dg,tol)
global error xo 
if(abs(eval(dg))<1)
    xo=x;
n=0;
error=100;
while(error>tol && isreal(g(xo))==true)
    disp([ n xo error])
    n=n+1;
    aux=xo;
    xo=g(xo);
error=abs(((xo-aux)/xo)*100);

end
if (isreal(g(xo))==false)
    error=NaN;
end
else
      xo=0;
    disp('ingrese otra gx ')
    error=NaN;
end

end