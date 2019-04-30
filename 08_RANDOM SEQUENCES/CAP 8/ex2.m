clc
close all
clear all

M = 100000; 
p = 6;

a = [0.8; 0.1; 0.05];
randn('state',0) 
e = randn (M,1);
s = filter(1, [1 ; -a], e);


r = xcorr(s,p);
r = r(p+1: end);

% what follows is equivalent to
% [A,E,K] = LEVINSON(r,i)
% for i = 1 : p
Eest = zeros(p+1, 1);
kest = zeros(p, 1);
aest = zeros(p, p);
Eest(1) = r(1);
for i = 1 : p
    temp = 0 ;
    for j = 1 : i-1
        temp = temp + aest(j, i-1)*r(i-j + 1);
    end
    kest(i) = (r(i+1) - temp )/ Eest(i);
    aest(i,i) = kest(i);
    for j =1: i-1
        aest(j,i) = aest(j,i-1) - kest(i)*aest(i-j,i-1);
    end
    Eest(i+1) = (1- kest(i)^2)* Eest(i);
end
plot(Eest(2:end))
a= aest(:,p)

eres = filter([1 ; -a], 1, s);
figure, plot(eres)

