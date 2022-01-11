f=@(x,z)[z(2);-abs(z(1))+2*sin(x)]
tspan=[-5:0.1:5];
z0=[0,-0.5];
[t,z]=ode45(f,tspan,z0);
A=[t,z]
plot(t,z)