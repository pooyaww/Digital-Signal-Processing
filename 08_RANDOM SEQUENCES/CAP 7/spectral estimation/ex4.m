clc
clear all
close all

[x,Fs,nbits] = wavread('flute2.wav');

tstart = 1 ; %sec
D = 0.050 ; %observation time = 50msec
n = tstart*Fs : 1 : (tstart+D)*Fs ; %in samples

y = x(n); 

N = length(y);
L=10;
M=N/L;

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
