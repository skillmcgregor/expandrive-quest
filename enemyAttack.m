function [winCondition] = enemyAttack(handles,hp,defense,enemytype,enemyatk)
%ENEMYATTACK Initiates the player being hit by an enemy attack.
% Reduces player hp equal to the enemy's attack points minus the player's
% defense points. Deals half damage on "defend" inputs.
% 
% Inputs:
% handles - GUI manipulation.
% hp - integer of player's health.
% defense - integer representing player's defense stat.
% enemytype - string representing the name of the enemy.
% enemyatk - integer of enemy's attack stat.
%
% Outputs:
% winCondition - integer dictating state of game. 0 is combat, 1 is death
    damage = enemyatk - defense;
    handles.messageText.String = ['The ',enemytype,' attacked! You took ',num2str(damage),' damage.'];
    hp = hp - damage;
    if hp > 0
        handles.HPStat.String = num2str(hp);
        winCondition = 0;
    else
        handles.HPStat.String = '0';
        winCondition = 1;
    end
    pause(2);
end