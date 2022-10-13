clear
clc
dt = [0.004 5.3 500 300 50; 0.006 5.5 400 300 50; 0.009 5.8 200 300 50];
pd = 800;
a = dt(:,1);
b = dt(:,2);
c = dt(:,3);
s1 = sum(b./(2*a));
s2 = sum(1./(2*a));
lambda = (pd+s1)/s2
pg = (lambda-b)./(2*a)