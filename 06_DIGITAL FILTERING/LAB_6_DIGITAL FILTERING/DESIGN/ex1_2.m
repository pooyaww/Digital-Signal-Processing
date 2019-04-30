clc
close all
clear all

% ideal low-pass filter
Fc = 0.25 ; %normalized cut-off frequency
M = 33 ; % number of filter taps
N = 1024
kd = [0:N]/N;
Hd = zeros(length(kd),1);
Hd(kd<Fc|kd>1-Fc)=1;

k = [0:M-1]/M;
H = zeros(length(k),1);
H(k<Fc|k>1-Fc) = 1 ;

h = fftshift(ifft(H));

Hr = freqz(h ,1 ,2*pi*kd) ;

subplot ( 1 , 2 , 1 )
plot(2*kd, abs(Hd), 'b', 'LineWidth', 2 ) ;
axis([0 2 0 1.2] )
hold on
plot(2*k, abs(H), 'ko', 'LineWidth', 2 ) ;
plot(2*kd, abs(Hr ), 'm') ;
title('frequency sampling') ;
ylabel('Gain'); 
xlabel('frequency in pi units');

subplot ( 1 , 2 , 2 )
plot(2*kd,20*log10(abs(Hd)), 'b', 'LineWidth', 2 ) ;
axis([0 2 -70 5] )
hold on
plot(2*k, 20*log10(abs(H)), 'ko', 'LineWidth', 2 ) ;
plot(2*kd, 20*log10(abs(Hr)), 'm') ;
title('frequency sampling') ;
ylabel('Gain (dB)'); 
xlabel('frequency in pi units');



