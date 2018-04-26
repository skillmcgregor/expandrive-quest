function phase = shopcode3(handles)
handles.messageText.String=(['You have stumbled upon a mysterious structure in the wilderness.', ... 
'It does not have any clear markings, though there is smoke flowing ', ...
'from the chimney and the door is cracked.']);
pause(3);
handles.messageText.String=('You walk through the door and are greeted by a jolly figure behind a counter.');
pause(2);
handles.messageText.String = ['Actions:',newline,'"potion" (Fill HP)',newline,'"sword" (+ATK)',newline,'"wand" (+MAG)',newline,'"armor" (+DEF)', ...
    newline,'"charm" (+LCK)',newline,'"exit" (leave shop)'];

phase = 4;
end
