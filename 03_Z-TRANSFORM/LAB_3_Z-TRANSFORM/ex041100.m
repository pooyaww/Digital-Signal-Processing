% Chapter 4: Example 4.11:
clc
clear all
close all

%  zplane function:
b = [1,0]; a = [1, -0.9];

p = roots(a)
z = roots(b)
figure, zplane(b,a), title('Pole-Zero Plot');

text(0.85,-0.1,'0.9');text(0.01,-0.1,'0');

% note : a, b are row vectors, and we have to specify b=[1 0] because
% zplane assumes that scalars are zero or poles
%        z, p are column vectors

% build polynomial coefficients
a2 = poly(p)
b2 = poly(z)

%[ r , p , k ] = residuez(b,a)


% frequency response
[H,w] = freqz(b,a,100);
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')



w=[-flipud(w(2:end)); w];  % flipping the rows
H=[conj(flipud(H(2:end))); H];
magH = abs(H); phaH = angle(H);
figure, subplot(2,1,1);plot(w/pi,magH);grid
xlabel('frequency in pi units'); ylabel('Magnitude');
title('Magnitude Response')
subplot(2,1,2);plot(w/pi,phaH/pi) ;grid
xlabel('frequency in pi units'); ylabel('Phase in pi units');
title('Phase Response')



% impulse response
[delta, n] = impseq(0,0,100);
h = filter(b,a,delta);
figure, subplot(2,1,1), plot(n,h), title('Impulse Response')


h_r = (0.9).^n.*stepseq(0,0,100);
subplot(2,1,2), plot(n,h_r), title('Computed Impulse Response')