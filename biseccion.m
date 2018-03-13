function biseccion(f,xl,xu,tol)
global error xr
xr=0;
if ((f(xu)*f(xl))>0)%sentencia de control para descartar el intervalo
    disp(' ')
    disp('Intervalo no valido para hallar la raiz')
    error=0.0001;
    xr=NaN;
end
%se inicia el metodo de biseccion, con un ciclo en este caso while y
error=100;
while (abs(error)>tol)
    aux=xr;
    xr=(xl+xu)/2;
    fxl=f(xl); %se evalua la funcion en XL
    fxr=f(xr); %se evalua la funcion en Xr
    h=fxl*fxr; %se multiplican los reultados para f(Xr)*f(XL)
    if (h<0)     %sentencias condicionales para definir los nuevos limites.
        xu=xr;
    elseif(h>0)
        xl=xr;
    else
        error=0.000001;  %en caso de que h=0 se terminan las iteraciones
    end
    error= abs( f(xr) );
    %((xr-aux)/xr)*100; %se calcula el error relativo aproximado
     %disp([xr  error])
   
end
end