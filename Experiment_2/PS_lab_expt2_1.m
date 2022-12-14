clear
clc
lineData = [1 2 0.02 0.04
            2 3 0.0125 0.025
            1 3 0.01 0.03];
        
busdata = [1 1 1.05 0 0 0 0 0
           2 2 1 0 0 0 256.6 110.2
           3 2 1 0 0 0 138.6 45.2];

z = lineData(:,3)+1j*lineData(:,4);
y = 1./z;
nbus = max(max(lineData(:,1)),max(lineData(:,2)));
yb = zeros(nbus);
nline = length(lineData(:,1));
for i = 1:nline
    fr = lineData(i,1);
    to = lineData(i,2);
    yb(fr,to) = yb(fr,to)-y(i);
    yb(to,fr) = yb(to,fr)-y(i);
    yb(fr,fr) = yb(fr,fr)+y(i);
    yb(to,to) = yb(to,to)+y(i);
end
vm = busdata(:,3);
ang = busdata(:,4);
v = vm.*(cos(ang)+1j*sin(ang));
psh = (busdata(:,5)-busdata(:,7))/100;
qsh = (busdata(:,6)-busdata(:,8))/100;
ssh = psh-1j*qsh;
vprev = v;
for iter = 1:20
    for i = 2:nbus
        vst = 0;
        for j = 1:nbus
            if i~=j
                vst = vst+yb(i,j)*v(j);
            end
        end
        v(i) = (ssh(i)/conj(v(i))-vst)/yb(i,i);
    end
    if abs(max(vprev-v))<10e-6
        break
    end
    vprev = v;
    display([iter v(2) v(3)]);
end