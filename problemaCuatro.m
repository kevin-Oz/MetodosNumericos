function varargout = problemaCuatro(varargin)
% PROBLEMACUATRO MATLAB code for problemaCuatro.fig
%      PROBLEMACUATRO, by itself, creates a new PROBLEMACUATRO or raises the existing
%      singleton*.
%
%      H = PROBLEMACUATRO returns the handle to a new PROBLEMACUATRO or the handle to
%      the existing singleton*.
%
%      PROBLEMACUATRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBLEMACUATRO.M with the given input arguments.
%
%      PROBLEMACUATRO('Property','Value',...) creates a new PROBLEMACUATRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before problemaCuatro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to problemaCuatro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help problemaCuatro

% Last Modified by GUIDE v2.5 13-Mar-2018 03:19:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @problemaCuatro_OpeningFcn, ...
                   'gui_OutputFcn',  @problemaCuatro_OutputFcn, ...
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


% --- Executes just before problemaCuatro is made visible.
function problemaCuatro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to problemaCuatro (see VARARGIN)

% Choose default command line output for problemaCuatro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes problemaCuatro wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = problemaCuatro_OutputFcn(hObject, eventdata, handles) 
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
j=exp(1-x).*(sin(x))-1;
y=inline(j);
global xr error
xl=-1;
xu=0;
tol=(0.5*(10^(2-3)));

falsaPosicion(y,xl,xu,tol);
set(handles.txtRfp,'string', num2str(xr));
set(handles.txtEfp,'string', num2str(error));



% --- Executes on button press in bntPuntoFijo.
function bntPuntoFijo_Callback(hObject, eventdata, handles)
% hObject    handle to bntPuntoFijo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnNewton.
function btnNewton_Callback(hObject, eventdata, handles)
% hObject    handle to btnNewton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bntMetodoGrafico.
function bntMetodoGrafico_Callback(hObject, eventdata, handles)
% hObject    handle to bntMetodoGrafico (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%para saber con cual axes estamos trabajan
axes(handles.axes4);
%intervalo de valores que se graficarán en eje equis mediante un for
x= -50.3:0.01:50.3;
% ingreso de la funcion a evaluar 
y=exp(1-x).*(sin(x))-1;
%get(handles.funci,'String');
% %funcion para calcular la raiz
 f=@(x)exp(1-x).*(sin(x))-1;
plot(y,x);
%ezplot(handles.axes1,f,x);
hold on
grid on
xlabel('x')
ylabel('y')
title('e^-^(^x^-^1^)sen(x)=1')
plot(x,zeros(size(x)),'b');
plot(zeros(size(x)),x,'r');
raiz=fzero(f,-0.5);
disp(raiz)
% %prueba en consola del valor de la raiz
% %disp(raiz)
% %se encarga de graficar la funcion en el intervalo de puntos dado

% 
% %pegar el resultado de la raiz en el cuadro de texto
 set(handles.txtRg,'string', num2str(raiz));
% %intento de graficar el eje (talves lo haga :v)
% %hold on




% --- Executes on button press in btnBiseccion.
function btnBiseccion_Callback(hObject, eventdata, handles)
% hObject    handle to btnBiseccion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global error xr
syms x
y=exp(1-x).*(sin(x))-1;  
f=inline(y);
xl=-1;
xu=0;
tol=(0.5*(10^(2-3)));

biseccion(f,xl,xu,tol);

set(handles.txtRb,'string', num2str(xr));
set(handles.txtEb,'string', num2str(error));



% --- Executes on button press in btnBack.
function btnBack_Callback(hObject, eventdata, handles)
% hObject    handle to btnBack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
