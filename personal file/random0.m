function ran = random0(n,m)
%RANDOM0 Generate uniform random numbers in [0,1)
% Function RANDOM0 generates an array of uniform
% random numbers in the range [0,1). The usage
% is:
%
% random0(n) --Generate an n x n array
% random0(n,m) --Generate an n x m array
% Define variables:
% ii --Index variable
% ISEED --Random number seed (global)
% jj --Index variable
% m --Number of columns
% msg --Error message
% n --Number of rows
% ran --Output array
% Record of revisions:
% Date Programmer Description of change
% ==== ========== =====================
% 12/16/98 S. J. Chapman Original code
% Declare globl values
global ISEED % Seed for random number generator
% Check for a legal number of input arguments.
msg = nargchk(1,2,nargin);
error(msg);
% If the m argument is missing, set it to n.
if nargin < 2
m = n;
end
% Initialize the output array
ran = zeros(n,m);
% Now calculate random values
for ii = 1:n
for jj = 1:m
ISEED = mod(8121*ISEED + 28411, 134456 );
ran(ii,jj) = ISEED / 134456;
end
end
