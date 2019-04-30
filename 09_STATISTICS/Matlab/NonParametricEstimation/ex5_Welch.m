clc
clear all
close all

[x,Fs,nbits] = wavread('flute2.wav');

tstart = 1 ; %sec
D = 0.050 ; %observation time = 50msec
n = tstart*Fs : 1 : (tstart+D)*Fs ; %in samples

y = x(n); 

N = length(y); %number of samples
M = 200; %number of samples / observation
K = M/ 4 ; %new samples / observation
S = N/K - (M-K)/K; %number of observations

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
