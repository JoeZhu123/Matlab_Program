function varargout = chap16_11_openingFcn(varargin)
% CHAP16_11_OPENINGFCN M-file for chap16_11_openingFcn.fig
%      CHAP16_11_OPENINGFCN, by itself, creates a new CHAP16_11_OPENINGFCN or raises the existing
%      singleton*.
%
%      H = CHAP16_11_OPENINGFCN returns the handle to a new CHAP16_11_OPENINGFCN or the handle to
%      the existing singleton*.
%
%      CHAP16_11_OPENINGFCN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAP16_11_OPENINGFCN.M with the given input arguments.
%
%      CHAP16_11_OPENINGFCN('Property','Value',...) creates a new CHAP16_11_OPENINGFCN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chap16_11_openingFcn_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chap16_11_openingFcn_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chap16_11_openingFcn

% Last Modified by GUIDE v2.5 14-Oct-2013 17:05:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chap16_11_openingFcn_OpeningFcn, ...
                   'gui_OutputFcn',  @chap16_11_openingFcn_OutputFcn, ...
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


% --- Executes just before chap16_11_openingFcn is made visible.
function chap16_11_openingFcn_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chap16_11_openingFcn (see VARARGIN)

% Choose default command line output for chap16_11_openingFcn
handles.output = hObject;
set(handles.Stopbutton,'enable','off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chap16_11_openingFcn wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chap16_11_openingFcn_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Startbutton.
function Startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (~isempty(daqread))
    stop(daqread)
end
ai=analoginput('设置声卡参数');                   %设置声卡参数
addchannel(ai,[1 2]);                                   %左右两个声道
set(ai,'SampleRate',8000);                              %采样率为8000Hz
timePeriod=0.1;%时间为0.1秒
set(ai,'SamplePerTrigger',timePeriod*ai.sampleRate);%每次采集800个数据点

set(ai,'TriggerRepeat',1);
set(ai,'TriggerType','manual');
set(ai,'TimePeriod',timeperiod);
set(ai,'TriggerRepeat',[2048 20]);
start(ai);%开始声音信号的采集
trigger(ai);
d=getdata(ai,ai.SamplePerTrigger);%获取声音数据
hline(1)=plot(handles.axes1,1:size(d,1),d(:,1),'b');%显示左声道声音
xlim('auto');
hline(2)=plot(handles.axes2,1:size(d,1),d(:,2),'r');%显示右声道声音
xlim('auto');
handles.ai=ai;
guidata(hObject,handles);%更新handles
data.ai=ai;
data.handles=handles;
data.hline=hline;
set(ai,'UserData',data);%将结构体data保存在UserData字段
set(handles.Startbutton,'enable','off');
set(handles.Stopbutton,'enable','on');
set(data.ai,'TimerFcn',@updateData);%数据的更新






% --- Executes on button press in Stopbutton.
function Stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ai')
    if isrunning(handles.ai)        %如果正在采集声音
        stop(handles.ai);%暂停
    end
end
set(handles.Startbutton,'enable','on');
set(handles.Stopbutton,'enable','off');



% --- Executes on button press in Exitbutton.
function Exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
answer=questdlg('你想退出程序吗？','Warning !');%问题对话框
switch answer
    case {'No','Cancel'}
        return;%不退出程序
    case 'Yes'%退出程序
        if isfield(handles,'ai')
            if isvalid(handles.ai)
                if isrunning(handles.ai)
                    stop(handles.ai);%暂停采集声音
                end
            end
            delete(handles.ai);%删除声音采集对象
            delete(handles.figure1);%删除窗口
        else
            delete(handles.figure1);%删除窗口
        end
end


function updateData(obj,event)
x=peekdata(obj,obj.SamplesPerTrigger);%获取声音数据
h=obj.UserData;%获取UserData字段
set(h.hline(1),'YData',x(:,1));%更新数据
set(h.hline(2),'YData',x(:,2));
drawnow;%重画


