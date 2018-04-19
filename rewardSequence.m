function rewardSequence(winCondition,toughness,enemytype,handles)
    if winCondition == 3
        goldValue = str2double(handles.GLDText.String);
        goldValue = goldValue - (goldValue/5);
        handles.GLDText.String = goldValue;
        handles.messageText.String = 'You ran away! Lost some gold.';
        pause(2);
    elseif winCondition == 2 % winning the battle
        if toughness == 1 
            goldValue = str2double(handles.GLDText.String);
            goldIncrease = randi(5) + 5;
            goldValue = goldValue + goldIncrease;
            handles.GLDText.String = num2str(goldValue);
            expValue = str2double(handles.EXPText.String);
            expIncrease = randi(5) + 10;
            expValue = expValue + expIncrease;
            handles.EXPText.String = num2str(expValue);
            handles.messageText.String = ['You defeated the ',enemytype,'!',newline,'Earned ',num2str(goldIncrease),' gold and ',num2str(expIncrease),' EXP.'];
            pause(2);
        elseif toughness == 2
            goldValue = str2double(handles.GLDText.String);
            goldIncrease = randi(10) + 10;
            goldValue = goldValue + goldIncrease;
            handles.GLDText.String = num2str(goldValue);
            expValue = str2double(handles.EXPText.String);
            expIncrease = randi(10) + 25;
            expValue = expValue + expIncrease;
            handles.EXPText.String = num2str(expValue);
            handles.messageText.String = ['You defeated the ',enemytype,'!',newline,'Earned ',num2str(goldIncrease),' gold and ',num2str(expIncrease),' EXP.'];
            pause(2);
        elseif toughness == 3
            goldValue = str2double(handles.GLDText.String);
            goldIncrease = randi(20) + 20;
            goldValue = goldValue + goldIncrease;
            handles.GLDText.String = num2str(goldValue);
            expValue = str2double(handles.EXPText.String);
            expIncrease = randi(20) + 35;
            expValue = expValue + expIncrease;
            handles.EXPText.String = num2str(expValue);
            handles.messageText.String = ['You defeated the ',enemytype,'!',newline,'Earned ',num2str(goldIncrease),' gold and ',num2str(expIncrease),' EXP.'];
            pause(2);
        elseif toughness == 4
            goldValue = str2double(handles.GLDText.String);
            goldIncrease = randi(35) + 55;
            goldValue = goldValue + goldIncrease;
            handles.GLDText.String = num2str(goldValue);
            expValue = str2double(handles.EXPText.String);
            expIncrease = randi(35) + 50;
            expValue = expValue + expIncrease;
            handles.EXPText.String = num2str(expValue);
            handles.messageText.String = ['You defeated the ',enemytype,'!',newline,'Earned ',num2str(goldIncrease),' gold and ',num2str(expIncrease),' EXP.'];
            pause(2);
        else
            goldValue = str2double(handles.GLDText.String);
            goldValue = goldValue + 9999;
            handles.GLDText.String = num2str(goldValue);
        end
    elseif winCondition == 1
        return % On death, sends it back to main function for endgame sequence.
    end
end