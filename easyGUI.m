function varargout = easyGUI(varargin)
% EASYGUI MATLAB code for easyGUI.fig
%      EASYGUI, by itself, creates a new EASYGUI or raises the existing
%      singleton*.
%
%      H = EASYGUI returns the handle to a new EASYGUI or the handle to
%      the existing singleton*.
%
%      EASYGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EASYGUI.M with the given input arguments.
%
%      EASYGUI('Property','Value',...) creates a new EASYGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before easyGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to easyGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above Text to modify the response to help easyGUI

% Last Modified by GUIDE v2.5 22-Apr-2018 19:19:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @easyGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @easyGUI_OutputFcn, ...
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


% --- Executes just before easyGUI is made visible.
function easyGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to easyGUI (see VARARGIN)

% Choose default command line output for easyGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% Initialize Map
global C;
C = imread('expandrive.png');
global Map;
Map=zeros(40);
mode=1; % ez mode
if mode==1
    for ii=1:40
        for jj=1:40
        monster=randi(100);
        shop=randi(100);
            if ii<=5 || jj<=5 || ii>=35 || jj>=35
                if monster<25
                Map(ii,jj)=4;
                end
            elseif ii<=10 && ii>5 || jj<=10 && jj>5 || ii>=30 && jj<35 || jj>=30 && jj<35
                if monster<25
                Map(ii,jj)=3;
                end
            elseif ii<=15 && ii>10 || jj<=15 && jj>10 || ii>=25 && jj<30 || jj>=25 && jj<30
                if monster<25
                Map(ii,jj)=2;
                end
            else
                if monster<25
                Map(ii,jj)=1;
                end
            end
            if shop<20
                Map(ii,jj)=9;
            end
        end
    end
end
global position;
Map(20,20)=0;
Map(20,21) = 1;
Map(20,19) = 9;
position=[20,20];
handles.EXPText.String='0';
handles.GLDText.String='10';
% class=handles.classDropdown.Value;
% if class==2
%     MAG=5;
%     ATK=1;
%     HP=15;
%     DEF=3;
%     LCK=3;
%     SPD=3;
% elseif class==3
%     MAG=3;
%     ATK=3;
%     HP=10;
%     DEF=3;
%     LCK=5;
%     SPD=5;  
% elseif class==4
%     MAG=1;
%     ATK=5;
%     HP=20;
%     DEF=5;
%     LCK=3;
%     SPD=1;
% elseif class==5
%     MAG=5;
%     ATK=1;
%     HP=10;
%     DEF=5;
%     LCK=3;
%     SPD=1;
% elseif class==6
    handles.MAGText.String='2';
    handles.ATKText.String='3';
    handles.HPText.String='15/15';
    handles.DEFText.String='1';
    handles.LCKText.String='5';
    handles.SPDText.String='3';
    handles.EXPText.String = '0';
% end
global player_stats;
global phase;
player_stats=[str2double(handles.HPText.String(1:2)),str2double(handles.ATKText.String),str2double(handles.MAGText.String),...
            str2double(handles.DEFText.String),str2double(handles.LCKText.String),str2double(handles.SPDText.String)];
phase = 0;
handles.messageText.String=(['You wake up in a clearing...',newline,'Type "walk [cardinal direction]" to walk in that direction.']);
plot(handles.mapAxes,position(1),position(2),'bo');
axis(handles.mapAxes,[0 40 0 40]);
grid on;
% UIWAIT makes easyGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = easyGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function inputText_Callback(hObject, eventdata, handles)
% hObject    handle to inputText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputText as Text
%        str2double(get(hObject,'String')) returns contents of inputText as a double
global phase;
global player_stats;
global Map;
global position;
global enemy_stats;
global toughness;
global C;
if phase == 0 % walkin'
    [phase,toughness,position] = masterGame(handles,position,Map);
end
if phase == 1 % startin' a fight
    [enemy_stats,phase] = startFight(handles,toughness,C);
end
if phase == 2 % startin' to shop
    phase = shopcode3(handles);
end
if phase == 3 % fightin'
    winCondition = battleSequence(handles,enemy_stats,player_stats);
    if winCondition ~= 0
        phase = rewardSequence(winCondition,toughness,handles);
        handles.eATKText.String = 0;
        handles.eDEFText.String = 0;
        handles.eRESText.String = 0;
        handles.eHPText.String = 0;
        handles.enemyText.String = '';
        handles.messageText.String = 'Go ahead and walk somewhere.';
    end
end
if phase == 4 % shoppin'
    phase = buyStuff(handles);
end
if str2double(handles.EXPText.String) >= 300
    Map(position(1)+1,position(2)) = 5;
    Map(position(1),position(2)+1) = 5;
    Map(position(1)-1,position(2)) = 5;
    Map(position(1),position(2)-1) = 5;
end
if ~isempty(handles.inputText.String)
    handles.inputText.String = '';
end

% --- Executes during object creation, after setting all properties.
function inputText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function mapAxes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mapAxes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate mapAxes


% --- Executes during object creation, after setting all properties.
function messageText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to messageText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function HPText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HPText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function ATKText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ATKText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function DEFText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to DEFText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function MAGText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MAGText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function SPDText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SPDText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function LCKText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LCKText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function EXPText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EXPText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function GLDText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GLDText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function eHPText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eHPText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function eATKText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eATKText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function eDEFText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eDEFText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function eRESText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eRESText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
