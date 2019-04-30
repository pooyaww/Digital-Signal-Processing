clc
clear all
close all

N = 21;
x = bartlett(N);
x_up = zeros(2*N, 1);
x_up(1:2:end) = x;

figure, subplot(211), stem(x)
subplot(212), stem(x_up)


Nfft=1024
X=fft(x,Nfft);
X_up=fft(x_up,Nfft);
w=2*pi*[0:Nfft-1]/Nfft;
figure, plot(w, 20*log10(abs(X)));
hold on
plot(w, 20*log10(abs(X_up)), 'r--');
hold off
legend('|X(\omega)|', '|Xup(\omega)|') ;
figure, plot(2*pi*[-Nfft/2:Nfft/2-1]/Nfft, fftshift(10*log10(abs(X_up).^2 )));


figure, plot(w/2,20*log10(abs(X)))
xlim([0, 2*pi])
hold on
plot(w, 10*log10(abs(X_up).^2 ), 'r--');
hold off


