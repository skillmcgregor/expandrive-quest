function [phase,toughness,position] = masterGame(handles,position,Map)
%% Gameplay (walking)
        if strcmpi(handles.inputText.String,'walk east')
            if position(1)==1
                handles.messageText.String=('You can''t go that way.');
                position(1)=2;
            elseif position(1)==40
                handles.messageText.String=('You can''t go that way.');
                position(1)=39;
            elseif position(2)==1
                handles.messageText.String=('You can''t go that way.');
                position(2)=2;
            elseif position(2)==40
                handles.messageText.String=('You can''t go that way.');
                position(2)=39;
            else
                position(1)=position(1)+1;
                handles.XText.String = num2str(position(1));
            end
        elseif strcmpi(handles.inputText.String,'walk west')
            if position(1)==1
                handles.messageText.String=('You can''t go that way.');
                position(1)=2;
            elseif position(1)==40
                handles.messageText.String=('You can''t go that way.');
                position(1)=39;
            elseif position(2)==1
                handles.messageText.String=('You can''t go that way.');
                position(2)=2;
            elseif position(2)==40
                handles.messageText.String=('You can''t go that way.');
                position(2)=39;
            else
                position(1)=position(1)-1;
                handles.XText.String = num2str(position(1));
            end
        elseif strcmpi(handles.inputText.String,'walk south')
            if position(1)==1
                handles.messageText.String=('You can''t go that way.');
                position(1)=2;
            elseif position(1)==40
                handles.messageText.String=('You can''t go that way.');
                position(1)=39;
            elseif position(2)==1
                handles.messageText.String=('You can''t go that way.');
                position(2)=2;
            elseif position(2)==40
                handles.messageText.String=('You can''t go that way.');
                position(2)=39;
            else
                position(2)=position(2)-1;
                handles.YText.String = num2str(position(2));
            end
        elseif strcmpi(handles.inputText.String,'walk north')
            if position(1)==1
                handles.messageText.String=('You can''t go that way.');
                position(1)=2;
            elseif position(1)==40
                handles.messageText.String=('You can''t go that way.');
                position(1)=39;
            elseif position(2)==1
                handles.messageText.String=('You can''t go that way.');
                position(2)=2;
            elseif position(2)==40
                handles.messageText.String=('You can''t go that way.');
                position(2)=39;
            else
                position(2)=position(2)+1;
                handles.YText.String = num2str(position(2));
            end
        elseif strcmpi(handles.inputText.String,'position')
            handles.messageText.String=(['Position: ',num2str(position(1)),',',num2str(position(2))]);
        elseif strcmpi(handles.inputText.String,'quit')
            close all;
        elseif strcmpi(handles.inputText.String,'')==false
            handles.messageText.String=('Nothing happened...');
            pause(1)
        end
    toughness = Map(position(1),position(2));
    if Map(position(1),position(2))>0 && Map(position(1),position(2))<=5
        phase = 1;
        plot(handles.mapAxes,position(1),position(2),'bo');
        axis(handles.mapAxes,[0 40 0 40]);
        grid on; % fight
    elseif Map(position(1),position(2))==9
        phase = 2;
        plot(handles.mapAxes,position(1),position(2),'bo');
        axis(handles.mapAxes,[0 40 0 40]);
        grid on; % shop
    else
        if position(1)>16 && position(1)<24 && position(2)>16 && position(2)<24
            handles.messageText.String=('You are in a clearing. Walk somewhere more interesting.');
            plot(handles.mapAxes,position(1),position(2),'bo');
            axis(handles.mapAxes,[0 40 0 40]);
            grid on;
            phase = 0;
        else
            handles.messageText.String=('You are in the forest. Walk somewhere more interesting.');
            plot(handles.mapAxes,position(1),position(2),'bo');
            axis(handles.mapAxes,[0 40 0 40]);
            grid on;
            phase = 0;
        end
    end
end