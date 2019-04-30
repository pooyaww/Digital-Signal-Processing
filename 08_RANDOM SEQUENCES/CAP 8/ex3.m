%clc
%close all
clear all

load mtlb 
x = mtlb ;
% figure, plot(x)

Nfft = 2000;
s = mtlb(701:701 + Nfft);

p = 20;

[rs,k] = xcorr(s,p);
r = rs(k>= 0);

a = levinson(r);
e = filter(a, 1, x);
%[a , e] = levinson(r,p);
% e = e/Nfft;


w = 2*pi*[0 : Nfft-1]/Nfft;

%PSD ESTIMATION:
%LPC --> AR
H = freqz(1, a, w);

sigmae=var(e);
figure, plot(w, 10*log10(sigmae*abs(H).^2), 'r', 'LineWidth', 2);


%periodogram

phip = (1/Nfft)*abs(fft(s,Nfft)).^2;
phip(1 : Nfft/2);
hold on 
plot(w, 10*log10(phip));
axis([ 0 pi -60 20]);
hold off

