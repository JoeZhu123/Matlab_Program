%Script file:yellow_red_green.m
%
%
%Purpose:Judge the color of traffic light,then give the command
%
% Record of revisions:
% Date Programmer Descriptionofchange
% ==== ========== =====================
% 
%
%Define variables:
%color---The color of traffic light
%
%Prompt the user of inputing the variables
color=input('The color of traffic light is ');
%
%Perform calculation
switch(color)
case {'red'},
disp('Stop now!');
case {'yellow'},
disp('Prepare to stop.');
case {'green'},
disp('Proceed through intersection.');
otherwise,
disp('Illegal color encountered.');
end
