clc
clear all
close all

[x,Fs,nbits] = wavread('flute2.wav');

tstart = 1 ; %s e c
D = 0.050 ; %observation time = 50msec
n = tstart*Fs : 1 : (tstart+D)*Fs ; %in samples

y = x(n); 

N = length(y);
Nfft = 2^ceil(log2(2*N - 1)+1) 

[r lags] = xcorr(y, 'biased');
rw = r.*bartlett(2*N-1);
figure, subplot(211), stem(rw)

r = circshift(rw,N);
subplot(212), stem(r)

phiBT = real(fft(r,Nfft));

w = 2*pi*[0:Nfft-1]/Nfft;
figure, plot(w,phiBT);