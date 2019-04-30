clc
clear all
close all



% y(n) = ay(n-1) + by(n-2) + x(n) + cx(n-1)
% this is a IIR filter , order 2 .
% transfer functionis :
% Y(z)/X(z) = (1 + czˆ-1) / (1 - azˆ-1 - bzˆ-2)
% this is equal to :
% 1 + czˆ-1 / (1 - ( p1 + p2 ) zˆ-1 + p1 p2 zˆ-2)
% where p1 and p2 are the poles of the transfer function:
%  (z^2 - a z - b )/z^2 = (p1 - z) (p2 - z)/z^2
%  (z^2 - a z - b )/z^2 = (p1 z^-1 - 1) (p2 z^-1 - 1)
%  (z^2 - a z - b )/z^2 = 1 - ( p1 + p2 ) zˆ-1 + p1 p2 zˆ-2)

% Hence we choose |p1| and |p2| < 1 if we want the filter to be stable.
% For instance , p1 = 0.9 and p2 = -0.7 ---> a = 0.2 , b = 0.63.
% Then if we want also a minimun phase filter we choose |c| (the zero) 
% inside the unit circle, for example c = 0.8
b = [1 0.8];
a = [1 -0.2 -0.63];
figure, zplane(b,a)
%without using freqz
%the frequency response is the DTFT of the (truncated) impulse response:
N = 1024;
delta = impseq(0,0,N);
h = filter(b, a, delta);
H = fft(h,N);
w = 2*pi*[0 :N-1]/N;
figure,
subplot(2,1,1);
plot (w/pi,20*log10(abs(H))); title('using filter')
axis( [ 0 1 -20 30 ] ) ;
xlabel( 'frequency in pi units');
ylabel( '|H(w)| [ dB ]')
subplot(2,1,2);
plot(w/pi, angle(H)/pi);
axis([ 0 1 -1 1 ]);
xlabel('frequency in pi units');
ylabel('<H(w)in pi units')

% using freqz
figure,
subplot(2,1,1);
[H, w] = freqz(b,a,N);
plot(w/pi,20*log10(abs(H))); title('using freqz')
axis( [ 0 1 -20 30 ] ) ;
xlabel( 'frequency in pi units');
ylabel( '|H(w)| [ dB ]')
subplot(2,1,2);
plot(w/pi, angle(H)/pi);
axis([ 0 1 -1 1 ]);
xlabel('frequency in pi units');
ylabel('<H(w) in pi units')