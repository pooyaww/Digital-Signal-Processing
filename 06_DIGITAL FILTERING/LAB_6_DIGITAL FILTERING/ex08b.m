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

z1=1/conj(p1);
z2=1/conj(p2);

b = poly([z1;z2]);
figure, zplane(b,a)

%frequency response
[H, w] = freqz(b,a,1024);

figure
subplot(2,1,1) 
plot(w/pi,abs(H)); 
title('Module of the frequency response'), 
xlabel('frequency in pi units'); ylabel('|H(\omega)|');

subplot( 2 , 1 , 2 ) 
plot(w/pi, phase(H)/pi )
title('Phase of the frequency response'), 
xlabel('frequency in pi units'); ylabel('\angle(H(\omega))');


% if is a allpass filter input and output must be the same
x = randn(10000, 1);
y = filter(b, a, x);
sum(x.^2)
sum(y.^2)