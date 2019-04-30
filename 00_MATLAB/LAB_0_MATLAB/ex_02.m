%% EXERCISE 2

% This script illustrate some example of marices
clc
close all
clear all

D = [1:5; 6:10; 11:2:20]
size(D)

%transpose
D'
size(D')


%symmetric
S = [2 -1 0; -1 2 -1; 0 -1 2],
St=S'
S-St

P = ones(2,3)

Z = zeros(2,3), zeros(size(P'))

I = eye(3), x = [8; -4; 1], I*x

% Diagonal

D = [-3 0 0; 0 4 0; 0 0 2]
d = [-3 4 2], D = diag(d)

F = [0 1 8 7; 3 -2 -4 2; 4 2 1 1]
diag(F)
