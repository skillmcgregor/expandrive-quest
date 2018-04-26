function [winCondition] = battleSequence(handles,enemy_stats,player_stats)
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


%% loop for action sequence
winCondition = 0;
    if strcmpi(handles.inputText.String,'attack') %% player chooses to attack
        if player_stats(6) > 2 %% high speed makes player attack first
            if winCondition == 0
                winCondition = playerAttack(handles,player_stats(2),player_stats(5),enemy_stats(4),enemy_stats(2));
            end
            if winCondition == 0
                winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemy_stats(1));
            end
            if winCondition == 0
                handles.messageText.String = ['Actions: ',newline,'"attack"',newline,'"spell"',newline,'"defend"',newline,'"run"'];
            end
        else
            if winCondition == 0
                winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemy_stats(1));
            end
            if winCondition == 0
                winCondition = playerAttack(handles,player_stats(2),player_stats(5),enemy_stats(4),enemy_stats(2));
            end
            if winCondition == 0
                handles.messageText.String = ['Actions: ',newline,'"attack"',newline,'"spell"',newline,'"defend"',newline,'"run"'];
            end
        end
    elseif strcmpi(handles.inputText.String,'spell') % player chooses to magically attack
        if player_stats(6) > 2 %% high speed makes player attack first
            if winCondition == 0
                winCondition = playerSpell(handles,player_stats(3),player_stats(5),enemy_stats(4),enemy_stats(3));
            end
            if winCondition == 0
                winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemy_stats(1));
            end
            if winCondition == 0
                handles.messageText.String = ['Actions: ',newline,'"attack"',newline,'"spell"',newline,'"defend"',newline,'"run"'];
            end
        else
            if winCondition == 0
                winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemy_stats(1));
            end
            if winCondition == 0
                winCondition = playerSpell(handles,player_stats(3),player_stats(5),enemy_stats(4),enemy_stats(3));
            end
            if winCondition == 0
                handles.messageText.String = ['Actions: ',newline,'"attack"',newline,'"spell"',newline,'"defend"',newline,'"run"'];
            end
        end
    elseif strcmpi(handles.inputText.String,'defend') % player chooses to defend themself (x2 defense for a turn)
        player_stats(4) = playerDefense(handles,player_stats(4)); % ups defense
        winCondition = enemyAttack(handles,player_stats(1),player_stats(4),enemy_stats(1));
        player_stats(4) = player_stats(4)/2; % defense returns to normal
        handles.DEFText.String = num2str(player_stats(4));
    elseif strcmpi(handles.inputText.String,'run') % player chooses to run
        winCondition = 3;
    end
end