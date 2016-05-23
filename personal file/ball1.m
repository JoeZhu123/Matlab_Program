% Script file: ball.m
%
% Purpose:
% This program calculates the distance traveled by a ball
% thrown at a specified angle "theta" and a specified
% velocity "vo" from a point on the surface of the Earth,
% ignoring air friction and the Earth's curvature. It
% calculates the angle yielding maximum range, and also
% plots selected trajectories.
%
% Record of revisions:
% Date Programmer Description of change
% ==== ========== =====================
% 12/10/97 S. J. Chapman Original code
%
% Define variables:
% conv Degrees to radians conv factor
% gravity Accel. due to gravity (m/s^2)
% ii, jj Loop index
% index Location of maximum range in array
% maxangle Angle that gives maximum range (deg)
% maxrange Maximum range (m)
% range Range for a particular angle (m)
% time Time(s)
% theta Initial angle (deg)
% traj_time Total trajectory time (s)
% vo Initial velocity (m/s)
% vxo Xcomponent of initial velocity (m/s)
% vyo Ycomponent of initial velocity (m/s)
% x Xposition of ball (m)
% y Yposition of ball (m)
% Constants
conv = pi / 180; % Degreestoradians conversion factor
g = -9.81; % Accel. due to gravity
vo = 20; % Initial velocity
%Create an array to hold ranges
range = zeros(1,91); % Calculate maximum ranges
% Write out table of ranges
fprintf ('Range versus angle theta:\n');

theta =0:90;
ii=theta+1;
vxo = vo * cos(theta.*conv);
vyo = vo * sin(theta.*conv);
traj_time = -2 * vyo./ g;   
range(ii) = vxo.* traj_time;
fprintf(' %2d %8.4f\n',theta+0, range(ii));

% Calculate the maximum range and angle
[maxrange index] = max(range);
maxangle = index - 1;
fprintf ('\nMax range is %8.4f at %2d degrees.\n',maxrange, maxangle);
% Now plot the trajectories
for ii = 5:10:85;
% Get velocities and max time for this angle
theta = ii;
% Calculate the (x,y) positions
jj = 1:21;
time = (jj - 1) .* (-2) *sin(theta*conv) / (g*20);
x= vo * cos(theta*conv).* time;
y =vo * sin(theta*conv).* time + 0.5 * g* time.^2;
plot(x,y,'b');
if ii==5
    hold on;
end
if ii==maxangle
plot(x,y,'r','LineWidth',3.0);
end
end
% Add titles and axis lables
title ('\bfTrajectory of Ball vs Initial Angle \theta');
xlabel ('\bf\itx \rm\bf(meters)');
ylabel ('\bf\ity \rm\bf(meters)');
axis ([0 45 0 25]);
grid on;
hold off