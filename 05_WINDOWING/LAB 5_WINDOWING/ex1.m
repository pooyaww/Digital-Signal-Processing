clc
clear all 
close all



% WINDOWING

f = 510;                   %Sinusoid frequency
N = 500;                    %Sequence length
T = 1/10000;                  %Sampling period
% Fs/N*f = 0.039 
t = 0:T:(N-1)*T;          %Temporal axis


x = exp(j*2*pi*f*t);
X=fft(x);
figure,   % in normalized freq
subplot(2,2,1), plot(t,real(x)), title('real(x)'), xlabel('time')
subplot(222), plot(t, imag(x)), title('imag(x)'), xlabel('time')
subplot(223), plot([0:N-1]/(T*N),abs(X));  title('DFT(x)'), xlabel('frequencies [Hz]'), ylabel('|X|')
subplot(224), plot([0:N-1]/(T*N), phase(X));   title('DFT(x)'), xlabel('frequencies [Hz]'), ylabel('<X')



% window
w=window(@bartlett,50);
w=[w(1:50); zeros(N-50,1)]';
W = fft(w);
figure,   % in normalized freq
subplot(2,2,1), plot(t,real(w)), title('real(w)'), xlabel('time')
subplot(222), plot(t, imag(w)), title('imag(w)'), xlabel('time')
subplot(223), plot([0:N-1]/(T*N),abs(W));  title('DFT(W)'), xlabel('frequencies [Hz]'), ylabel('|W|')
subplot(224), plot([0:N-1]/(T*N), phase(W));   title('DFT(W)'), xlabel('frequencies [Hz]'), ylabel('<W')



%windowing
xw=x.*w;

Xw=fft(xw);
figure,   % in normalized freq
subplot(2,2,1), plot(t,real(xw)), title('real(xw)'), xlabel('time')
subplot(222), plot(t, imag(xw)), title('imag(xw)'), xlabel('time')
subplot(223), plot([0:N-1]/(T*N),abs(Xw));  title('DFT(xw)'), xlabel('frequencies [Hz]'), ylabel('|Xw|')
subplot(224), plot([0:N-1]/(T*N), phase(Xw));   title('DFT(xw)'), xlabel('frequencies [Hz]'), ylabel('<Xw')
