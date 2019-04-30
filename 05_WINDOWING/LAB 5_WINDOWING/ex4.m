clc
clear all
close all



N = 10000;
n = [0 :N-1];
omega1 = 0.2*pi;
omega2 = 0.3*pi;
A=0.05;
x = exp(j*omega1*n) + A*exp(j*(omega2*n+pi));

deltaomega=abs(omega1-omega2);

L=1; %rect window
Mmin=(2*L*2*pi)/deltaomega

M = input('Window length? ');


wind = window(@rectwin, M);
wind = [wind; zeros(N-M,1)]';

xw=x.*wind;

Xw = fft(xw, N);
w = 2*pi*[0:N-1]/N;
subplot(2,1,1)
plot(w, 20*log10(abs(Xw)))
ylim([-50 50 ])
grid on


wind2 = window(@hanning, M);
wind2 = [wind2; zeros(N-M,1)]';

xh = x.*wind2;
Xh = fft(xh, N);
subplot(2,1,2)
plot(w, 20*log10(abs(Xh)))
ylim([-50 50 ] )
grid on
