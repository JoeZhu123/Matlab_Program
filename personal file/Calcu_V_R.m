%Script file:calcu_V_R.m
%
%Purpose:
%To calculate the V_R of the radio 
% Record of revisions:
% Date Programmer Descriptionofchange
% ==== ========== =====================
% 
%
%Define variables:
%f--the resonant frequency of the radio
%L--the inductance value
%C--the capacitance value
%Prompt the user of inputing the inductance and capacitance
C=input('Enter the capacitance value:\n');
L=input('Enter the inductance value:\n');
R=input('Enter the resistance value:\n');
V_o=input('Enter the original voltage value:\n');
%Perform calculation
V_R=R*V_o/sqrt(R^2+()^2);
%Tell the user about the resonant frequency of the radio
string=('The resonnat frequency of this radio is  ');
