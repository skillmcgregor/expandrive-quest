function [winCondition] = playerSpell(handles,magic,luck,enemytype,enemyhp,enemyres)
%PLAYERSPELL Initiates the player using a magical attack.
% Reduces enemy hp equal to the player's magic stat minus the enemy's defense stat. Deals triple damage upon a critical strike (LCK%).
% 
% Inputs:
% handles - GUI manipulation.
% attack - integer of player's attack stat pulled from player_stats array.
% luck - integer of player's luck stat pulled from player_stats array.
% enemytype - string dictating the name of the enemy.
% enemyhp - integer of enemy's health.
% enemyres - integer of enemy's resistance stat.
%
% Outputs:
% winCondition - integer determining winning (2) or combat (0).
    damage = magic - enemyres;
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