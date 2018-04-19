function [winCondition] = playerAttack(handles,attack,luck,enemytype,enemyhp,enemydef)
%PLAYERATTACK Initiates the player using a physical attack. 
% Reduces enemy hp equal to the player's attack stat minus the enemy's defense stat. Deals triple damage upon a critical strike (LCK%).
% 
% Inputs:
% handles - GUI manipulation.
% attack - integer of player's attack stat pulled from player_stats array.
% luck - integer of player's luck stat pulled from player_stats array.
% enemytype - string dictating the name of the enemy.
% enemyhp - integer of enemy's health.
% enemydef - integer of enemy's defense stat.
%
% Outputs:
% winCondition - integer determining winning (2) or combat (0).
    damage = attack - enemydef;
    damage = critStrike(luck,damage);
    handles.messageText.String = ['You attack the ',enemytype,'! Dealt ',num2str(damage),' damage.'];
    enemyhp = enemyhp - damage;
    if enemyhp > 0
        handles.enemyHPStat.String = num2str(enemyhp);
        winCondition = 0;
    else
        handles.enemyHPStat.String = '0';
        winCondition = 2;
    end
    pause(2);
end