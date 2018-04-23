function shopcode(handles)

%% initial greeting
handles.messageText.String=(['You have stumbled upon a mysterious structure in the wilderness.', ... 
'It does not have any clear markings, though there is smoke flowing ', ...
'from the chimney and the door is cracked.']); 
% Initial display in messageText

pause(1);

handles.messageText.String=('You walk through the door and are greeted by a jolly figure behind a counter.');

pause(2)

handles.messageText.String=(['"Welcome weary traveler to my humble abode. ',...
'Need to sharpen your sword? It will increase your attack. ',...
'How about upgrading your armor? Your defense will increase. ',...
'Maybe you just need to refill your health and reset your HP to full. ',...
'However, everything comes at a price, and you must pay in gold if you desire any of these services."']);
% Standard Shopkeeper greeting

%% define initial variables
gold = str2double(handles.GLDtext.String); % gold that user has, whatever starting value we want to use... we can just change this variable to handles.GLDtext
ATK = str2double(handles.ATKtext.String); % attack statistic... can change to handles.ATKtext
DEF = str2double(handles.DEFtext.String); % defense statistic... handles.DEFtext
HP = str2double(handles.HPtext); % health statistic... hanldes.HPtext
cost_sword = 2; % initial cost of sword shapening
cost_armor = 2; % initial cost of armor upgrade
cost_hp = 2; % initial cost of health refill
increase_factor = 3; % increment that a statistic increases upon purchase of shop item

pause(1);

%% item purchase process
selection_1 = input('"Would you like to sharpen sword, upgrade armor, or refill health?" ','s');

