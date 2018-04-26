function [winCondition] = playerSpell(handles,magic,luck,enemyhp,enemyres)
%PLAYERSPELL Initiates the player using a magical attack.
% Reduces enemy hp equal to the player's magic stat minus the enemy's defense stat. Deals triple damage upon a critical strike (LCK%).
% 
% Inputs:
% handles - GUI manipulation.
% attack - integer of player's attack stat pulled from player_stats array.
% luck - integer of player's luck stat pulled from player_stats array.
% handles.enemyText.String - string dictating the name of the enemy.
% enemyhp - integer of enemy's health.
% enemyres - integer of enemy's resistance stat.
%
% Outputs:
% winCondition - integer determining winning (2) or combat (0).
    global enemy_stats;
    damage = magic - enemyres;
    if damage < 0
        damage = 0;
    end
    [damage,crit] = critStrike(luck,damage);
    if crit
        handles.messageText.String = 'Critical hit!';
        pause(2);
    end
    handles.messageText.String = ['You zap the ',handles.enemyText.String,'! Dealt ',num2str(damage),' damage.'];
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