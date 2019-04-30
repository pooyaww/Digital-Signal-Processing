clc
clear all
close all


N = 2^14;
Nrealizations = 1000;

% Filter transfer function H(z) = 1/A(z)
rho1 = 0.99 ;
theta1 = 0.2*pi ;
rho2 = 0.95 ;
theta2 = 0.3*pi ;
a = conv([1 -2*cos(theta1)*rho1 rho1^2 ], [ 1 -2*cos(theta2)*rho2 rho2^2]);
Nfft = N/2;
[H, w] = freqz(1, a, Nfft);
wp = 2*pi*[0:N/2-1]/N;

phip = zeros(Nrealizations, N) ;

for i = 1 : Nrealizations
    e = randn(N,1);
    y = filter(1,a,e);
    % periodogram
    phip(i,:) = (1/N)*abs(fft(y,N)).^2;
end
phipmean = mean(phip);
phipvar = var(phip);

% plot 

plot(wp, 10*log10(phipmean(1:N/2)), 'b', 'LineWidth', 2)
hold on
plot(wp, 10*log10(phipmean(1:N/2)+ sqrt(phipvar(1:N/2))), 'g--')
plot(wp, 10*log10(phipmean(1:N/2) - sqrt(phipvar(1:N/2))), 'g--')
plot(w, 10*log10(abs(H).^2), 'r', 'LineWidth', 2 ) ;
%plot(wp, 10*log10(phip(1,1:N/2)), 'k')
hold off

legend('E[\phi_{P} (\omega)]', 'E[\phi_{P} (\omega)]+\sigma', 'E[\phi_{P} (\omega)] - \sigma', ...
'\phi(\omega)');