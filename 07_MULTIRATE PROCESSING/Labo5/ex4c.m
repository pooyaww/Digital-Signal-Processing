clc
clear all
close all

Nfft=1024;
w=2*pi*[0:Nfft-1]/Nfft;

N=41;
M=4;
fc=1/(2*M)

h = fir1(N,2*fc) ;

w1=pi/16;
w2=pi/8;
w3=pi/2;
n=[0:200];
x = cos(w1*n)+0.5*cos(w2*n)+2*cos(w3*n);
X = fft(x,Nfft);

xfilt = conv(h,x);
Xfilt = fft(xfilt,Nfft) ;

xdec = xfilt(1:M:end);

xup = zeros(M*length(xdec), 1); 
xup(1:M:end ) = xdec ;

xint = filter(M*h, 1, xup);
Xint = fft(xint,Nfft);


figure,
plot(w, 10*log10(abs(X).^2), 'b--');
hold on
plot(w, 10*log10(abs(Xfilt).^2), 'r--');
plot(w, 10*log10(abs(Xint).^2), 'g--');
hold off
axis([0 pi -50 50])