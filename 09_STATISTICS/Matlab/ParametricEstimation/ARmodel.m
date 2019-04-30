clc
close all
clear all

Nfft = 1024; 
N = 1000; 
sigmae = 10; 
n = 3 ;
a = poly([0.99 0.99*exp(j*pi/4) 0.99*exp(-j*pi/4)])
b = 1 ;
[H, w] = freqz(b, a, Nfft);
%generate signal according to parametric model
z = sigmae*randn(N,1);

y = filter(b, a, z);

%estimate AR coefficients
r = xcorr(y , 'biased');
Rx = toeplitz(r(N:N+n-1), r (N:-1:N-n+1));
rz = r(N+1:N+n ) ;
theta = -Rx^(-1)*rz;
varz = r(N) +sum(theta.*r(N-1:-1:N-n))


%visualize estimated and true power specrum
plot(w, 10*log10(sigmae^2*abs(H).^2))

hold on
[He, w] = freqz(1 ,[ 1; theta ], Nfft);
plot(w, 10*log10(varz*abs(He).^2), 'r')
legend ('true', 'estimated');
hold off