clc
clear all
close all

N = 41 ;
x = bartlett(N);
x_down = x(1:2:end);

figure, subplot(211), stem(x)
subplot(212), stem(x_down)

%[H, w] = freqz(x, 1, 1024);
%[H_down, w] = freqz(x_down, 1, 1024);
Nfft=1024
X=fft(x,Nfft);
X_down=fft(x_down,Nfft);
w=2*pi*[0:Nfft-1]/Nfft;
figure, plot(w, 20*log10(abs(X)));
hold on
plot(w, 20*log10(abs(X_down)), 'r--');
hold off

figure, subplot(211), plot(w*2, 20*log10(abs(X)))
X_s=zeros(Nfft,1);
X_s(1:Nfft/2)=X((Nfft/2)+1:Nfft);
X_s((Nfft/2)+1:Nfft)=X(1:Nfft/2);
subplot(212), plot(w*2,20*log10(abs(X+X_s)))

figure, plot(w*2,20*log10(abs(X+X_s)))
xlim([0, 2*pi])
hold on
plot(w, 10*log10(abs(X_down).^2 ), 'r--');
hold off


% Let's see the alias
w1=pi/16;
w2=pi/8;
w3=pi/2;
n=[0:200];
x = cos(w1*n)+0.5*cos(w2*n)+2*cos(w3*n);

x_down = x(1:4:end);

figure, subplot(211), stem(x)
subplot(212), stem(x_down)

Nfft=1024
X=fft(x,Nfft);
X_down=fft(x_down,Nfft);
w=2*pi*[0:Nfft-1]/Nfft;
figure, plot(w, 20*log10(abs(X)));
hold on
plot(w, 20*log10(abs(X_down)), 'r--');
hold off
legend('|X(\omega)|', '|Xdown(\omega)|') ;
