% Example 2.7

clc
clear all
close all


%

% x(n)=[3,11,7,0,-1,4,2]; nx = [-3:3]

% h(n)=[2,3,0,-5,2,1]; nh = [-1:4]

% y(n)=conv(x,h)

x = [3, 11, 7, 0, -1, 4, 2]; nx = [-3: 3];

h = [2, 3, 0, -5, 2, 1]; nh = [-1: 4];

[y,ny] = conv_m(x,nx,h,nh)

[yt,nyt, H]=conv_tp(x',nx,h',nh) 