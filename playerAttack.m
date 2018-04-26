function [winCondition] = playerAttack(handles,attack,luck,enemyhp,enemydef)
%PLAYERATTACK Initiates the player using a physical attack. 
% Reduces enemy hp equal to the player's attack stat minus the enemy's defense stat. Deals triple damage upon a critical strike (LCK%).
% 
% Inputs:
% handles - GUI manipulation.
% attack - integer of player's attack stat pulled from player_stats array.
% luck - integer of player's luck stat pulled from player_stats array.
% handles.enemyText.String - string dictating the name of the enemy.
% enemyhp - integer of enemy's health.
% enemydef - integer of enemy's defense stat.
%
% Outputs:
% winCondition - integer determining winning (2) or combat (0).
    global enemy_stats;
    damage = attack - enemydef;
    if damage < 0
        damage = 0;
    end
    [damage,crit] = critStrike(luck,damage);
    if crit
        handles.messageText.String = 'Critical hit!';
        pause(2);
    end
    handles.messageText.String = ['You attack the ',handles.enemyText.String,'! Dealt ',num2str(damage),' damage.'];
    enemyhp = enemyhp - damage;
    if enemyhp > 0
        handles.eHPText.String = num2str(enemyhp);
        enemy_stats(4) = enemyhp;
        winCondition = 0;
    else
        handles.eHPText.String = '0';
        winCondition = 2;
    end
    pause(2);
end