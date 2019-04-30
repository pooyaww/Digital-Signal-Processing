clear, 
clc, 
close all;

w1=pi/16;
w2=pi/8;
w3=pi/2;
n=[0:200];
x = cos(w1*n)+0.5*cos(w2*n)+2*cos(w3*n);
%[x, Fs] = wavread('flute2.wav');
%x = x';

M = 4;
N = length(x);

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

figure, subplot(311), plot(h1)
subplot(312), plot(h2,'r')
subplot(313), plot(h3,'g')

figure, plot(w, 20*log10(abs(H1)));
hold on
plot(w, 20*log10(abs(H2)), 'r');
plot(w, 20*log10(abs(H3)), 'g');
legend('truncated sinc', 'linear', 'sample hold');
hold off

xup = zeros(M*length(x), 1); 
xup(1:M:end ) = x ;

x1 = filter(h1, 1, xup)';
x2 = filter(h2, 1, xup)';
x3 = filter(h3, 1, xup)';

X1 = fft(x1,Nfft);
X2 = fft(x3,Nfft);
X3 = fft(x3,Nfft);

figure, subplot(311), plot(w, 20*log10(abs(X1)));
title('truncated sinc')
subplot(312), plot(w, 20*log10(abs(X2)), 'r'); title('linear')
subplot(313), plot(w, 20*log10(abs(X3)), 'g'); title('sample hold')
