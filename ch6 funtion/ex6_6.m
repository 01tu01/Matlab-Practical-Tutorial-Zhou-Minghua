function y=ex6_6(b,x)
y=b(1)+b(2).*x(:,1)+b(3).*sin(x(:,2))+b(4).*(log(x(:,3))).*x(:,4);
% y=b(1).^2.*x(:,1)+b(2).*sin(x(:,2))+b(3).*(log(x(:,3))).*x(:,4);