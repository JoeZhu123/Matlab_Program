function varargout = chap16_10_openingFcn(varargin)
% CHAP16_10_OPENINGFCN M-file for chap16_10_openingFcn.fig
%      CHAP16_10_OPENINGFCN, by itself, creates a new CHAP16_10_OPENINGFCN or raises the existing
%      singleton*.
%
%      H = CHAP16_10_OPENINGFCN returns the handle to a new CHAP16_10_OPENINGFCN or the handle to
%      the existing singleton*.
%
%      CHAP16_10_OPENINGFCN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP16_10_OPENINGFCN.M with the given input arguments.
%
%      CHAP16_10_OPENINGFCN('Property','Value',...) creates a new CHAP16_10_OPENINGFCN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap16_10_openingFcn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap16_10_openingFcn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap16_10_openingFcn

% Last Modified by GUIDE v2.5 14-Oct-2013 16:47:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap16_10_openingFcn_OpeningFcn, ...
                   'gui_OutputFcn',  @chap16_10_openingFcn_OutputFcn, ...
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


% --- Executes just before chap16_10_openingFcn is made visible.
function chap16_10_openingFcn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap16_10_openingFcn (see VARARGIN)

% Choose default command line output for chap16_10_openingFcn
handles.output = hObject;
set(handles.Play,'enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap16_10_openingFcn wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chap16_10_openingFcn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
value=get(hObject,'value');
switch value
    case 1
        cla;%清除声音信号的波形
        set(handles.Play,'enable','off');   %按钮Play不可用
        return;
    case 2
        load chirp.mat;%加载声音信号
        set(handles.Play,'enable','on');   %按钮Play可用
    case 3
        load handel.mat;%加载声音信号
        set(handles.Play,'enable','on');   %按钮Play可用     
    case 4
        load laughter.mat;%加载声音信号
        set(handles.Play,'enable','on');   %按钮Play可用     
    case 5
        load gong.mat;%加载声音信号
        set(handles.Play,'enable','on');   %按钮Play可用         
end
plot((1:length(y))/Fs,y);
handles.y=y;
handles.Fs=Fs;
guidata(hObject,handles);%更新

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'y')%如果声音已经加载
    y=handles.y;%获取声音数据
    Fs=handles.Fs;%获取声音频率
    sound(y,Fs);%播放声音信号
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);%关闭窗口
