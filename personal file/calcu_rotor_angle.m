%Script file:Calc_the Rotor Angle.m
%
%Purpose:
%To calculate the rotor angle of the small carbon free car
%
%Record of revisions:
%Date      Programmer    Description of change
%=======   ==========   =====================
%
%
%Define variables:
%theta --the rotor angle
%dia --the diameter of the barrier cylinder
%delta_l --the distance between the surface of the barrier cylinder 
%and the the back wheel which is close to the cylinder
%dis --the distance between the axises of two cylinders
%l --the distance between the two back wheels
dia=20;%it is given
%prompt the user for the delta_l,dis and l need
delta_l=input('The distance between the surface of the barrier cylinder is:\n');
dis=input('The distance between the axises of two cylinders is:\n');
l=input('The distance between the two back wheels is:\n');
%Perform calculatiions:
theta=180*asin((l+dia+2*delta_l)/dis)/pi;
%Tell the user about the rotor angle.
string=['The rotor angle is ' num2str(theta) 'theta.'];
disp(string);
