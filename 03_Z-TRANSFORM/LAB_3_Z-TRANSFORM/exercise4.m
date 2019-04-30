clear
clc
close all

% Compute poles and roots
rho = 0.9;
theta = pi/8;
a = [ 1 2*rho*cos(theta) rho^2 ] 
b = [ 1 2 1 ] 
p = roots(a)
z = roots(b)
figure, zplane(b,a)
% note : a, b are row vectors, 
%        z, p are column vectors

% build polynomial coefficients
a2 = poly(p)
b2 = poly(z)
figure, zplane(z,p)

%[ r , p , k ] = residuez(b,a)


% impulse response
[delta, n] = impseq(0,0,100);
h = filter(b,a,delta);
figure, plot(n,h), title('Impulse Response')



%n = 0:100; 
%k = -100:100; w = (pi/100)*k;        % frequency between -pi and +pi
%H = h * (exp(-j*pi/100)).^(n'*k);    % DTFT of x
%figure; plot(w/pi,abs(H)); grid; 
%xlabel('frequency in pi units'); ylabel('Abs(H)');
%title('Frequency response')
