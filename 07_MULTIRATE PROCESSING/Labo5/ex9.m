clc
close all
clear all

% generate filters based on QMF conditions
h0 = [sqrt(2)/2, sqrt(2)/2] ;
h1 = h0.*[1 -1]; 
g0 = h0;
g1 = -h1 ;
% check QMF conditions in the frequency domain
Nfft = 2^14;
w = 2*pi*[0: Nfft-1]/ Nfft;
H0 = fft(h0, Nfft);
H1 = fft(h1, Nfft);
G0 = fft(g0, Nfft);
G1 = fft(g1, Nfft);
T = abs(H0).^2 + abs(H1).^2 ;


figure,
subplot (211)
plot(w, 20*log10(abs(H0))), title('analysis')
hold on
plot(w, 20*log10(abs(H1)), 'r')
hold off
xlabel('\omega'); 
ylabel('|H_i(\omega)|')
legend('|H_0(\omega)|', '|H_1(\omega)|') ;


subplot (212)
plot(w, 20*log10(abs(G0))), title('synthesis')
hold on
plot(w, 20*log10(abs(G1)), 'r')
hold off
xlabel('\omega'); 
ylabel('|G_i(\omega)|')
legend('|G_0(\omega)|', '|G_1(\omega)|') ;


figure
plot(w, abs(H0).^2)
hold on
plot(w, abs(H1).^2, 'r')
plot(w, T, 'k')
hold off
axis( [ 0 pi 0 2.2 ] ), 
xlabel('\omega'); 
ylabel('|H_i(\omega)|^2')
legend('|H_0(\omega)|^2', '|H_1(\omega)|^2', 'T(\omega)') ;
hold off

[x Fs Nbits] = wavread('flute2.wav');
x = x(:,1);
%length(x)
figure, plot(w,20*log10(abs(fft(x,Nfft))))
title('Input signal')

% analysis
% low pass subband
y0 = conv(x,h0); % filtering
y0 = y0(1:2:end); % downsampling
% high pass subband
y1 = conv(x,h1); % filtering
y1 = y1(1:2:end); % downsampling

X0 = fft(y0, Nfft);
X1 = fft(y1, Nfft);
figure,
subplot(211), plot(y0)
hold on
plot(y1,'r')
legend('xlow', 'xhigh') ;
subplot(212), plot(w,abs(X0).^2)
hold on
plot(w, abs(X1).^2, 'r')
%axis( [ 0 pi 0 2.2 ] ), 
xlabel('\omega'); 
ylabel('|X_i(\omega)|^2')
legend('|X_0(\omega)|^2', '|X_1(\omega)|^2') ;
hold off

%synthesis
% low pass subband
y0up = zeros(2*length(y0), 1); 
y0up(1:2:end ) = y0 ;
y0up = conv(y0up,g0);

% high pass subband
y1up = zeros(2*length(y1), 1); 
y1up(1:2:end ) = y1 ;
y1up = conv(y1up,g1);

Y0 = fft(y0up, Nfft);
Y1 = fft(y1up, Nfft);
figure
subplot(211), plot(y0up)
hold on
plot(y1up,'r')
legend('ylow', 'yhigh') ;
subplot(212), plot(w,abs(Y0).^2)
hold on
plot(w, abs(Y1).^2, 'r')
%axis( [ 0 pi 0 2.2 ] ), 
xlabel('\omega'); 
ylabel('|Y_i(\omega)|^2')
legend('|Y_0(\omega)|^2', '|Y_1(\omega)|^2') ;
hold off

%length(y)
y = y0up + y1up ;
%y = y(2: end-2);
y = y(2: end-1);
e = x-y ; 
figure, plot(e)
display(['max error:' num2str(max(abs(e)))]);