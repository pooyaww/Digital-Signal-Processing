clc
clear all
close all


Fs = 1 ; %sampling frequency
T = 1/Fs ; %sampling period
f1 = 1/8; %normalized frequency
f2 = 1/16; %normalized frequency

L = 10 ; %number of observations
M = 100; %number of samples / observation
N = L*M; %total number of samples

n = [ 0 :N-1]';
y = sin(2*pi*f1*n*T) + sin(2*pi*f2*n*T) + 2*randn(N,1);

phil = zeros(M,1); 
for l = 0 :L-1
    yl = y(1+l*M : M+l*M) ;
    phil = phil + (1/M)*abs(fft(yl)).^2;
end
phiB = phil/L;

w = 2*pi*[0 :M-1]/M;
plot(w, phiB);
maxval = 1.1*max(phiB);
axis([0 2*pi 0 maxval])