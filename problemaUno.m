function varargout = problemaUno(varargin)
% PROBLEMAUNO MATLAB code for problemaUno.fig
%      PROBLEMAUNO, by itself, creates a new PROBLEMAUNO or raises the existing
%      singleton*.
%
%      H = PROBLEMAUNO returns the handle to a new PROBLEMAUNO or the handle to
%      the existing singleton*.
%
%      PROBLEMAUNO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBLEMAUNO.M with the given input arguments.
%
%      PROBLEMAUNO('Property','Value',...) creates a new PROBLEMAUNO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before problemaUno_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to problemaUno_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help problemaUno

% Last Modified by GUIDE v2.5 12-Mar-2018 13:25:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @problemaUno_OpeningFcn, ...
                   'gui_OutputFcn',  @problemaUno_OutputFcn, ...
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


% --- Executes just before problemaUno is made visible.
function problemaUno_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to problemaUno (see VARARGIN)

% Choose default command line output for problemaUno
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes problemaUno wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = problemaUno_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnGrafico1.
function btnGrafico1_Callback(hObject, eventdata, handles)
% hObject    handle to btnGrafico1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%para saber con cual axes estamos trabajan
axes(handles.axes1);
%intervalo de valores que se graficarán en eje equis mediante un for
x= -4.4:0.01:10;
% ingreso de la funcion a evaluar 
f='exp(x-1)-(3*x)/2';
%funcion para calcular la raiz

raiz=fzero(f,0);
%prueba en consola del valor de la raiz
%disp(raiz)
%se encarga de graficar la funcion en el intervalo de puntos dado
ezplot(handles.axes1,f,x);
hold on 
grid on
plot(x,zeros(size(x)));
plot(zeros(size(x)),x);
%pegar el resultado de la raiz en el cuadro de texto
set(handles.txtR1,'string', num2str(raiz));
%intento de graficar el eje (talves lo haga :v)
%hold on
%plot([zeros(size(x)),zeros(size(x))]);




% --- Executes on button press in btnB1.
function btnB1_Callback(hObject, eventdata, handles)
% hObject    handle to btnB1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


syms x
y=exp(x - 1) - (3*x)/2;
f=inline(y);
global error xr
%se pide el ingreso de los limites
xl=0;
%input('Ingrese el limite inferior: ');
xu=1; 
%input('Ingrese el limite superior: ');
tol=(0.5*(10^(2-7)));

biseccion(f,xl,xu,tol);
set(handles.txtRb,'string', num2str(xr));
set(handles.txtEaB,'string', num2str(error));


% --- Executes on button press in btnFP1.
function btnFP1_Callback(hObject, eventdata, handles)
% hObject    handle to btnFP1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

syms x
j=exp(x - 1) - (3*x)/2;
y=inline(j);
global xr error
%se pide el ingreso de los limites
xl=0;
xu=1;
tol=(0.5*(10^(2-7)));

falsaPosicion(y,xl,xu,tol);

set(handles.txtR,'string', num2str(xr));
%disp(xr)
set(handles.txtEafp,'string', num2str(error));
%disp(error)


% --- Executes on button press in btnIPT1.
function btnIPT1_Callback(hObject, eventdata, handles)
% hObject    handle to btnIPT1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global error xo
syms x
cf=exp(x-1)-1.5*x;
cg=exp(x-1)/1.5;
f=inline(cf);
g=inline(cg);
dg=diff(cg,x);

x=0;
tol=(0.5*(10^(2-7)));

iteracionPF(g,x,dg,tol);
set(handles.txtRipf,'string',num2str(xo));
%disp(x)
set(handles.txtEaipf,'string', num2str(error));


% --- Executes on button press in btnNR1.
function btnNR1_Callback(hObject, eventdata, handles)
% hObject    handle to btnNR1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;
global xo error
syms x
cf=exp(x - 1) - (3*x)/2;
f=inline(cf);
derivada=diff(cf,x);
df=inline(derivada); 
tol=(0.5*(10^(2-7)));
x=0;
n=0;
disp(' n      x1      error');

NewtonR(n,x,f,df,tol);

set(handles.txtra,'string',num2str(xo));
set(handles.txtErr,'string', num2str(error));

% --- Executes on button press in btnBack.
function btnBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.output);
main;

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
