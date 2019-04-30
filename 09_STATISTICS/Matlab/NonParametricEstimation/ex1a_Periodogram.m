%clc
%clear all
%close all

[x,Fs,nbits] = wavread('flute2.wav');

tstart=1 ; %sec
D = 0.050; %observation time = 50msec
n = tstart*Fs : 1 : (tstart+D)*Fs ; %in samples

y = x(n); 

N = length(y);

M = 2^ceil(log2(N)+1); %number of frequency bins

phip = (1/N)*abs(fft(y,M)).^2;

w = 2*pi*[0:M-1]/M;
figure, plot(w,phip);
axis([ 0 2*pi 0 100])