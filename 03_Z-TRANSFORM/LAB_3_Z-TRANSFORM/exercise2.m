% Chapter 4: Example 4.11:
clc
clear all
close all

%  zplane function:

b = [1 -0.8]

figure, zplane(b,1), title('Zero Plot');

[H1,w] = freqz(b,1);
magH1 = abs(H1); phaH1 = angle(H1);
figure, subplot(2,1,1);plot(w/pi,magH1);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH1/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')

w=[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H1(2:end))); H1];
magH = abs(H); phaH = angle(H);
figure, subplot(1,2,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(1,2,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% example 2

close all

%  zplane function:

b = [1 -0.8*exp(j*(pi/10))]


figure, zplane(b,1), title('Zero Plot');

[H,w] = freqz(b,1);
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')

figure, subplot(2,1,1);plot(w/pi,magH,w/pi,magH1);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
legend('ex2 curve','ex1 curve')
subplot(2,1,2);plot(w/pi,phaH/pi,w/pi,phaH1/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
legend('ex2 curve','ex1 curve')
pause


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% example 3

close all

%  zplane function:

b = [1 -1.25]


figure, zplane(b,1), title('Zero Plot');

[H,w] = freqz(b,1);
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')

figure, subplot(2,1,1);plot(w/pi,magH,w/pi,magH1);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
legend('ex3 curve','ex1 curve')
subplot(2,1,2);plot(w/pi,phaH/pi,w/pi,phaH1/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
legend('ex3 curve','ex1 curve')

w=[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H(2:end))); H];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
pause


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% example 4

close all

%  zplane function:

b = [1 -1]


figure, zplane(b,1), title('Zero Plot');

[H,w] = freqz(b,1);
magH = abs(H); phaH = angle(H);
w=[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H(2:end))); H];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
pause

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% example 5

%  zplane function:

b = [1 1]


figure, zplane(b,1), title('Zero Plot');

[H,w] = freqz(b,1);
magH = abs(H); phaH = angle(H);
w=[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H(2:end))); H];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')
pause

