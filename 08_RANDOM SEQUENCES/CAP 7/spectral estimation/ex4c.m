clc
close all
clear all

a = [ 1 -0.9 -0.01];
b = [ 1 0.1];

N = 10000;
Nfft = 2^14;

z = randn(N,1);

x = filter(b, a, z);
[H, w] = freqz(b, a, Nfft);

L = 10;
M = N/L;
X = zeros(L,M);
s = 1;
for m = 0 : M : N-M
    xm = x(m+1 : m + M) ;
    X(s, :) = (1/M)*abs(fft(xm,M)).^2;
    s = s + 1 ;
end
PHIW = mean(X,1);

plot(w, 20*log10(abs(H))); %real
hold on
wW = 2*pi*[0 : M-1]/M;
plot(wW, 10*log10(abs(PHIW)), 'r');
hold off
% repeat this for R = 100 realization to compute the bias
% and the variance