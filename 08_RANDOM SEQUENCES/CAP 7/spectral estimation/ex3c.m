clc
clear all
close all


Fs = 1; %sampling frequency
T = 1/Fs ; %sampling period

f1 = 1/8; %normalized frequency
f2 = 1/16; %normalized frequency

N = 1000; %number of samples
n = [ 0 :N-1]' ;

y = sin(2*pi*f1*n*T) + sin(2*pi*f2*n*T) + 2*randn(N,1); 

M = floor(N/10);

r = xcorr(y, 'biased');
r = r(N-M+1 : N+M-1);
r = r.*bartlett(2*M - 1 );
r = circshift(r, M);

phiBT = fft(r,M);
w = 2*pi*[0:M-1]/M;

figure, plot(w,phiBT);

maxval = 1.1*max(phiBT);
axis([ 0 2*pi 0 maxval ]) ;