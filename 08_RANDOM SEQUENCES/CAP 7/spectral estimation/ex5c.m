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

M = 200; %number of samples / observation
K = M/ 4 ; %new samples / observation
S = N/K - (M-K)/K; %number of observations

phis = zeros(M,1); 
v = hamming(M) ;
P = (1/M)*sum(v.^2);

for s = 0 : S-1
    xs = x(1+s*K : M+s*K) ;
    phis = phis+ (1/(M*P))*abs(fft(v.*xs)).^2 ;
end

phiW = phis/S;

plot(w, 20*log10(abs(H))); %real
hold on
wW = 2*pi*[0 : M-1]/M;
plot(wW, 10*log10(abs(phiW)), 'r');
hold off
% repeat this for R = 100 realization to compute the bias
% and the variance