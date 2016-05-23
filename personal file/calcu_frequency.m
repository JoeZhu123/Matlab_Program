%Script file:calcu_frequency.m
%
%Purpose:
%To calculate the resonant frequency of the radio 
% Record of revisions:
% Date Programmer Description of change
% ==== ========== =====================
% 12/2/2012  Joe.Zhu  The style of output 
%
%Define variables:
%f--the resonant frequency of the radio
%L--the inductance value
%C--the capacitance value
%Prompt the user of inputing the inductance and capacitance
C=input('Enter the capacitance value:\n');
L=input('Enter the inductance value:\n');
%Perform calculation
f=1/2*pi*sqrt(C*L);
%Tell the user about the resonant frequency of the radio
string=['The resonnat frequency of this radio is' num2str(f) 'frequency' ];
disp(f);

