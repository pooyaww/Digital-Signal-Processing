clc
close all
clear all


% pass bass
b = [1 1]
a = [1 -0.9]

figure, zplane(b,a), title('Zero Plot');

[H,w] = freqz(b,a);
w =[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H(2:end))); H];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')