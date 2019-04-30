% Chapter 7: Example 7.5

clc
clear all
close all
%


h = [-4 1 -1 -2 5 6 6 5 -2 -1 1 -4]

M = length(h); n=0:M-1;

[Hr,w,b,L] = hr_type2(h);

H = fft(h,1024);

k = 0:1024-1;

ww = (2*pi/1024).*k;

figure,

subplot(2,1,1); stem(n,h); title('Impulse response'); grid

xlabel('n'); ylabel('h(n)')

subplot(2,1,2); stem(b); title('b(n) coefficients');grid

xlabel('n'); ylabel('b(n)')


figure,

subplot(2,2,1); plot(w/pi,Hr); title('Amplitude Response'); grid

xlabel('frequency in pi units'); ylabel('Hr(w)')

subplot(2,2,3); plot(ww(1:length(ww)/2)./pi,abs(H(1:length(ww)/2))); title('Modulus'); grid

xlabel('frequency in pi units'); ylabel('|H(w)|')

subplot(2,2,4); plot(ww(1:length(ww)/2)./pi,unwrap(angle(H(1:length(ww)/2)))./pi); title('Phase'); grid

xlabel('frequency in pi units'); ylabel('<(H(w))')

figure, zplane(h,1)