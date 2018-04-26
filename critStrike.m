function [critDamage,critTrue] = critStrike(luck,damage)
%CRITSTRIKE Determines whether or not a hit is a critical strike or not.
%
% Inputs:
% luck - player's luck stat.
% damage - the base damage of an attack.
%
% Outputs:
% critDamage - the new damage (could be the same, could be tripled.)

critChance = randi(100);
if (critChance <= luck)
    critDamage = damage*3;
    critTrue = true;
else
    critDamage = damage;
    critTrue = false;
end
end