function varargout = mylab(varargin)
% MYLAB MATLAB code for mylab.fig
%      MYLAB, by itself, creates a new MYLAB or raises the existing
%      singleton*.
%
%      H = MYLAB returns the handle to a new MYLAB or the handle to
%      the existing singleton*.
%
%      MYLAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYLAB.M with the given input arguments.
%
%      MYLAB('Property','Value',...) creates a new MYLAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mylab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mylab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mylab

% Last Modified by GUIDE v2.5 24-Nov-2018 20:55:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mylab_OpeningFcn, ...
                   'gui_OutputFcn',  @mylab_OutputFcn, ...
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


% --- Executes just before mylab is made visible.
function mylab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mylab (see VARARGIN)

% Choose default command line output for mylab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mylab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mylab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
licz ( handles );

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', '1');

licz ( handles );

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'x+2.*y +2');

licz ( handles );

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'tan(x+y)');

licz ( handles );



function licz ( handles ) 
    if isempty( get(handles.edit1, 'String') )
        errordlg('Function not passed');
        return; 
    end
    if isempty( get(handles.edit5, 'String') )
       eN='5';
    else
       eN=get(handles.edit5, 'String' );
    end
    N=str2double(eN);
    set(handles.text5, 'String', 'Caculating.' );
    drawnow();
    funstring=get(handles.edit1, 'String' );
    funst1= strcat(funstring,'+ 0*x'); 
    g = @(x,y) eval( funst1 );
    f = @(x,y) 1/2 * g((x+y)/2,(x-y)/2);
	H= 2/N;


    calka =0;

    for i=0:N-1
         for j=0:N-1
             calka = calka + f(-1+i*H + H* 1/2 *(1- 1/sqrt(3)),-1+j*H + H* 1/2 *(1- 1/sqrt(3)))...
                             + f(-1+i*H + H* 1/2 *(1+ 1/sqrt(3)),-1+j*H + H* 1/2 *(1+ 1/sqrt(3)))...
                             + f(-1+i*H + H* 1/2 *(1+ 1/sqrt(3)),-1+j*H + H* 1/2 *(1- 1/sqrt(3)))...
                             + f(-1+i*H + H* 1/2 *(1- 1/sqrt(3)),-1+j*H + H* 1/2 *(1+ 1/sqrt(3)));
         end
         
    end
    calka = calka * H^2 /4;
    calka2= integral2(f,-1,1,-1,1);
    err=calka - calka2;
    
    disp( 'Calculated integral for f(x,y): ');
    funs=erase(funst1,'+ 0*x');
    set(handles.text5, 'String', num2str( calka , '%.8f' ) );
    set(handles.text8, 'String', num2str( err , '%.8f' ) );
    disp(funs);




