
function NewtonR(n,x,f,df,tol)
global x error
error=100;

while(error>tol)
    fprintf('\t%i\t%3.5f\t%f\n',n,x,error);
n=n+1;
aux=x;
x=x-(f(x)/df(x));
    error= abs(((x-aux)/x)*100);
end
end
