function [root,n]=bisect(f,a,b,err)
yc=1;
n=0;
while((b-a)>err)&&(yc~=0);
    c=(a+b)/2;
    x=a;
    ya=eval(f);
    x=b;
    yb=eval(f);
    x=c;
    yc=eval(f);
    if ya*yc<0
        b=c;
    else
        a=c;
    end
    root=c;
    n=n+1;
end