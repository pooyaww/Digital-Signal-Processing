% Chapter 4: Example 4.6:

%  Compute the inverse z-transform of X=B/A

%
clc
close all
clear all

b = [0 0 0 0.25 -0.5 0.0625]; 
a = [1 -1 0.75 -0.25 0.0625];
[delta, n] = impseq(0,0,7)

x = filter(b,a,delta)

xv = [(n-2).*((1/2).^(n-2)).*(cos(pi*(n-2)/3))].*stepseq(2,0,7)  %original sequence

