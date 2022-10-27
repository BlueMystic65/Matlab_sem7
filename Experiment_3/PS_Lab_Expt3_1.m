clear
clc
dt = [0.004 5.3 500 300 50; 0.006 5.5 400 300 50; 0.009 5.8 200 300 50];
pd = 800;
a = dt(:,1);
b = dt(:,2);
c = dt(:,3);
pd = 800;
ng = length(a);
sol = 0;
pmx = dt(:,4);
pi = 1:ng;
pf = zeros(ng,1);

while sol==0
    lambda=(pd+sum(b./(2.*a)))/sum(1./(2.*a));
    pg=(lambda-b)./(2.*a);
    if sum((pg>pmx))>0
        x=find(pg>pmx);
        a(x)=[];
        b(x)=[];
        pf(pi(x))=pmx(x);
        pd=pd-pmx(pi(x));
        pg(x)=[];
        pmx(x)=[];
        pi(x)=[];
    end
    if abs(sum(pg)-pd)<0.001
        sol=1;
    end
end
pf(pi)=pg
        
    

