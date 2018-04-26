function [enemy_stats,phase] = startFight(handles,toughness,C)
    if toughness == 1 % level 1 enemy stat declaration
        enemy_stats = [randi(2+1),randi(2)-1,randi(2)-1,randi(5)+5]; % [enemyatk,enemydef,enemyres,enemyhp]
        handles.eATKText.String = num2str(enemy_stats(1));
        handles.eDEFText.String = num2str(enemy_stats(2));
        handles.eRESText.String = num2str(enemy_stats(3));
        handles.eHPText.String = num2str(enemy_stats(4));
        handles.enemyText.String = 'slime';
    elseif toughness == 2 % level 2 enemy stat declaration
        enemy_stats = [randi(3),randi(4)-1,randi(3)-1,randi(8)+8];
        handles.eATKText.String = num2str(enemy_stats(1));
        handles.eDEFText.String = num2str(enemy_stats(2));
        handles.eRESText.String = num2str(enemy_stats(3));
        handles.eHPText.String = num2str(enemy_stats(4));
        handles.enemyText.String = 'skeleton';
    elseif toughness == 3 % level 3 enemy stat declaration
        enemy_stats = [randi(7),randi(5),randi(4),randi(10)+10];
        handles.eATKText.String = num2str(enemy_stats(1));
        handles.eDEFText.String = num2str(enemy_stats(2));
        handles.eRESText.String = num2str(enemy_stats(3));
        handles.eHPText.String = num2str(enemy_stats(4));
        handles.enemyText.String = 'orc';
    elseif toughness == 4 % level 4 enemy stat declaration
        enemy_stats = [randi(5)+5,randi(3)+5,randi(2)+3,randi(15)+15];
        handles.eATKText.String = num2str(enemy_stats(1));
        handles.eDEFText.String = num2str(enemy_stats(2));
        handles.eRESText.String = num2str(enemy_stats(3));
        handles.eHPText.String = num2str(enemy_stats(4));
        handles.enemyText.String = 'giant';
    elseif toughness == 5 % expandrive stat declaration
        enemy_stats = [9999,9999,9999,9999];
        handles.eATKText.String = num2str(enemy_stats(1));
        handles.eDEFText.String = num2str(enemy_stats(2));
        handles.eRESText.String = num2str(enemy_stats(3));
        handles.eHPText.String = num2str(enemy_stats(4));
        handles.enemyText.String = 'ExpanDrive';
        image([780,175],[412,536],C);
    end
    handles.messageText.String = ['Actions: ',newline,'"attack"',newline,'"spell"',newline,'"defend"',newline,'"run"'];
    phase = 3;
end