function [root,n]=ex5_1newton(fun,dfun,x0)
root=x0-feval(fun,x0)/feval(dfun,x0);
n=1;
while(abs(root-x0)>=1.0e-6)&(n<=100)
    x0=root;
    root=x0-feval(fun,x0)/feval(dfun,x0);
    n=n+1;
end