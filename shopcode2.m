function shopcode2(handles)

sword_pick=0; 
armor_pick=0;
wand_pick=0;
HP_pick=0;
exit=0;

while sword_pick==0 && exit==0|| armor_pick==0 && exit==0|| wand_pick==0 && exit==0|| HP_pick==0 && exit==0
    pause(2)
    handles.messageText.String='Welcome to the shop! Type "sword" to sharpen your sword. Type "armor" to upgrade your armor. Type "wand" to enchant your wand. Type "health" to refill your health.';
    if strcmpi('sword',handles.inputText.String)
        if GLD > 5
            ATK=ATK+2;
            GLD=GLD-5;
            handles.ATKText.String=num2str(ATK);
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your attack!';
            sword_pick=1;
        else
            handles.messageText.String='You don''t have enough gold.';
        end
    elseif strcmpi('armor',handles.inputText.String)
        if GLD > 5
            DEF=DEF+2;
            GLD=GLD-5;
            handles.DEFText.String=num2str(DEF);
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your defense!';
            armor_pick=1;
        else
            handles.messageText.String='You don''t have enough gold.';
        end
    elseif strcmpi('wand',handles.inputText.String)
        if GLD > 5
            MAG=MAG+2;
            GLD=GLD-5;
            handles.MAGText.String=num2str(MAG);
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your magic!';
            wand_pick=1;
        else
            handles.messageText.String='You don''t have enough gold.';
        end
    elseif strcmpi('health',handles.inputText.String)
        if GLD > 5
            HP=HP+5;
            GLD=GLD-5;
            handles.HPText.String=num2str(HP);
            handles.GLDText.String=num2str(GLD);
            handles.messageText.String='You increased your health!';
            HP_pick=1;
        else
            handles.messageText.String='You don''t have enough gold.';
        end
    elseif strcmpi('exit',handles.inputText.String)
        exit=1;
    else
        handles.messageText.String='nothing happened...';
    end
end

pause(2)
handles.messageText.String='Thanks for coming! Stop by again!';
phase=0;