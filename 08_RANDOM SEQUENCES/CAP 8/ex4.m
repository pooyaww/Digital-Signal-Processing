%
clear
close all
clc
figure,
[s, Fs, nBits] = wavread('voiced_a.wav');

% prediction order
p = 12; 

% frame length (ms)
fl = 25;
fl=fl/1000; %(sec)

% frame length(samples)
M = floor(fl*Fs);

% number of frames
N = 10;

r = zeros(M-1,1);

Nfft = 2^10;
w = 2*pi*[0:Nfft-1]./Nfft;

for n=0:N-1
    sn = s(n*M + 1: n*M + M);
    
    [rs, lags] = xcorr(sn, p);
    
    R = toeplitz(rs(lags>=0 & lags < p));
    rp = rs(lags>=1);
    
    theta = -inv(R)*rp;
    var_s = rs(lags == 0) + theta'*rp;
    
    [H, w] = freqz(1, [1; theta], w);
    f = w.*Fs/(2*pi);
    P = var_s.*H.^2;

    Sn = fft(sn, Nfft);
    
    subplot(3,1,1), 
    plot(f(1:end/2), 10*log10(abs(Sn(1:end/2).^2)))
    hold on
    plot(f(1:end/2), 10*log10(P(1:end/2)),'r')
    hold off

    % compute prediction error
    e = filter([1, theta'], 1, sn);
    subplot(3,1,2), plot(e)
    
    E = fft(e, length(f));
    
    subplot(3,1,3), plot(f(1:end/2), abs(E(1:end/2)))
    Dp = var(e)
    var(sn)
    Gp = var(sn) / Dp;
   
    display(['Coding Gain (p = ' int2str(p) '): ' num2str(Gp)])
    
    %pause
              
end
