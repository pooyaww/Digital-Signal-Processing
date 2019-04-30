close all;
clear;
clc
%randn('state',0);

N=2^10;
Nfft = 4*N;

R = 1000;
alpha = 0.05; %0.006;
rho_Z = 0.95;
rho_P = 0.99;
omega1 = 0.6*pi;
omega2 = 2*(0.3 + alpha)*pi;

%   Filter H_1
z1 = [rho_Z*exp(j*omega1); rho_Z*exp(-j*omega1)];
p1 = [rho_P*exp(j*omega1); rho_P*exp(-j*omega1)];

b1 = poly(z1);
a1 = poly(p1);


% Filter H_2
z2 = [rho_Z*exp(j*omega2); rho_Z*exp(-j*omega2)];
p2 = [rho_P*exp(j*omega2); rho_P*exp(-j*omega2)];

b2 = poly(z2);
a2 = poly(p2);

%   Poles
a = conv(a1, a2);
p = roots(a)

%   Zeros
b = conv(b1,a2) + conv(b2, a1);
z = roots(b)


%   Plot poles and zeros
figure(1);
subplot(311)
zplane(b1,a1);
subplot(312)
zplane(b2,a2);
subplot(313)
zplane(b,a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
e = randn(R, N);
s = zeros(R, N);
phip = zeros(R,Nfft);
w = 2*pi*[0:Nfft-1]./Nfft;

figure(2)
hold on
for r = 1:R
    s(r,:)=filter(b,a,e(r,:));
    phip(r,:)=(1/N)*abs(fft(s(r,:), Nfft)).^2;
%    plot(w(1:end/2), 10*log10(phip(r,1:end/2)))
end

phipmean=mean(phip,1);
plot(w(1:end/2), 10*log10(phipmean(1:end/2)), 'g', 'LineWidth', 2)

phipvar = var(phip);
plot(w(1:end/2), 10*log10(phipmean(1:end/2)+ sqrt(phipvar(1:end/2))), 'g--')
plot(w(1:end/2), 10*log10(phipmean(1:end/2) - sqrt(phipvar(1:end/2))), 'g--')

% plot true PSD
[H, w] = freqz(b, a, Nfft/2);
plot(w, 10*log10(abs(H).^2), 'r--', 'LineWidth', 2);
ylim([-10, 20]);
hold off

