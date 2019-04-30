clear, 
clc, 
close all;
[x, Fs] = wavread('flute2.wav');
x = x';
M = 2;
N = length(x);
% decimate (LPF + downsample )
xdec = decimate(x,M);
% upsample
xdecup = zeros(N,1);
xdecup(1:M:end) = xdec;

% interpolate
% truncated sinc
Nfft = 2^14;
w = 2*pi*[0:Nfft-1]/Nfft;
Nh = 500;
n = [-Nh/2 :Nh/2];
h1 = sinc(n/M)';
H1 = fft(h1,Nfft);
% linear
h2 = bartlett(2*M+1);
H2 = fft(h2,Nfft);
% sample hold
h3 = ones(M,1);
H3 = fft(h3, Nfft);
plot(w, 20*log10(abs(H1)));
hold on
plot(w, 20*log10(abs(H2)), 'r');
plot(w, 20*log10(abs(H3)), 'g');
legend('truncated sinc', 'linear', 'sample hold');
hold off
x1 = filter(h1, 1, xdecup)';
x2 = filter(h2, 1, xdecup)';
x3 = filter(h3, 1, xdecup)';
figure
plot(x, 'k')
hold on
plot(x1, 'b')
plot(x2, 'r')
plot(x3, 'g')