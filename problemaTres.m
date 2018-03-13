function varargout = problemaTres(varargin)
% PROBLEMATRES MATLAB code for problemaTres.fig
%      PROBLEMATRES, by itself, creates a new PROBLEMATRES or raises the existing
%      singleton*.
%
%      H = PROBLEMATRES returns the handle to a new PROBLEMATRES or the handle to
%      the existing singleton*.
%
%      PROBLEMATRES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBLEMATRES.M with the given input arguments.
%
%      PROBLEMATRES('Property','Value',...) creates a new PROBLEMATRES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before problemaTres_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to problemaTres_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help problemaTres

% Last Modified by GUIDE v2.5 12-Mar-2018 19:46:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @problemaTres_OpeningFcn, ...
                   'gui_OutputFcn',  @problemaTres_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before problemaTres is made visible.
function problemaTres_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to problemaTres (see VARARGIN)

% Choose default command line output for problemaTres
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes problemaTres wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = problemaTres_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFalsaPosicion.
function btnFalsaPosicion_Callback(hObject, eventdata, handles)
% hObject    handle to btnFalsaPosicion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


syms x
j=exp(x)-4;
y=inline(j);
global xr error
xl=1;
xu=2;
tol=(0.5*(10^(2-4)));

falsaPosicion(y,xl,xu,tol);



set(handles.txtRfp3,'string', num2str(xr));
%disp(xr)
set(handles.txtEafp3,'string', num2str(error));
%disp(error)



% --- Executes on button press in btnIteracionPuntoFijo.
function btnIteracionPuntoFijo_Callback(hObject, eventdata, handles)
% hObject    handle to btnIteracionPuntoFijo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

syms x
cf=exp(x)-4;
cg=log(4);
f=inline(cf);
g=cg;
dg=diff(cg,x);
x=1.5;
tol=(0.5*(10^(2-4)));
if(abs(eval(dg))<1)
    
n=0;
error=100;
while(error>tol)
    n=n+1;
    aux=x;
    x=g;
error=abs( f(x) );
end
else
      x=0;
    disp('ingrese otra gx ')
    error=NaN;
end

set(handles.txtRip,'string',num2str(x));
%disp(x)

%%error me da cero nose por que debo de arreglarlo
%
%
set(handles.txtEaip,'string', num2str(error));
disp(error)


% --- Executes on button press in btnNewtonRaphson.
function btnNewtonRaphson_Callback(hObject, eventdata, handles)
% hObject    handle to btnNewtonRaphson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


clc;
global x error
syms x
cf=exp(x)-4;
f=inline(cf);
derivada=diff(cf,x);
df=inline(derivada);
tol=(0.5*(10^(2-4)));
x=1.5;
n=0;
disp(' n      x1      error');

NewtonR(n,x,f,df,tol);

set(handles.txtRnr3,'string',num2str(x));
set(handles.txtEanr3,'string', num2str(error));


% --- Executes on button press in btnMetodoGrafico.
function btnMetodoGrafico_Callback(hObject, eventdata, handles)
% hObject    handle to btnMetodoGrafico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%para saber con cual axes estamos trabajan
axes(handles.axes3);
%intervalo de valores que se graficarán en eje equis mediante un for
x= 10.3:0.01:50.3;
% ingreso de la funcion a evaluar 
y=exp(x)-4;
%get(handles.funci,'String');
% %funcion para calcular la raiz
 f=@(x)exp(x)-4;
plot(y,x);
%ezplot(handles.axes1,f,x);
hold on
grid on
xlabel('x')
ylabel('y')
title('e^x - 4 = 0')
plot(x,zeros(size(x)),'b');
plot(zeros(size(x)),x,'r');
raiz=fzero(f,[1,2]);
disp(raiz)
 set(handles.txtRg,'string', num2str(raiz));



% --- Executes on button press in btnBiseccion.
function btnBiseccion_Callback(hObject, eventdata, handles)
% hObject    handle to btnBiseccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


syms x
y=exp(x)-4;
f=inline(y);
global error xr
xl=1;
xu=2;
tol=(0.5*(10^(2-4)));

biseccion(f,xl,xu,tol);
set(handles.txtRb3,'string', num2str(xr));
set(handles.txtEab3,'string', num2str(error));

% --- Executes on button press in btnBack.
function btnBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
main;

