clc
close all
clear all

p = [0.99, 0.9*exp(j*0.2*pi), 0.9*exp(-j*0.2*pi), 0.95*exp(j*0.5*pi), 0.95*exp(-j*0.5*pi)];
a = poly(p);

N = 1000;
z = randn(N,1);

x = filter(1, a, z);
Nfft = 2^14;
[H, w] = freqz(1, a, Nfft);

%estimate PSD by mean Bartlett method
S = 5;  %subsequences
M = N/S; %samples for each subsequence
X = zeros(S,M);
s = 1;
for m = 0 : M : N-M
    xm = x(m+1 : m+M);
    X(s, :) = (1/M)*abs(fft(xm,M)).^2;
    s = s + 1 ;
end
PHIB = mean(X,1);

%estimate PSD by mean AR model
p = 5;
r = xcorr(x, p)
R = toeplitz(r(p+1: end-1));
rx = r(p+2: end);
a = -R^(-1)*rx;
%varz = r(p+1) +sum(a.*r(p:-1:1))
[Hest , w] = freqz(1, [1, a'], Nfft);


plot(w, 20*log10(abs(H)));
hold on
wB = 2*pi*[0 : M-1]/M;
plot(wB(1:(end+1)/2), 10*log10(abs(PHIB(1:(end+1)/2))), 'r');
hold off
hold on
plot(w, 10*log10(abs(Hest).^2), 'g')
%plot(w, 10*log10(varz*abs(Hest).^2), 'g')
hold off
legend('real(\omega)', '\phi_{B} (\omega)','\phi_{AR}(\omega)');