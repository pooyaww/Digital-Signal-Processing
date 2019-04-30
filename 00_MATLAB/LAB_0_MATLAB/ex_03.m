%% EXERCISE 3

% This script illustrate for loop
clc
close all
clear all

figure,
x = -1:.05:1;
for n = 1:8
subplot(4,2,n), plot(x,sin(n*pi*x))
end
pause

figure
x = -1:.05:1;
for n = 1:2:8
subplot(4,2,n), plot(x,sin(n*pi*x))
subplot(4,2,n+1), plot(x,cos(n*pi*x))
%pause
end
pause
% draw sin(nx) and cos(nx) for n = 1; 3; 5; 7 alongside each other.


for counter = [23 11 19 5.4 6]
counter
end
% repeats the code as far as the end with counter=23 the first time, 
% counter=11 the second time, and so forth.