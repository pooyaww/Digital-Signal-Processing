clc
clear all
close all


varx = 1 ; 
varz = 0.1;
x = sqrt(varx)*randn(1000,1);
z = sqrt(varz)*randn (1000,1);
y = x + z;

figure, stem(y);
figure, hist(y,100)

media=mean(y)
vary=varx+varz


figure, plot(x,y,'o');
figure, plot(z,y,'o');
figure, plot(x,z,'o');