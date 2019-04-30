clc
close all
clear all

% one zero

%warning off MATLAB:divideByZero
%warning off MATLAB:log:logOfZero

b = [1 -0.8]

figure, zplane(b,1), title('Zero Plot');

[H1,w] = freqz(b,1);
w =[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H1(2:end))); H1];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
%pause


% one pole

b = [1 -0.8]

figure, zplane(1,b), title('Zero Plot');

[H1,w] = freqz(1,b);
w =[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H1(2:end))); H1];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
%pause



b = [1 0.8]

[H1,w] = freqz(b,1);
w =[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H1(2:end))); H1];
magHz = abs(H); phaHz = angle(H);
figure, subplot(2,1,1);plot(w/pi,magHz);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('One zero')
subplot(2,1,2);plot(w/pi,magH) ;grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('One pole')