clc
clear all
close all

Fs = 1 ; %sampling frequency
T = 1/Fs ; %sampling period
f1 = 1/8; %normalized frequency
f2 = 1/16; %normalized frequency

M = 200; %number of samples / observation
K = M/ 4 ; %new samples / observation
N = 1000; %number of samples
S = N/K - (M-K)/K; %number of observations

n = [ 0 :N-1]';

y = sin(2*pi*f1*n*T) + sin(2*pi*f2*n*T) + 2*randn(N,1);

phis = zeros(M,1); 

v = hamming(M) ;

P = (1/M)*sum(v.^2);

for s = 0 : S-1
    ys = y(1+s*K : M+s*K) ;
    phis = phis+ (1/(M*P))*abs(fft(v.*ys)).^2 ;
end

phiW = phis/S;

w = 2*pi*[0:M-1]/M;
plot(w, phiW);
maxval = 1.1*max(phiW) ;
axis ([ 0 2*pi 0 maxval] )