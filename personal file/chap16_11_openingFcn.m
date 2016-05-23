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
ai=analoginput('������������');                   %������������
addchannel(ai,[1 2]);                                   %������������
set(ai,'SampleRate',8000);                              %������Ϊ8000Hz
timePeriod=0.1;%ʱ��Ϊ0.1��
set(ai,'SamplePerTrigger',timePeriod*ai.sampleRate);%ÿ�βɼ�800�����ݵ�

set(ai,'TriggerRepeat',1);
set(ai,'TriggerType','manual');
set(ai,'TimePeriod',timeperiod);
set(ai,'TriggerRepeat',[2048 20]);
start(ai);%��ʼ�����źŵĲɼ�
trigger(ai);
d=getdata(ai,ai.SamplePerTrigger);%��ȡ��������
hline(1)=plot(handles.axes1,1:size(d,1),d(:,1),'b');%��ʾ����������
xlim('auto');
hline(2)=plot(handles.axes2,1:size(d,1),d(:,2),'r');%��ʾ����������
xlim('auto');
handles.ai=ai;
guidata(hObject,handles);%����handles
data.ai=ai;
data.handles=handles;
data.hline=hline;
set(ai,'UserData',data);%���ṹ��data������UserData�ֶ�
set(handles.Startbutton,'enable','off');
set(handles.Stopbutton,'enable','on');
set(data.ai,'TimerFcn',@updateData);%���ݵĸ���






% --- Executes on button press in Stopbutton.
function Stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ai')
    if isrunning(handles.ai)        %������ڲɼ�����
        stop(handles.ai);%��ͣ
    end
end
set(handles.Startbutton,'enable','on');
set(handles.Stopbutton,'enable','off');



% --- Executes on button press in Exitbutton.
function Exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
answer=questdlg('�����˳�������','Warning !');%����Ի���
switch answer
    case {'No','Cancel'}
        return;%���˳�����
    case 'Yes'%�˳�����
        if isfield(handles,'ai')
            if isvalid(handles.ai)
                if isrunning(handles.ai)
                    stop(handles.ai);%��ͣ�ɼ�����
                end
            end
            delete(handles.ai);%ɾ�������ɼ�����
            delete(handles.figure1);%ɾ������
        else
            delete(handles.figure1);%ɾ������
        end
end


function updateData(obj,event)
x=peekdata(obj,obj.SamplesPerTrigger);%��ȡ��������
h=obj.UserData;%��ȡUserData�ֶ�
set(h.hline(1),'YData',x(:,1));%��������
set(h.hline(2),'YData',x(:,2));
drawnow;%�ػ�

