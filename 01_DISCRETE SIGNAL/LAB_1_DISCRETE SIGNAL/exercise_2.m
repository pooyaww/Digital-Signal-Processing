clc
clear all
close all

x=rand(1,100);
figure, stem(x)
title('sequence with uniform distribution [0;1]')
xlabel('n')
ylabel('x(n)')
x1=x+2;
figure, stem(x1)
title('sequence with uniform distribution from 2 to 3')
xlabel('n')
ylabel('x(n)')

x2=(rand(1,100)*3)+2;
figure, stem(x2)
title('sequence with uniform distribution from 2 to 3')
xlabel('n')
ylabel('x(n)')


clear n, clear x, clear x1, clear x2


% generate i.i.d. Gaussian sequence of 100 samples, zero mean, variance = 1
x1 = randn(100, 1);
% generate i.i.d. Gaussian sequence of 100 samples, mean = m, variance = v
m = 1 ;
v = 2 ;
x2 = sqrt(v)*randn(1000,1)+m;

figure, subplot(211), stem(x1)
title('sequence with normal distribution')
xlabel('n')
ylabel('x(n)')
axis([1 100 -3 3])
subplot(212), stem(x2)
axis([1 100 m-3*sqrt(v) m+3*sqrt(v)])
title('sequence with gaussian distribution')
xlabel('n')
ylabel('x(n)')

figure, hist(x2,50)

m2s=mean(x2)
v2s=var(x2)


x3=3*x2+5;

m3s=mean(x3)
m3=3*m+5
v3s=var(x3)
v3=(3^2)*v

figure, stem(x3)
title('sequence with gaussian distribution')
xlabel('n')
ylabel('x(n)')
axis([1 100 m3-3*sqrt(v3) m3+3*sqrt(v3)])

figure, hist(x3,50)