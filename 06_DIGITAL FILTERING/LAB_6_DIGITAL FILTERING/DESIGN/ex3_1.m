clc
close all
clear all

fp = 0.2; %passband ends (1 --> omega = pi )
fst=0.3; %passband begins
ap = 1 ; %ripple in the passband (dB)
ast = 15 ; %attenuation in the stopband (dB)

d = fdesign.lowpass(fp,fst,ap,ast); 

hd = design(d , 'butter')
% hd = design(d, 'cheby1');
% hd = design(d, 'cheby2');
% hd = design(d, 'ellip');

fvtool(hd)

Nfft = 2^12;
SOS = hd.sosMatrix
scale = hd.ScaleValues

Htot = ones(1,Nfft);
ztot = zeros(size(SOS,1)*2,1);
ptot = zeros(size(SOS,1)*2,1);

figure , hold all;
for i = 1:size(SOS,1)
    bcurr = scale(i).*SOS(i,1:3);
    acurr = SOS(i, 4:6);
    zcurr = roots(bcurr)
    pcurr = roots(acurr)
    
    ztot((i*2)-1:i*2) = zcurr 
    ptot((i*2)-1:i*2) = pcurr 
    
    [H, W] = freqz(bcurr, acurr, Nfft);
    Htot = Htot.*H';
    plot(W, 10*log10(abs(H).^2));
    pause
end ;
plot(W, 10*log10(abs(Htot).^2), 'linewidth', 5)


figure, plot(W, 10*log10(abs(Htot).^2), 'linewidth', 2)
hold on
atot=poly(ptot)
btot=poly(ztot)
[Hric, W]=freqz(btot, atot, Nfft);
plot(W, 10*log10(((abs(Hric).^2)./((max(abs(Hric))).^2))),'r', 'linewidth', 2)