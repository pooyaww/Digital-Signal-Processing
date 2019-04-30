clc
%close all
clear all

poles = [0.99, 0.9*exp(j*0.1*pi), 0.9*exp(-j*0.1*pi),  ...
    0.95*exp(j*0.4*pi), 0.95*exp(-j*0.4*pi), ...
    0.99*exp(j*0.45*pi), 0.99*exp(-j*0.45*pi)];
N = 1000;
Nfft = 2^14;
a = poly(poles)
z = randn(N,1);
x = filter(1,a,z);
figure, plot(x)
X=abs(fft(x,Nfft));
X=(1/Nfft)*abs(X).^2;
figure, plot(2*pi*[0:Nfft-1]/Nfft,X)


P = 20;
% for spectrum estimation ( bartlett )
S = 10; 
M = N/S;
E = zeros(S,M);
w = 2*pi*[ 0 : M-1]/M;

for p = 2:2:P
    [r,k] = xcorr(x,p);
    rv = r(k>=0);
    a = levinson(rv)
    e = filter(a, 1, x);
    G(p) = var(x)./var(e);
    % estimate spectrum
    
    % bartlett
    s = 1 ;
    for m = 0 : M : N-M
        em = e(m+1 : m+M);
        E(s, :) = (1/M)*abs(fft(em,M)).^2;
        s = s + 1 ;
    end
    PHI = mean(E, 1);
    
    % parametric
    [re , k] = xcorr(e,p);
    rve = re(k>= 0);
    ae = levinson(rve);
    [He , we] = freqz (1, ae, Nfft);
    
    figure(3)    
    plot(w,PHI)
    hold on
    plot(we, abs(He).^2, 'r')
    xlim([0 pi])
    hold off
    pause
end

figure, stem(G)