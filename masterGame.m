function [phase,toughness,position] = masterGame(handles,position)
%% Gameplay (walking)
        if strcmpi(handles.InputText.String,'walk north')
            if position(1)==0
                handles.messageText.String=('You can''t go that way.');
                position(1)=1;
            elseif position(1)==41
                handles.messageText.String=('You can''t go that way.');
                position(1)=40;
            elseif position(2)==0
                handles.messageText.String=('You can''t go that way.');
                position(2)=1;
            elseif position(2)==41
                handles.messageText.String=('You can''t go that way.');
                position(2)=40;
            else
                position(1)=position(1)-1;
            end
        elseif strcmpi(handles.InputText.String,'walk south')
            if position(1)==0
                handles.messageText.String=('You can''t go that way.');
                position(1)=1;
            elseif position(1)==41
                handles.messageText.String=('You can''t go that way.');
                position(1)=40;
            elseif position(2)==0
                handles.messageText.String=('You can''t go that way.');
                position(2)=1;
            elseif position(2)==41
                handles.messageText.String=('You can''t go that way.');
                position(2)=40;
            else
                position(1)=position(1)+1;
            end
        elseif strcmpi(handles.InputText.String,'walk west')
            if position(1)==0
                handles.messageText.String=('You can''t go that way.');
                position(1)=1;
            elseif position(1)==41
                handles.messageText.String=('You can''t go that way.');
                position(1)=40;
            elseif position(2)==0
                handles.messageText.String=('You can''t go that way.');
                position(2)=1;
            elseif position(2)==41
                handles.messageText.String=('You can''t go that way.');
                position(2)=40;
            else
                position(2)=position(2)-1;  
            end
        elseif strcmpi(handles.InputText.String,'walk east')
            if position(1)==0
                handles.messageText.String=('You can''t go that way.');
                position(1)=1;
            elseif position(1)==41
                handles.messageText.String=('You can''t go that way.');
                position(1)=40;
            elseif position(2)==0
                handles.messageText.String=('You can''t go that way.');
                position(2)=1;
            elseif position(2)==41
                handles.messageText.String=('You can''t go that way.');
                position(2)=40;
            else
                position(2)=position(2)+1;
            end
        elseif strcmpi(handles.InputText.String,'position')
            handles.messageText.String=(['Position: ',num2str(position(1)),',',num2str(position(2))]);
        elseif strcmpi(handles.InputText.String,'')==false
            handles.messageText.String=('Nothing happened...');
        end
    
    if Map(position(1),position(2))>0 && Map(position(1),position(2))<=4
        toughness = Map(position(1),position(2));
        phase = 1; % fight
    elseif Map(position(1),position(2))==9
        shopcode(handles);
        phase = 2; % shop
    else
        if position(1)>16 && position(1)<24 && position(2)>16 && position(2)<24
            handles.messageText.String=('You are in a clearing.');
            phase = 0;
        else
            handles.messageText.String=('You are in the forest.');
            phase = 0;
        end
    end
end