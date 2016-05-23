% Script file:plot_the_voltage_function.m
%
%Purpose:
% This m_file is to calculate and plot the function R*V_0/sqrt(R^2+(omega*L-1/omega*C)^2)
% Record of revision:
%Date     Programmer   Descriptionofchange
%======   ==========   ===================
%
%
%Define variables:
%V_R---the voltage of Resistance(mv)
%V_0---the inicial voltage(mv)
%R-----the value of the resistance(ohm)
%omega---the frequency of the signal(Hz)
%L-----the value of inductance(mH)
%C-----the value of capacitance(nF)
%Prompt the user of inputing the variables
C=input('Enter the capacitance value:\n');
L=input('Enter the inductance value:\n');
R=input('Enter the value of the resistance:\n'); 
V_0=input('Enter the inicial voltage:\n');
%Create an arry of the frequency of the signal
omega=1:1:1000;
%Perform calculation
V_R=R.*V_0./sqrt(R.^2+(omega.*L-1./omega.*C).^2);
%Plot the V_R--omega function
plot(omega,V_R);
title('Plot of the V_R--omega function');
xlabel('omega(Hz)');
ylabel('V_R(v)');
grid on;
