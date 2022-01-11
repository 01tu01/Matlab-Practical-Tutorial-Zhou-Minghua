u=-20:0.02:20;
v=0:pi/100:2*pi;
[U,V]=meshgrid(u,v);
X=2.*sec(U).*cos(V);
Y=3.*sec(U).*sin(V);
Z=4.*tan(U);
subplot(2,3,1)
mesh(X,Y,Z);
shading interp;
colormap(jet);
axis equal;
clear;
a=2;b=3;c=4;
u=-20:0.2:20;
v=0:pi/100:2*pi;
[U,V]=meshgrid(u,v);
X=a.*tan(U).*cos(V);
Y=b.*tan(U).*sin(V);
Z=c.*sec(U);
subplot(2,3,2)
mesh(X,Y,Z);
shading interp;
colormap(jet);
axis equal;
clear;
a=2;b=3;
u=-20:0.2:20;
v=-20:0.2:20;
[U,V]=meshgrid(u,v);
X=a*(U+V);
Y=b*(U-V);
Z=4*U.*V;
subplot(2,3,3)
mesh(X,Y,Z);
shading interp;
colormap(jet);
clear;
a=2;b=3;
u=-20:0.2:20;
v=-20:0.2:20;
[U,V]=meshgrid(u,v);
X=a*U;
Y=b*U;
Z=U.^2-V.^2;
subplot(2,3,4)
mesh(X,Y,Z);
shading interp;
colormap(jet);
clear;
v=-1:0.01:1;
t=0:pi/100:2*pi;
[V,T]=meshgrid(v,t);
X=(1+3*V.*cos(T./2)).*cos(T);
Y=(1+3*V.*cos(T./2)).*sin(T);
Z=3*V.*sin(T./2);
subplot(2,3,5)
mesh(X,Y,Z);
shading interp;
colormap(jet);