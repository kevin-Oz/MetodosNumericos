
function NewtonR(n,x,f,df,tol)
global  error xo;
error=100;
xo=x;
while(error>tol)
    fprintf('\t%i\t%3.5f\t%f\n',n,xo,error);
n=n+1;
aux=xo;
xo=xo-(f(xo)/df(xo));
    error= abs(((xo-aux)/xo)*100);
   
end


end
