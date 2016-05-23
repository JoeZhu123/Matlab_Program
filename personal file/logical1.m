% Script file:logical1.m
%
% Purpose:
% This program calculates the time required to
% calculate the square roots of all elements in
% array a whose value exceeds 5000. This is done
% in two differents ways:
% 1.Using a for loop and if construct.
% 2.Using a logical array.
%
% Record of revisions:
% Date Programmer Description of change
% ==== ================ ==============================
% 06/01/02 S. J. Chapman Original code
%
% Define variables:
% a --Array of input values
% b --Logical array to serve as a mask
% ii,jj --Loop index
% average1 --Average time for calculation 1
% average2 --Average time for calculation 2
% maxcount --Number of times to loop calculation
% month --Month (mm)
% year --Year (yyyy)
%
% Perform calculation using loops and branches
maxcount = 1; % One repetition
tic; % Start timer
for jj = 1:maxcount
a = 1:10000; %Declare array a
for ii = 1:10000
if a(ii) > 5000
a(ii) = sqrt(a(ii));
end
end
end
average1 = (toc)/maxcount;%Calculate average time
%
% Perform calculation using logical arrays.
maxcount = 10; %One repetition
tic; %Start timer
for jj = 1:maxcount
a = 1:10000; %Declare array a
b = a > 5000; %Create mask
a(b) = sqrt(a(b)); %Take square root
end
average2 = (toc)/maxcount; %Calculate average time
%
% Display result
fprintf('Loop /if approach = %8.4f\n',average1);
fprintf('Logical array approach = %8.4f\n',average2);