clc
clear all
close all

Nfft=1024;
N=41;
M=4;
fc=1/(2*M)


h = fir1(N,2*fc) ;
figure,
subplot(211), stem(h)
H=fft(h,Nfft);
w=2*pi*[0:Nfft-1]./Nfft;
subplot(212), plot(w,20*log10(abs(H)))

w1=pi/16;
w2=pi/8;
w3=pi/2;
n=[0:200];
x = cos(w1*n)+0.5*cos(w2*n)+2*cos(w3*n);
%[x, Fs] = wavread('flute2.wav');
% x = x';


xup = zeros(M*length(x), 1); 
xup(1:M:end ) = x ;

xint = filter(M*h, 1, xup);

figure,
subplot(3,1,1), plot(x)
subplot(3,1,2), plot(xup)
subplot(3,1,3), plot(xint)


[H, w] = freqz(x,1,1024);
[Hup, w] = freqz(xup,1,1024);
[Hint, w] = freqz(xint,1,1024);

figure,
plot(w, 10*log10(abs(H).^2));
hold on
plot(w, 10*log10(abs(Hup).^2), 'g-.');
plot(w, 10*log10(abs(Hint).^2), 'r--');
hold off
legend('|X(\omega)|', '|Xup(\omega)|', '|Xint(\omega)|') ;


figure,
subplot(3,1,1), plot(w, 10*log10(abs(H).^2))
subplot(3,1,2), plot(w, 10*log10(abs(Hup).^2), 'g-.');
subplot(3,1,3), plot(w, 10*log10(abs(Hint).^2), 'r--');


% see also
int= interp(x,M);
 
figure,
plot(w, 10*log10(abs(Hint).^2), 'r--');
hold on
[INT, w] = freqz(int,1,1024);
plot(w, 10*log10(abs(INT).^2));
hold off
legend('|Xint(\omega)|', '|Xinterp with Matlab(\omega)|') ;


%swap
%CASE A
hd=h(1:M:end);
xf = filter(M*hd, 1, x);
xfup = zeros(M*length(xf), 1); 
xfup(1:M:end ) = xf ;

figure,
plot(w, 10*log10(abs(Hint).^2), 'r--');
hold on
[Hfup, w] = freqz(xfup,1,1024);
plot(w, 10*log10(abs(Hfup).^2));
hold off

% CASE B
xf = filter(M*h, 1, x);
xfup = zeros(M*length(xf), 1); 
xfup(1:M:end ) = xf ;


figure,
plot(w, 10*log10(abs(Hint).^2), 'r--');
hold on
[Hfup, w] = freqz(xfup,1,1024);
plot(w, 10*log10(abs(Hfup).^2));
hold off