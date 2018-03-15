function varargout = problemaCinco(varargin)
% PROBLEMACINCO MATLAB code for problemaCinco.fig
%      PROBLEMACINCO, by itself, creates a new PROBLEMACINCO or raises the existing
%      singleton*.
%
%      H = PROBLEMACINCO returns the handle to a new PROBLEMACINCO or the handle to
%      the existing singleton*.
%
%      PROBLEMACINCO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBLEMACINCO.M with the given input arguments.
%
%      PROBLEMACINCO('Property','Value',...) creates a new PROBLEMACINCO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before problemaCinco_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to problemaCinco_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help problemaCinco

% Last Modified by GUIDE v2.5 13-Mar-2018 03:46:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @problemaCinco_OpeningFcn, ...
                   'gui_OutputFcn',  @problemaCinco_OutputFcn, ...
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


% --- Executes just before problemaCinco is made visible.
function problemaCinco_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to problemaCinco (see VARARGIN)

% Choose default command line output for problemaCinco
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes problemaCinco wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = problemaCinco_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnFalsaPosiicon.
function btnFalsaPosiicon_Callback(hObject, eventdata, handles)
% hObject    handle to btnFalsaPosiicon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

syms x
j=4*sin(x)-exp(x);
y=inline(j);
global xr error
xl=0;
xu=0.5;
tol=(0.5*(10^(2-4)));

falsaPosicion(y,xl,xu,tol);


set(handles.txterr,'string', num2str(xr));
disp(xr)
set(handles.txtEafp,'string', num2str(error));
disp(error)



% --- Executes on button press in btnPuntoFijo.
function btnPuntoFijo_Callback(hObject, eventdata, handles)
% hObject    handle to btnPuntoFijo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global error xo
syms x
cf=4*sin(x)-exp(x);
cg=asin((exp(x)/4));
f=inline(cf);
g=inline(cg);
dg=diff(cg,x);

x=0.1;
tol=(0.5*(10^(2-4)));

iteracionPF(g,x,dg,tol);
set(handles.txtRipf,'string',num2str(xo));
%disp(x)
set(handles.txtEaipf,'string', num2str(error));




% --- Executes on button press in btnNewtonR.
function btnNewtonR_Callback(hObject, eventdata, handles)
% hObject    handle to btnNewtonR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



clc;
global xo error
syms x
cf=4*sin(x)-exp(x);
f=inline(cf);
derivada=diff(cf,x);
df=inline(derivada);
tol=(0.5*(10^(2-4)));
x=0.1;
n=0;
disp(' n      x1      error');

NewtonR(n,x,f,df,tol);

set(handles.txtRnr2,'string',num2str(xo));
set(handles.txtEanr2,'string', num2str(error));



% --- Executes on button press in btnMetodoGraf.
function btnMetodoGraf_Callback(hObject, eventdata, handles)
% hObject    handle to btnMetodoGraf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%para saber con cual axes estamos trabajan
axes(handles.axes5);
%intervalo de valores que se graficarán en eje equis mediante un for
x= -40.3:0.01:50.3;
% ingreso de la funcion a evaluar 
y=4*sin(x)-exp(x);
%get(handles.funci,'String');
% %funcion para calcular la raiz
 f=@(x)4*sin(x)-exp(x);
plot(y,x);
%ezplot(handles.axes1,f,x);
hold on
grid on
plot(x,zeros(size(x)),'b');
plot(zeros(size(x)),x,'r');
xlabel('x')
ylabel('y')
title('4senx = e^x')

raiz=fzero(f,[0,0.5]);
% %prueba en consola del valor de la raiz
% %disp(raiz)
% %se encarga de graficar la funcion en el intervalo de puntos dado
% 
% %pegar el resultado de la raiz en el cuadro de texto
 set(handles.txtRa,'string', num2str(raiz));
% %intento de graficar el eje (talves lo haga :v)
% %hold on


% --- Executes on button press in btnBiseccion.
function btnBiseccion_Callback(hObject, eventdata, handles)
% hObject    handle to btnBiseccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global error xr
syms x
y=4*sin(x)-exp(x);  
f=inline(y);
xl=0;
xu=0.5;
tol=(0.5*(10^(2-4)));

biseccion(f,xl,xu,tol);

set(handles.txtRb,'string', num2str(xr));
set(handles.txtEab,'string', num2str(error));

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
main;