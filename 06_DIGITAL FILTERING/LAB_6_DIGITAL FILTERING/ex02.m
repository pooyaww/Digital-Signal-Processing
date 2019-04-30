clear
clc
close all

% rotts
rho = 0.9;
theta = pi/8;
a = [ 1 2*rho*cos(theta) rho^2 ] 
b = [ 1 2 1 ] 
p = roots(a)
z = roots(b)
figure, zplane(b,a)
% note : a, b are row vectors, 
%        z, p are column vectors

% polinomial coefficients from roots
a2 = poly(p)
b2 = poly(z)
figure, zplane(z,p)

%[ r , p , k ] = residuez(b,a)


% impulse response
N=1000;
delta = [ 1 ; zeros(N-1,1)]';
h = filter(b,a,delta);
figure, plot([0:N-1],h), title('impulse response')

