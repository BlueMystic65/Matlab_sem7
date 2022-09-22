clc
clear
lineData = [1 2 0.02 0.04 0
            1 3 0.01 0.03 0
            2 3 0.0125 0.025 0];
        
j = sqrt(-1);
nbus = max(max(lineData(:,1)),max(lineData(:,2)));
nbr = length(lineData(:,1));
R = lineData(:,3);
X = lineData(:,4);

Z = R+j*X;
Y = 1./Z;
yb = zeros(nbus,nbus);
from = lineData(:,1);
to = lineData(:,2);

for i =1: nbr
    yb(from(i),from(i)) = yb(from(i),from(i))+Y(i);
    yb(to(i),to(i)) = yb(to(i),to(i)) + Y(i);
    yb(from(i),to(i)) = yb(from(i),to(i)) - Y(i);
    yb(to(i),from(i)) = yb(to(i),from(i)) - Y(i);
end
display(yb);