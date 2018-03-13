function falsaPosicion(y,xl,xu,tol)
global xr error
xr=0;
error=100;
if ((y(xu)*y(xl))>0)%sentencia de control para descartar el intervalo
    disp(' ')
    disp('Intervalo no valido para hallar la raiz-')
    error=0.0001;
    xr=NaN;
else
    while (abs(error)>tol)
    aux=xr;
    fxl=y(xl); %se evalua la funcion en XL
    fxr=y(xr); %se evalua la funcion en Xr
%   disp(fxl)
  
    fxu=y(xu); %se evalua la funcion en xu
    we=(xl-xu);
    a=fxu*we;
    b=(fxl-fxu);
   xr = xu-(a/b);

    h=fxl*fxr;   %se multiplican los reultados para f(Xr)*f(XL)
    if (h<0)     %sentencias condicionales para definir los nuevos limites.
        xu=xr;
    elseif(h>0)
        xl=xr;
    end
    error=abs(((xr-aux)/xr)*100); %se calcula el error relativo aproximado
end
    
    
end




end