function phase = buyStuff(handles)
GLD = str2double(handles.GLDText.String);
global Map;
global position;
global player_stats;
ATK = player_stats(2);
MAG = player_stats(3);
DEF = player_stats(4);
LCK = player_stats(5);
phase = 4;
    if strcmpi('sword',handles.inputText.String)
        if GLD >= 5
            ATK=ATK+2;
            GLD=GLD-5;
            handles.ATKText.String=num2str(ATK);
            player_stats(2) = ATK;
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your attack!';
        else
            handles.messageText.String='You don''t have enough gold.';
        end
        pause(2);
handles.messageText.String = ['Actions:',newline,'"potion" (Fill HP)',newline,'"sword" (+ATK)',newline,'"wand" (+MAG)',newline,'"armor" (+DEF)', ...
    newline,'"charm" (+LCK)',newline,'"exit" (leave shop)'];
    elseif strcmpi('armor',handles.inputText.String)
        if GLD >= 5
            DEF=DEF+2;
            GLD=GLD-5;
            handles.DEFText.String=num2str(DEF);
            player_stats(4) = DEF;
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your defense!';
        else
            handles.messageText.String='You don''t have enough gold.';
        end
        pause(2);
handles.messageText.String = ['Actions:',newline,'"potion" (Fill HP)',newline,'"sword" (+ATK)',newline,'"wand" (+MAG)',newline,'"armor" (+DEF)', ...
    newline,'"charm" (+LCK)',newline,'"exit" (leave shop)'];
    elseif strcmpi('wand',handles.inputText.String)
        if GLD >= 5
            MAG=MAG+2;
            GLD=GLD-5;
            handles.MAGText.String=num2str(MAG);
            player_stats(3) = MAG;
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your magic!';
        else
            handles.messageText.String='You don''t have enough gold.';
        end
        pause(2);
handles.messageText.String = ['Actions:',newline,'"potion" (Fill HP)',newline,'"sword" (+ATK)',newline,'"wand" (+MAG)',newline,'"armor" (+DEF)', ...
    newline,'"charm" (+LCK)',newline,'"exit" (leave shop)'];
    elseif strcmpi('potion',handles.inputText.String)
        if GLD >= 5
            GLD=GLD-5;
            player_stats(1) = 15;
            handles.HPText.String=[num2str(15),'/15'];
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You refilled your health!';
        else
            handles.messageText.String='You don''t have enough gold.';
        end
        pause(2);
handles.messageText.String = ['Actions:',newline,'"potion" (Fill HP)',newline,'"sword" (+ATK)',newline,'"wand" (+MAG)',newline,'"armor" (+DEF)', ...
    newline,'"charm" (+LCK)',newline,'"exit" (leave shop)'];
    elseif strcmpi('charm',handles.inputText.String)
        if GLD >= 5
            LCK = LCK + 3;
            GLD=GLD-5;
            handles.LCKText.String=num2str(LCK);
            player_stats(5) = LCK;
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your luck!';
        else
            handles.messageText.String='You don''t have enough gold.';
        end
        pause(2);
handles.messageText.String = ['Actions:',newline,'"potion" (Fill HP)',newline,'"sword" (+ATK)',newline,'"wand" (+MAG)',newline,'"armor" (+DEF)', ...
    newline,'"charm" (+LCK)',newline,'"exit" (leave shop)'];
    elseif strcmpi('exit',handles.inputText.String)
        phase = 0;
        Map(position(1),position(2)) = 0;
        handles.messageText.String = 'The shop vanished after you left!';
        pause(2);
        handles.messageText.String = 'Go ahead and walk somewhere.';
    end
end