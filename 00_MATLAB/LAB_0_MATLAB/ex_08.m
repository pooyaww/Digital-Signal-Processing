%% EXERCISE 8

% This script introduces generalized sinusoids
clc
close all
clear all

t=0:1:100; 			% temporal axis [sec]
fi=pi/10; 
ro=1;
s=(ro.^t).*(exp(i*fi*t)); 		
figure, subplot(2,1,1), plot(t, abs(s),'.');
subplot(2,1,2), plot(t, angle(s),'.');

ro=0.9;
s=(ro.^t).*(exp(i*fi*t)); 		
figure, subplot(2,1,1), plot(t, abs(s),'.');
subplot(2,1,2), plot(t, angle(s),'.');

ro=1.1;
s=(ro.^t).*(exp(i*fi*t)); 		
figure, subplot(2,1,1), plot(t, abs(s),'.');
subplot(2,1,2), plot(t, angle(s),'.');

fi=pi;
ro=1;
s=(ro.^t).*(exp(i*fi*t)); 		
figure, subplot(2,1,1), plot(t, abs(s),'.');
subplot(2,1,2), plot(t, angle(s),'.');

fi=0;
ro=1;
s=(ro.^t).*(exp(i*fi*t)); 		
figure, subplot(2,1,1), plot(t, abs(s),'.');
subplot(2,1,2), plot(t, angle(s),'.');



