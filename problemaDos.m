function varargout = problemaDos(varargin)
% PROBLEMADOS MATLAB code for problemaDos.fig
%      PROBLEMADOS, by itself, creates a new PROBLEMADOS or raises the existing
%      singleton*.
%
%      H = PROBLEMADOS returns the handle to a new PROBLEMADOS or the handle to
%      the existing singleton*.
%
%      PROBLEMADOS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBLEMADOS.M with the given input arguments.
%
%      PROBLEMADOS('Property','Value',...) creates a new PROBLEMADOS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before problemaDos_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to problemaDos_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help problemaDos

% Last Modified by GUIDE v2.5 11-Mar-2018 21:12:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @problemaDos_OpeningFcn, ...
                   'gui_OutputFcn',  @problemaDos_OutputFcn, ...
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


% --- Executes just before problemaDos is made visible.
function problemaDos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to problemaDos (see VARARGIN)

% Choose default command line output for problemaDos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes problemaDos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = problemaDos_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnMetbis.
function btnMetbis_Callback(hObject, eventdata, handles)
% hObject    handle to btnMetbis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



syms x
y=2*sin(x)-x;
f=inline(y);
global error xr
xl=-pi;
disp(xl)
xu=pi;
tol=(0.5*(10^(2-3)));

biseccion(f,xl,xu,tol);
set(handles.txtRb,'string', num2str(xr));
set(handles.txtEab,'string', num2str(error));


% --- Executes on button press in btnMtgraf.
function btnMtgraf_Callback(hObject, eventdata, handles)
% hObject    handle to btnMtgraf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%para saber con cual axes estamos trabajan
axes(handles.axes2);
%intervalo de valores que se graficarán en eje equis mediante un for
x= -50.3:0.01:50.3;
% ingreso de la funcion a evaluar 
y=2*sin(x)-x;
%get(handles.funci,'String');
% %funcion para calcular la raiz
 f=@(x)2*sin(x)-x;
plot(y,x);
%ezplot(handles.axes1,f,x);
hold on
grid on
xlabel('x')
ylabel('y')
title('2senx-x')
plot(x,zeros(size(x)),'b');
plot(zeros(size(x)),x,'r');
raiz=fzero(f,[-pi,pi]);
disp(raiz)
% %prueba en consola del valor de la raiz
% %disp(raiz)
% %se encarga de graficar la funcion en el intervalo de puntos dado

% 
% %pegar el resultado de la raiz en el cuadro de texto
 set(handles.txtRa,'string', num2str(raiz));
% %intento de graficar el eje (talves lo haga :v)
% %hold on
%plot([zeros(size(x)),zeros(size(x))]);



% --- Executes on button press in btnFalsaPosi.
function btnFalsaPosi_Callback(hObject, eventdata, handles)
% hObject    handle to btnFalsaPosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


syms x
j=2*sin(x)-x;
y=inline(j);
global xr error
xl=-pi;
xu=pi;
tol=(0.5*(10^(2-3)));

falsaPosicion(y,xl,xu,tol);



set(handles.txtRfp,'string', num2str(xr));
%disp(xr)
set(handles.txtEafp,'string', num2str(error));
%disp(error)


% --- Executes on button press in btnItercaPuntoFijo.
function btnItercaPuntoFijo_Callback(hObject, eventdata, handles)
% hObject    handle to btnItercaPuntoFijo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global error x
syms x
cf=2*sin(x)-x;
cg=2*sin(x);
f=inline(cf);
g=inline(cg);
dg=diff(cg,x);

x=(-2.3562*(pi/180));
tol=(0.5*(10^(2-3)));

iteracionPF(g,x,dg,tol);
set(handles.txtRipf,'string',num2str(x));
%disp(x)
set(handles.txtEaipf,'string', num2str(error));



% --- Executes on button press in btnNewRaphson.
function btnNewRaphson_Callback(hObject, eventdata, handles)
% hObject    handle to btnNewRaphson (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;
global x error
syms x
cf=2*sin(x)-x;
f=inline(cf);
derivada=diff(cf,x);
df=inline(derivada);
tol=(0.5*(10^(2-3)));
x=(-2.3562*(pi/180));
n=0;
disp(' n      x1      error');

NewtonR(n,x,f,df,tol);

set(handles.txtRnr2,'string',num2str(x));
set(handles.txtEanr2,'string', num2str(error));

% --- Executes on button press in btnVol.
function btnVol_Callback(hObject, eventdata, handles)
% hObject    handle to btnVol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
main;
