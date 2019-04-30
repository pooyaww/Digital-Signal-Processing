clc
clear all
close all

load mtlb
x = mtlb ;
plot(x)
x = x(700:700+floor(0.02*Fs));
p = 16;

[r , k] = xcorr(x , p);
rv = r(k>= 0);
a = levinson(rv);

e = filter(a, 1, x);

figure
subplot(211), plot(x), ylim([-2 2 ]);
subplot(212), plot(e), ylim([-2 2 ]);

N = length(x);
X = (1/N)*abs(fft(x));
E = (1/N)*abs(fft(e));
f = Fs*[0 :N-1]/N;
figure
subplot(211), plot(f,X), ylim([0 0.5]);
subplot(212), plot(f,E), ylim([0 0.5]);