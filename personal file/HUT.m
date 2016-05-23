function varargout = HUT(varargin)
% HUT M-file for HUT.fig
%      HUT, by itself, creates a new HUT or raises the existing
%      singleton*.
%
%      H = HUT returns the handle to a new HUT or the handle to
%      the existing singleton*.
%
%      HUT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HUT.M with the given input arguments.
%
%      HUT('Property','Value',...) creates a new HUT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HUT_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HUT_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HUT

% Last Modified by GUIDE v2.5 10-Dec-2013 10:31:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HUT_OpeningFcn, ...
                   'gui_OutputFcn',  @HUT_OutputFcn, ...
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


% --- Executes just before HUT is made visible.
function HUT_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HUT (see VARARGIN)

% Choose default command line output for HUT
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HUT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HUT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function FILE_Callback(hObject, eventdata, handles)
% hObject    handle to FILE (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function NEW_Callback(hObject, eventdata, handles)
% hObject    handle to NEW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
edit new_script.m


% --------------------------------------------------------------------
function PLOT_Callback(hObject, eventdata, handles)
% hObject    handle to PLOT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EXIT_Callback(hObject, eventdata, handles)
% hObject    handle to EXIT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.figure1);


% --------------------------------------------------------------------
function Sine_Wave_Callback(hObject, eventdata, handles)
% hObject    handle to Sine_Wave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=-2*pi:0.01:2*pi;
y=sin(x);
plot(x,y);


% --------------------------------------------------------------------
function Cosine_Wave_Callback(hObject, eventdata, handles)
% hObject    handle to Cosine_Wave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=-2*pi:0.01:2*pi;
y=cos(x);
plot(x,y);
