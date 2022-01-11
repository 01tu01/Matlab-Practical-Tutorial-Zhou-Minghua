function [root,n]=ex5_1iterate(fun,x0)
root=feval(fun,x0);
n=1;
while(abs(root-x0)>=1.0e-6)&(n<=1000)
    x0=root;
    root=feval(fun,x0);
    n=n+1;
end
