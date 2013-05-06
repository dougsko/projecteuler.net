function varargout = solution_gui(varargin)
%SOLUTION_GUI M-file for solution_gui.fig
%      SOLUTION_GUI, by itself, creates a new SOLUTION_GUI or raises the existing
%      singleton*.
%
%      H = SOLUTION_GUI returns the handle to a new SOLUTION_GUI or the handle to
%      the existing singleton*.
%
%      SOLUTION_GUI('Property','Value',...) creates a new SOLUTION_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to solution_gui_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      SOLUTION_GUI('CALLBACK') and SOLUTION_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in SOLUTION_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help solution_gui

% Last Modified by GUIDE v2.5 04-May-2013 17:25:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @solution_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @solution_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before solution_gui is made visible.
function solution_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for solution_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes solution_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = solution_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start as text
%        str2double(get(hObject,'String')) returns contents of start as a double
start = str2double(get(hObject, 'String'))


% --- Executes during object creation, after setting all properties.
function start_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double
max = str2double(get(hObject, 'String'))


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hamming_Callback(hObject, eventdata, handles)
% hObject    handle to hamming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hamming as text
%        str2double(get(hObject,'String')) returns contents of hamming as a double
hamming = str2double(get(hObject, 'String'))


% --- Executes during object creation, after setting all properties.
function hamming_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hamming (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start = str2double(get(handles.start, 'String'))
max = str2double(get(handles.max, 'String'))
ham = str2double(get(handles.hamming, 'String'))
count = 0
for i = 1 : max
    if(sum(factor(i) > ham) == 0)
        count = count + 1;
    end
end
set(handles.answer, 'String', count)




% --- Executes on button press in pause_button.
function pause_button_Callback(hObject, eventdata, handles)
% hObject    handle to pause_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.current_i, 'String', i)

