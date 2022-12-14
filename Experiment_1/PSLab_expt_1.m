clc
clear
lineData = [0 1 0 1.0 0
            0 2 0 0.8 0
            1 2 0 0.4 0
            1 3 0 0.2 0
            2 3 0 0.2 0
            3 4 0 0.08 0];
j = sqrt(-1);
nbus = max(max(lineData(:,1)),max(lineData(:,2)))+1;
nbr = length(lineData(:,1));
R = lineData(:,3);
X = lineData(:,4);

Z = R+j*X;
Y = 1./Z;
yb = zeros(nbus,nbus);
from = lineData(:,1);
to = lineData(:,2);

for i =1: nbr
    yb(from(i)+1,from(i)+1) = yb(from(i)+1,from(i)+1)+Y(i);
    yb(to(i)+1,to(i)+1) = yb(to(i)+1,to(i)+1) + Y(i);
    yb(from(i)+1,to(i)+1) = yb(from(i)+1,to(i)+1) - Y(i);
    yb(to(i)+1,from(i)+1) = yb(to(i)+1,from(i)+1) - Y(i);
end
display(yb);