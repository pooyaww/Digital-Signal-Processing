clc
clear all
close all

[x,Fs,nbits] = wavread('flute2.wav');

tstart = 1 ; %s e c
D = 0.050 ; %observation time = 50msec
n = tstart*Fs : 1 : (tstart+D)*Fs ; %in samples

y = x(n); 

N = length(y);

M = 2^ceil(log2(2*N - 1)+1) ;

[r lags] = xcorr(y, 'biased');
figure, subplot(211), stem(r)

r = circshift(r,N);
subplot(212), stem(r)

phir = fft(r,M);
w = 2*pi*[0:M-1]/M;
figure, plot(w,phir);