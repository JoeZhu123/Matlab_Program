a = load('ad_lz.txt');
groy = a(:,1);
acc = a(:,2);
w = (groy-1325)/(9*0.67);
plot(1:length(groy),w);
angle_a = (acc-1320)*20/157;
for i=1:1:(length(angle_a))
    if angle_a(i,1)>90
        angle_a(i,1) = 90;
    else if angle_a(i,1)<-90
            angle_a(i,1) = -90; 
        end
    end
end
% angle = acos(angle)*180/pi;
%angle = asin((acc-1350)/800)*180/pi;
Angle = zeros(length(groy),1);
angle_g = Angle;
temp = 0;
angle_g(1,1)=30;
for i=1:1:(length(groy)-1)
    angle_g(i+1,1) = angle_g(i,1)+0.005*w(i,1);
    temp = angle_a(i,1)-Angle(i,1);
    temp = temp*0.4;
    Angle(i+1,1) = Angle(i,1)+0.005*(w(i,1)+temp);
end
plot(1:length(groy),angle_a,'r');
hold on;
plot(1:length(groy),angle_g,'b');
hold on;
plot(1:length(groy),Angle,'g');
% plot(acc,'r');
% hold on;
% plot(groy,'b');
grid on;