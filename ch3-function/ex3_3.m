function [avglesson,variance]=ex3_3(varargin)
n=length(varargin);
sumlesson=[0,0,0,0,0];
for i=1:5
    for j=1:n
        sumlesson(i)=sumlesson(i)+varargin{j}(i);
    end
end
avglesson=sumlesson/n;
avgscore=sum(avglesson)/5;
variance=0;
for i=1:5
    variance=variance+(avglesson(i)-avgscore)^2;
end
variance=variance/(5-1);
