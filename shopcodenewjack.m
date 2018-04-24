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
HP = str2double(handles.HPtext.String); % health statistic... hanldes.HPtext
MAG = str2double(handles.MAGtext.String);
cost_sword = 2; % initial cost of sword shapening
cost_armor = 2; % initial cost of armor upgrade
cost_hp = 2; % initial cost of health refill
cost_magic = 2;
increase_factor = 3; % increment that a statistic increases upon purchase of shop item

pause(1);

%% item purchase process
handles.messageText.String = (['"Type sharpen sword to upgrade your sword. ',...
    'Type upgrade armor to upgrade your armor. ',...
    'Type refill health to refill your health. ',...
    'Type enchant wand to enchant your wand. ',...
    'Type exit to exit the shop and continue your journey." ']);

if strcmpi(handles.InputText.String, 'sharpen sword')
        if cost_sword <= gold
            gold = gold - cost_sword;
            ATK = ATK + increase_factor;
            cost_sword = cost_sword + 1;
            handles.messageText.String = ('You have sharpened your sword.');
        elseif cost_sword > gold
            handles.messageText.String = ('You do not have enough gold to sharpen your sword.');
            pause(2);
            handles.messageText.String = ('Type exit to exit the shop and continue your journey.');
        end
        
elseif strcmpi(handles.InputText.String, 'upgrade armor')
        if cost_armor <= gold
            gold = gold - cost_armor;
            DEF = DEF + increase_factor;
            cost_armor = cost_armor + 1;
            handles.messageText.String = ('You have upgraded your armor.');
        elseif cost_sword > gold
            handles.messageText.String = ('You do not have enough gold to upgrade your armor.');
            pause(2);
            handles.messageText.String = ('Type exit to exit the shop and continue your journey.');
        end
        
elseif strcmpi(handles.InputText.String, 'enchant wand')
        if cost_magic <= gold
            gold = gold - cost_magic;
            MAG = MAG + increase_factor;
            cost_magic = cost_magic + 1;
            handles.messageText.String = ('Your wand has been enchanted.');
        elseif cost_magic > gold
            handles.messageText.String = ('You do not have enough gold to enchant your wamd.');
            pause(2);
            handles.messageText.String = ('Type exit to exit the shop and continue your journey.');
        end
        
elseif strcmpi(handles.InputText.String, 'refill health')
        if cost_hp <= gold
            gold = gold - cost_hp;
            HP = 100;
            cost_hp = cost_hp + 1;
            handles.messageText.String = ('Your health has been restored.');
        elseif cost_hp > gold
            handles.messageText.String = ('You do not have enough gold to refill your health.');
            pause(2);
            handles.messageText.String = ('Type exit to exit the shop and continue your journey.');
        end
        
elseif strcmpi(handles.InputText.String, 'exit')
    phase = 0;
    
end