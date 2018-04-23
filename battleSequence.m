function [winCondition] = battleSequence(handles,toughness,player_stats)
%BATTLESEQUENCE Initiates the combat program for the text-based adventure
%game
%   This function is called when two conditions are met. The first is when
%   the player enters a certain area on the map (Map(position)). The second
%   is when the player selects the "fight" option from several choices.
%
%   Inputs: 
%   handles - for enemy stats
%   Toughness - cell array value for a position on the map from 1-5.
%   Player Stats - array containing [HP, ATK, MAG, DEF, LCK, SPD]
%
%   Outputs: 
%   winCondition - integer which signifies whether you die or not, (2 to win, 1 to die, 3 for run)

%% initialize enemy stats

if toughness == 1 % level 1 enemy stat declaration
    enemy_stats = [randi(2),randi(2)-1,randi(2)-1,randi(5)+5]; % [enemyatk,enemydef,enemyres,enemyhp]
    handles.enemyATKStat.String = num2str(enemy_stats(1));
    handles.enemyDEFStat.String = num2str(enemy_stats(2));
    handles.enemyRESStat.String = num2str(enemy_stats(3));
    handles.enemyHPStat.String = num2str(enemy_stats(4));
    enemytype = 'slime';
elseif toughness == 2 % level 2 enemy stat declaration
    enemy_stats = [randi(3),randi(4)-1,randi(3)-1,randi(8)+8];
    handles.enemyATKStat.String = num2str(enemy_stats(1));
    handles.enemyDEFStat.String = num2str(enemy_stats(2));
    handles.enemyRESStat.String = num2str(enemy_stats(3));
    handles.enemyHPStat.String = num2str(enemy_stats(4));
    enemytype = 'big boyo';
elseif toughness == 3 % level 3 enemy stat declaration
    enemy_stats = [randi(7),randi(5),randi(4),randi(10)+10];
    handles.enemyATKStat.String = num2str(enemy_stats(1));
    handles.enemyDEFStat.String = num2str(enemy_stats(2));
    handles.enemyRESStat.String = num2str(enemy_stats(3));
    handles.enemyHPStat.String = num2str(enemy_stats(4));
    enemytype = 'sakai';
elseif toughness == 4 % level 4 enemy stat declaration
    enemy_stats = [randi(5)+5,randi(3)+5,randi(2)+3,randi(15)+15];
    handles.enemyATKStat.String = num2str(enemy_stats(1));
    handles.enemyDEFStat.String = num2str(enemy_stats(2));
    handles.enemyRESStat.String = num2str(enemy_stats(3));
    handles.enemyHPStat.String = num2str(enemy_stats(4));
    enemytype = 'NOVO';
else % expanddrive stat declaration
    enemy_stats = [9999,9999,9999,9999];
    handles.enemyATKStat.String = num2str(enemy_stats(1));
    handles.enemyDEFStat.String = num2str(enemy_stats(2));
    handles.enemyRESStat.String = num2str(enemy_stats(3));
    handles.enemyHPStat.String = num2str(enemy_stats(4));
    enemytype = 'ExpanDrive';
end

%% loop for action sequence

winCondition = 0; % your exit condition (0 is still in combat)
while winCondition == 0
    handles.messageText.String = ['Actions: ',newline,'"attack"',newline,'"spell"',newline,'"defend"',newline,'"run"'];
    if lower(handles.inputText.String) == 'attack' %% player chooses to attack
        if player_stats(6) > 3 %% high speed makes player attack first
            winCondition = playerAttack(handles,player_stats(2),player_stats(5),enemytype,enemy_stats(4),enemy_stats(2));
            if winCondition ~= 0
                continue
            end
            winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemytype,enemy_stats(1));
            if winCondition ~= 0
                continue
            end
        else
            winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemytype,enemy_stats(1));
            if winCondition ~= 0
                continue
            end
            winCondition = playerAttack(handles,player_stats(2),player_stats(5),enemytype,enemy_stats(4),enemy_stats(2));
            if winCondition ~= 0
                continue
            end
        end
    elseif lower(handles.inputText.String) == 'spell' % player chooses to magically attack
        if player_stats(6) > 3 %% high speed makes player attack first
            winCondition = playerSpell(handles,player_stats(3),player_stats(5),enemytype,enemy_stats(4),enemy_stats(3));
            if winCondition ~= 0
                continue
            end
            winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemytype,enemy_stats(1));
            if winCondition ~= 0
                continue
            end
        else
            winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemytype,enemy_stats(1));
            if winCondition ~= 0
                continue
            end
            winCondition = playerSpell(handles,player_stats(3),player_stats(5),enemytype,enemy_stats(4),enemy_stats(3));
            if winCondition ~= 0
                continue
            end
        end
    elseif lower(handles.inputText.String) == 'defend' % player chooses to defend themself (x2 defense for a turn)
        player_stats(4) = playerDefense(handles,player_stats(4)); % ups defense
        winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemytype,enemy_stats(1));
        if winCondition ~= 0
            continue
        end
        player_stats(4) = player_stats(4)/2; % defense returns to normal
        handles.DEFText.String = num2str(player_stats(4));
    elseif lower(handles.inputText.String) == 'run' % player chooses to run
        winCondition = 3;
        continue
    end  
end

%% run end-of-combat program (rewardSequence covers all scenarios.)

rewardSequence(winCondition,toughness,enemytype,handles);

end