if strcmpi(selection_1, 'sharpen sword')
    confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        if cost_sword <= gold;
            gold = gold - cost_sword;
            ATK = ATK + increase_factor;
            cost_sword = cost_sword + 1;
            disp('You have sharpened your sword.');
        elseif cost_sword > gold;
            disp('You do not have enough gold to sharpen your sword.')
        end
    else
        disp('"Very well then."')
        selection_2 = input('"Would you like to upgrade armor or refill health?" ','s');
        if (strcmpi(selection_2, 'upgrade armor') == 1)
            confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
            if (strcmpi(confirmation, 'yes') == 1)
                if cost_armor <= gold;
                    gold = gold - cost_armor;
                    DEF = DEF + increase_factor;
                    cost_armor = cost_armor + 1;
                    disp('You have upgraded your armor.');
                elseif cost_armor > gold
                    disp('You do not have enough gold to upgrade your armor.')
                end
            end
            selection_3 = input('"Would you like to refill health?" ','s');
            if strcmpi(selection_3,'yes')
                if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('Your health has been restored.');
                elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.');
                end
            else
                disp('"Very well then. Have a nice day."');
            end
        end
    end
    selection_2 = input('"Would you like to upgrade armor or refill health?" ','s');
    if (strcmpi(selection_2, 'upgrade armor') == 1)
        confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_armor <= gold;
                gold = gold - cost_armor;
                DEF = DEF + increase_factor;
                cost_armor = cost_armor + 1;
                disp('You have upgraded your armor.');
            elseif cost_armor > gold
                disp('You do not have enough gold to upgrade your armor.')
            end
        end
        selection_3 = input('"Would you like to refill health?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_hp <= gold;
                gold = gold - cost_hp;
                HP = 100;
                cost_hp = cost_hp + 1;
                disp('Your health has been restored.');
            elseif cost_hp > gold;
                disp('You do not have enough gold to refill your health.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
                       
    elseif (strcmpi(selection_2, 'refill health') == 1)
        confirmation = input('"Are you sure you would like to refill your health?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('You health has been restored.');
            elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.')
            end
        end
        selection_3 = input('"Would you like to upgrade armor?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_armor <= gold;
                gold = gold - cost_armor;
                DEF = DEF + increase_factor;
                cost_armor = cost_armor + 1;
                disp('You have upgraded your armor.');
            elseif cost_armor > gold;
                disp('You do not have enough gold to upgrade your armor.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
    else
        disp('"Very well then. Have a nice day."');
    end

elseif (strcmpi(selection_1, 'upgrade armor') == 1)
    confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        if cost_armor <= gold;
            gold = gold - cost_armor;
            DEF = DEF + increase_factor;
            cost_armor = cost_armor + 1;
            disp('You have upgraded your armor.');
        elseif cost_armor > gold
            disp('You do not have enough gold to upgrade your armor.')
        end
    else
        disp('"Very well then."')
        selection_2 = input('"Would you like to sharpen sword or refill health?" ','s');
        if (strcmpi(selection_2, 'sharpen sword') == 1)
            confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
            if (strcmpi(confirmation, 'yes') == 1)
                if cost_sword <= gold;
                    gold = gold - cost_sword;
                    ATK = ATK + increase_factor;
                    cost_sword = cost_sword + 1;
                    disp('You have sharpened your sword.');
                elseif cost_sword > gold
                    disp('You do not have enough gold to sharpen your sword.')
                end
            end
            selection_3 = input('"Would you like to refill health?" ','s');
            if strcmpi(selection_3,'yes')
                if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('Your health has been restored.');
                elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.');
                end
            else
                disp('"Very well then. Have a nice day."');
            end
        end
    end
    selection_2 = input('"Would you like to sharpen sword or refill health?" ','s');
    if (strcmpi(selection_2, 'sharpen sword') == 1)
        confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have sharpened your sword.');
            elseif cost_sword > gold
                disp('You do not have enough gold to sharpen your sword.')
            end
        end
        selection_3 = input('"Would you like to refill health?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_hp <= gold;
                gold = gold - cost_hp;
                HP = 100;
                cost_hp = cost_hp + 1;
                disp('Your health has been restored.');
            elseif cost_hp > gold;
                disp('You do not have enough gold to refill your health.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
                       
    elseif (strcmpi(selection_2, 'refill health') == 1)
        confirmation = input('"Are you sure you would like to refill your health?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('You health has been restored.');
            elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.')
            end
        end
        selection_3 = input('"Would you like to sharpen sword?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have upgraded your armor.');
            elseif cost_sword > gold;
                disp('You do not have enough gold to sharpen your sword.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
    else
        disp('"Very well then. Have a nice day."');
    end
    
    
elseif (strcmpi(selection_1, 'refill health') == 1)
    confirmation = input('"Are you sure you would like to refill your health?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        if cost_hp <= gold;
            gold = gold - cost_hp;
            HP = 100;
            cost_hp = cost_hp + 1;
            disp('Your health has been restored.');
        elseif cost_hp > gold;
            disp('You do not have enough gold to refill your health.')
        end
    else
        disp('"Very well then."')
        selection_2 = input('"Would you like to sharpen sword or upgrade armor?" ','s');
        if (strcmpi(selection_2, 'sharpen sword') == 1)
            confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
            if (strcmpi(confirmation, 'yes') == 1)
                if cost_sword <= gold;
                    gold = gold - cost_sword;
                    ATK = ATK + increase_factor;
                    cost_sword = cost_sword + 1;
                    disp('You have sharpened your sword.');
                elseif cost_sword > gold
                    disp('You do not have enough gold to sharpen your sword.')
                end
            end
            selection_3 = input('"Would you like to upgrade armor?" ','s');
            if strcmpi(selection_3,'yes')
                if cost_armor <= gold;
                    gold = gold - cost_armor;
                    DEF = DEF + increase_factor;
                    cost_armor = cost_armor + 1;
                    disp('You have upgraded your armor.');
                elseif cost_armor > gold;
                    disp('You do not have enough gold to upgrade your armor.');
                end
            else
                disp('"Very well then. Have a nice day."');
            end
        end
    end
    selection_2 = input('"Would you like to sharpen sword or refill health?" ','s');
    if (strcmpi(selection_2, 'sharpen sword') == 1)
        confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have sharpened your sword.');
            elseif cost_sword > gold
                disp('You do not have enough gold to sharpen your sword.')
            end
        end
        selection_3 = input('"Would you like to upgrade armor?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_armor <= gold;
                gold = gold - cost_armor;
                DEF = DEF + increase_factor;
                cost_armor = cost_armor + 1;
                disp('You have upgraded your armor.');
            elseif cost_armor > gold;
                disp('You do not have enough gold to upgrade your armor.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
                       
    elseif (strcmpi(selection_2, 'upgrade armor') == 1)
        confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_armor <= gold;
                    gold = gold - cost_armor;
                    DEF = DEF + increase_factor;
                    cost_armor = cost_armor + 1;
                    disp('Your armor has been upgraded.');
            elseif cost_armor > gold;
                    disp('You do not have enough gold to upgrade your armor.')
            end
        end
        selection_3 = input('"Would you like to sharpen sword?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have upgraded your armor.');
            elseif cost_sword > gold;
                disp('You do not have enough gold to sharpen your sword.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
    else
        disp('"Very well then. Have a nice day."');
    end
    
    
else
    confirmation = input('"Are you sure wouldn''t like to purchase anything?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        disp('"Very well then. Have a nice day."');
    else
    selection_1 = input('"Would you like to sharpen sword, upgrade armor, or refill health?" ','s');
if strcmpi(selection_1, 'sharpen sword')
    confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        if cost_sword <= gold;
            gold = gold - cost_sword;
            ATK = ATK + increase_factor;
            cost_sword = cost_sword + 1;
            disp('You have sharpened your sword.');
        elseif cost_sword > gold;
            disp('You do not have enough gold to sharpen your sword.')
        end
    else
        disp('"Very well then."')
        selection_2 = input('"Would you like to upgrade armor or refill health?" ','s');
        if (strcmpi(selection_2, 'upgrade armor') == 1)
            confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
            if (strcmpi(confirmation, 'yes') == 1)
                if cost_armor <= gold;
                    gold = gold - cost_armor;
                    DEF = DEF + increase_factor;
                    cost_armor = cost_armor + 1;
                    disp('You have upgraded your armor.');
                elseif cost_armor > gold
                    disp('You do not have enough gold to upgrade your armor.')
                end
            end
            selection_3 = input('"Would you like to refill health?" ','s');
            if strcmpi(selection_3,'yes')
                if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('Your health has been restored.');
                elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.');
                end
            else
                disp('"Very well then. Have a nice day."');
            end
        end
    end
    selection_2 = input('"Would you like to upgrade armor or refill health?" ','s');
    if (strcmpi(selection_2, 'upgrade armor') == 1)
        confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_armor <= gold;
                gold = gold - cost_armor;
                DEF = DEF + increase_factor;
                cost_armor = cost_armor + 1;
                disp('You have upgraded your armor.');
            elseif cost_armor > gold
                disp('You do not have enough gold to upgrade your armor.')
            end
        end
        selection_3 = input('"Would you like to refill health?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_hp <= gold;
                gold = gold - cost_hp;
                HP = 100;
                cost_hp = cost_hp + 1;
                disp('Your health has been restored.');
            elseif cost_hp > gold;
                disp('You do not have enough gold to refill your health.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
                       
    elseif (strcmpi(selection_2, 'refill health') == 1)
        confirmation = input('"Are you sure you would like to refill your health?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('You health has been restored.');
            elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.')
            end
        end
        selection_3 = input('"Would you like to upgrade armor?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_armor <= gold;
                gold = gold - cost_armor;
                DEF = DEF + increase_factor;
                cost_armor = cost_armor + 1;
                disp('You have upgraded your armor.');
            elseif cost_armor > gold;
                disp('You do not have enough gold to upgrade your armor.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
    else
        disp('"Very well then. Have a nice day."');
    end

elseif (strcmpi(selection_1, 'upgrade armor') == 1)
    confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        if cost_armor <= gold;
            gold = gold - cost_armor;
            DEF = DEF + increase_factor;
            cost_armor = cost_armor + 1;
            disp('You have upgraded your armor.');
        elseif cost_armor > gold
            disp('You do not have enough gold to upgrade your armor.')
        end
    else
        disp('"Very well then."')
        selection_2 = input('"Would you like to sharpen sword or refill health?" ','s');
        if (strcmpi(selection_2, 'sharpen sword') == 1)
            confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
            if (strcmpi(confirmation, 'yes') == 1)
                if cost_sword <= gold;
                    gold = gold - cost_sword;
                    ATK = ATK + increase_factor;
                    cost_sword = cost_sword + 1;
                    disp('You have sharpened your sword.');
                elseif cost_sword > gold
                    disp('You do not have enough gold to sharpen your sword.')
                end
            end
            selection_3 = input('"Would you like to refill health?" ','s');
            if strcmpi(selection_3,'yes')
                if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('Your health has been restored.');
                elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.');
                end
            else
                disp('"Very well then. Have a nice day."');
            end
        end
    end
    selection_2 = input('"Would you like to sharpen sword or refill health?" ','s');
    if (strcmpi(selection_2, 'sharpen sword') == 1)
        confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have sharpened your sword.');
            elseif cost_sword > gold
                disp('You do not have enough gold to sharpen your sword.')
            end
        end
        selection_3 = input('"Would you like to refill health?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_hp <= gold;
                gold = gold - cost_hp;
                HP = 100;
                cost_hp = cost_hp + 1;
                disp('Your health has been restored.');
            elseif cost_hp > gold;
                disp('You do not have enough gold to refill your health.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
                       
    elseif (strcmpi(selection_2, 'refill health') == 1)
        confirmation = input('"Are you sure you would like to refill your health?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_hp <= gold;
                    gold = gold - cost_hp;
                    HP = 100;
                    cost_hp = cost_hp + 1;
                    disp('You health has been restored.');
            elseif cost_hp > gold;
                    disp('You do not have enough gold to refill your health.')
            end
        end
        selection_3 = input('"Would you like to sharpen sword?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have upgraded your armor.');
            elseif cost_sword > gold;
                disp('You do not have enough gold to sharpen your sword.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
    else
        disp('"Very well then. Have a nice day."');
    end
    
    
elseif (strcmpi(selection_1, 'refill health') == 1)
    confirmation = input('"Are you sure you would like to refill your health?" ','s');
    if (strcmpi(confirmation, 'yes') == 1)
        if cost_hp <= gold;
            gold = gold - cost_hp;
            HP = 100;
            cost_hp = cost_hp + 1;
            disp('Your health has been restored.');
        elseif cost_hp > gold;
            disp('You do not have enough gold to refill your health.')
        end
    else
        disp('"Very well then."')
        selection_2 = input('"Would you like to sharpen sword or upgrade armor?" ','s');
        if (strcmpi(selection_2, 'sharpen sword') == 1)
            confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
            if (strcmpi(confirmation, 'yes') == 1)
                if cost_sword <= gold;
                    gold = gold - cost_sword;
                    ATK = ATK + increase_factor;
                    cost_sword = cost_sword + 1;
                    disp('You have sharpened your sword.');
                elseif cost_sword > gold
                    disp('You do not have enough gold to sharpen your sword.')
                end
            end
            selection_3 = input('"Would you like to upgrade armor?" ','s');
            if strcmpi(selection_3,'yes')
                if cost_armor <= gold;
                    gold = gold - cost_armor;
                    DEF = DEF + increase_factor;
                    cost_armor = cost_armor + 1;
                    disp('You have upgraded your armor.');
                elseif cost_armor > gold;
                    disp('You do not have enough gold to upgrade your armor.');
                end
            else
                disp('"Very well then. Have a nice day."');
            end
        end
    end
    selection_2 = input('"Would you like to sharpen sword or refill health?" ','s');
    if (strcmpi(selection_2, 'sharpen sword') == 1)
        confirmation = input('"Are you sure you would like to sharpen your sword?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have sharpened your sword.');
            elseif cost_sword > gold
                disp('You do not have enough gold to sharpen your sword.')
            end
        end
        selection_3 = input('"Would you like to upgrade armor?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_armor <= gold;
                gold = gold - cost_armor;
                DEF = DEF + increase_factor;
                cost_armor = cost_armor + 1;
                disp('You have upgraded your armor.');
            elseif cost_armor > gold;
                disp('You do not have enough gold to upgrade your armor.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
                       
    elseif (strcmpi(selection_2, 'upgrade armor') == 1)
        confirmation = input('"Are you sure you would like to upgrade your armor?" ','s');
        if (strcmpi(confirmation, 'yes') == 1)
            if cost_armor <= gold;
                    gold = gold - cost_armor;
                    DEF = DEF + increase_factor;
                    cost_armor = cost_armor + 1;
                    disp('Your armor has been upgraded.');
            elseif cost_armor > gold;
                    disp('You do not have enough gold to upgrade your armor.')
            end
        end
        selection_3 = input('"Would you like to sharpen sword?" ','s');
        if strcmpi(selection_3,'yes')
            if cost_sword <= gold;
                gold = gold - cost_sword;
                ATK = ATK + increase_factor;
                cost_sword = cost_sword + 1;
                disp('You have upgraded your armor.');
            elseif cost_sword > gold;
                disp('You do not have enough gold to sharpen your sword.');
            end
        else
            disp('"Very well then. Have a nice day."');
        end
    else
        disp('"Very well then. Have a nice day."');
    end
end
    end
end
    