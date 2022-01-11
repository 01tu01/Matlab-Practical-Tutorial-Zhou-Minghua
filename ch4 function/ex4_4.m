function f=ex4_4(x,a)
n=length(x);
f=[];
for i=1:n
    if x(i)<0
        f(i)=a.*x(i).*x(i);
    elseif 0<=x(i)<1
        f(i)=1+a;
    else
        f(i)=exp(-a.*x(i));
    end
end