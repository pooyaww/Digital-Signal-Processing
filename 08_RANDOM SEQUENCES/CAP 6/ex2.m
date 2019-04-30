clc
clear all
close all


% generate i.i.d. Gaussian sequence of 1000 samples, zero mean, variance = 1
x1 = randn(1000, 1);
% generate i.i.d. Gaussian sequence of 1000 samples, mean = m, variance = v
m = 1 ;
v = 2 ;
x2 = sqrt(v)*randn(1000,1)+m;

figure, subplot(211), stem(x1)
axis([1 100 -3 3])
subplot(212), stem(x2)
axis([1 100 m-3*sqrt(v) m+3*sqrt(v)])

figure, hist(x2,100)

m2s=mean(x2)
v2s=var(x2)


x3=3*x2+5;

m3s=mean(x3)
m3=3*m+5
v3s=var(x3)
v3=(3^2)*v

figure, stem(x3)
axis([1 100 m3-3*sqrt(v3) m3+3*sqrt(v3)])

figure, hist(x3,100)