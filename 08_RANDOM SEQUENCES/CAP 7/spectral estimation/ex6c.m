
close all;
clear;
clc
%randn('state',0);

N=2^12;
Nfft = 4*N;

p_order = 30;
R = 50;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
figure, zplane(b,a)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[H, w] = freqz(b, a, Nfft/2);
w = 2*pi*[0:Nfft-1]./Nfft;
figure, plot(w(1:end/2), 10*log10(abs(H).^2), 'r--', 'LineWidth', 2);
hold on

% AR model

e = randn(R, N);  %white noise
s = zeros(R, N);   % signal (R realizations)
Shat = zeros(R,Nfft);

for r = 1:R
    s(r,:)=filter(b,a,e(r,:));    
    [rs, lags] = xcorr(s(r,:), p_order);
    rs = rs./N;  %'biased'
    
    R = toeplitz(rs(lags>=0 & lags < p_order));
    rp = rs(lags>=1)';
    
    theta = -inv(R)*rp;
    var_s = rs(lags == 0) + theta'*rp;   % theta' is a row vector
                                         % rp is a column vector
    [P, w] = freqz(1, [1 theta'], w);
    
    Shat(r,:)=var_s*abs(P).^2;
    plot(w(1:end/2), 10*log10(Shat(r,1:end/2)))
end

ExpShat=mean(Shat,1);
plot(w(1:end/2), 10*log10(ExpShat(1:end/2)), 'g', 'LineWidth', 2)
ylim([0, 20]);
hold off

figure,
plot(w(1:end/2), 10*log10(abs(H).^2), 'r--', 'LineWidth', 2);
hold on
plot(w(1:end/2), 10*log10(ExpShat(1:end/2)), 'g', 'LineWidth', 2)
ylim([0, 20]);
hold off
legend('real(\omega)', '\phi_{AR}(\omega)');