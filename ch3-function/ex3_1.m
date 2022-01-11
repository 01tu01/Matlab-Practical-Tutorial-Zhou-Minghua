function [mmax,mmin]=ex3_1(a,b,c)
mmax=a;mmin=a;
if b>mmax
    mmax=b;
    end
if c>mmax
    mmax=c;
end
if b<mmin
    mmin=b;
    end
if c<mmin
    mmin=c;
end
    