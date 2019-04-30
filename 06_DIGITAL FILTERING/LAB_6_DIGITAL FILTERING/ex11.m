clc
close all
clear all

Fs = 16000;
t = 0:1/Fs:0.01-(1/Fs);
N=length(t)

%   Generate the input signals
xl = cos(2*pi*0.05*Fs*t);

xh = cos(2*pi*0.44*Fs*t);


% input signal
x = xl + xh;

M = input('Filter length? ');
% M = 10
num = (1/M).*ones(M, 1);

delta = [1 zeros(1 ,N-1)];
h = filter(num, 1, delta);
%   Filtering with the filter function
y = filter(num, 1, x);

%   Plot the results
subplot(211), plot(t, x), title('Input signal'), xlabel('time (s)'), ylabel('x(t)');
subplot(212), plot(t, y), title('Filtered signal'), xlabel('time (s)'), ylabel('y(t)');


Y=abs(fft(y));
%   Plot the spectrum
figure, subplot(311), plot(2*[0:length(x)-1]/length(x), abs(fft(x))), 
title('Input signal spectrum'), 
xlabel('frequency in pi units'), ylabel('|X(\omega/pi)|');
subplot(312), plot(2*[0:length(x)-1]/length(x),abs(fft(h)))
title('Frequency Response'), 
xlabel('frequency in pi units'), ylabel('|H(\omega/pi)|');
subplot(313), , plot(2*[0:length(x)-1]/length(x), Y), 
title('Filtered signal spectrum'), 
xlabel('frequency in pi units'), ylabel('|Y(\omega/pi)|');
