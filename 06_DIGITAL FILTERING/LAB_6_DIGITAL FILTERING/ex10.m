clc
clear all
close all


% NON LINEAR FILTER
A1 = 1 ;
A2 = 0.2 ;
w1 = 0.2*pi ;
w2 = 0.25*pi ;
N = 1024;
n = [0:N-1] ;
% input
x = A1*exp(j*w1*n) + A2*exp(j*w2*n);
% output
y = x.^2;
% DFT
X = fft(x);
Y = fft(y);
w = 2*pi*[0:N-1]/N;
subplot(2,1,1);
plot(w/pi,20*log10(abs(X)));
xlabel('frequency in pi units');
ylabel('|X(w)| [ d B ]');
subplot(2,1,2);
plot(w/pi,20*log10(abs(Y)));
xlabel('frequency in pi units');
ylabel('|Y(w)| [ d B ]');
% the input is the sum of 2 sinusoid.
% LTI filter ???> output is the sum of the filtered sinusoids , at the same
% frequencies
% non linear filter ???> output contains frequencies not present in the
% input , i.e. 2*w1 , 2*w2 , w1 + w2