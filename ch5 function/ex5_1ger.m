function [root,n]=ger(fun,x0,x1)
f1=feval(fun,x0);
f2=feval(fun,x1);
root=x1-f2*(x1-x0)/(f2-f1);
n=1;
while(abs(x1-x0)>=1.0e-4)&(n<=1000);
    x0=x1;
    x1=root;
    x=x0;
    f1=feval(fun,x);
    x=x1;
    f2=feval(fun,x);
    root=x1-f2*(x1-x0)/(f2-f1);
    n=n+1;
end