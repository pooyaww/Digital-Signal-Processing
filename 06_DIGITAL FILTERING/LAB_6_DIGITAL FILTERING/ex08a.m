clc
clear all
close all

% All pass filter with two complex pole in rho*exp(j*omega0) and
% rho*exp(-j*omega0)

rho = 0.99; 
omega0 = 0.3*pi;

p1 = rho*exp(j*omega0);
p2 = rho*exp(-j*omega0);

a = poly([ p1; p2]);  % denominator

figure, zplane(1, a)

b = conj(fliplr(a));
figure, zplane(b,a)

%frequency response
[H, w] = freqz(b,a,1024);

figure
subplot(2,1,1) 
plot(w/pi,abs(H)); 
title('Module of the frequency response'), 
xlabel('frequency in pi units'); ylabel('|H(\omega)|');

subplot( 2 , 1 , 2 ) 
plot(w/pi, phase(H)/pi)
title('Phase of the frequency response'), 
xlabel('frequency in pi units'); ylabel('\angle(H(\omega))');


% if is an allpass filter, the energy of the input and of the output must be the same
x = randn(10000, 1);
y = filter(b, a, x);
sum(abs(x).^2)
sum(abs(y).^2)