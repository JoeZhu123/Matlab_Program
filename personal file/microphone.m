% Script file: microphone.m
%
% Purpose:
% This program plots the gain pattern of a cardioid
% microphone.
%
% Record of revisions:
% Date Programmer Description of change
% ==== ========== =====================
% 12/10/97 S. J. Chapman Original code
%
% Define variables:
% g -- Microphone gain constant
% gain -- Gain as a function of angle
% theta -- Angle from microphone axis (radians)
% Calculate gain versus angle
g = 0.5;
theta = 0:pi/20:2*pi;
gain = 2*g*(1+cos(theta));
% Plot gain
polar (theta,gain,'r-');
title ('Gain versus angle \it\theta');