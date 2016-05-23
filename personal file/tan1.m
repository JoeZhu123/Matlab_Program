%Calculate the value of tan(theta):
%Define the variables
%theta---the angle you want to know its 'tan' value
%Prompt the user of inputting the variable
theta=input('The angle theta is:');
if abs(cos(theta))>=10^(-20)
   tan(theta)=sin(theta)/cos(theta);
else
     disp('Error!');
end
    