function msum=ex3_2(t,x)
n=length(x)-1;
msum=0;
for j=0:n
    msum=msum+factorial(n)/(factorial(n-j)*factorial(j))*(t^j)*((1-t)^(n-j))*(x(j+1));
end