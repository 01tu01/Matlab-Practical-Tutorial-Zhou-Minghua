x=0:pi/100:2*pi;
y=sin(x);
subplot(2,2,1)
plot(x,y);
title('(1)');
clear x;
x=0:pi/100:2*pi;
y=cos(x);
subplot(2,2,2)
plot(x,y);
title('(2)');
clear x;
t=0:pi/100:pi
x=cos(3*t);
y=sin(5*t);
subplot(2,2,3)
plot(x,y);
title('(3)');
clear x,y,t;
a=1;
theta=0:0.01*pi:2*pi;
rho=a*sin(3*theta);
subplot(2,2,4)
polar(theta,rho);
title('(4)');