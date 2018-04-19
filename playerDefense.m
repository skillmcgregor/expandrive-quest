function [newDEF] = playerDefense(handles,defense)
%PLAYERDEFENSE Doubles the player's defense temporarily.
% Inputs:
% handles - GUI manipulation.
% defense - Integer of player's defense stat.
% 
% Outputs:
% newDEF - new defensive value to input to temporary combat data.
newDEF = defense * 2;
handles.DEFText.String = num2str(newDEF);
handles.messageText.String = 'You defended yourself!';
pause(2);
end