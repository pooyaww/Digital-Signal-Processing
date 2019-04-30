% Chapter 05: Example 05.07: Zero-padding Example

%
clc
clear all


subplot(1,1,1);

x = [1,1,1,1];

N = length(x);

%

% a) DTFT

w = [0:1:500]*2*pi/500;

[H] = freqz(x,1,w);

magH = abs(H); phaH = angle(H); phaH(126)=-47.5841*pi/180;

%

% b) 8-point DFT

x = [x, zeros(1,4)];

N = length(x); 

k = [0:N-1];

X = dft(x);

magX = abs(X), phaX = angle(X)*180/pi

subplot(2,1,1);plot(w*N/(2*pi),magH,'--'); 

axis([-0.1,8.1,-1,5]); hold on

stem(k,magX);

xlabel('k');

ylabel('|X(k)|'); title('Magnitude of the DFT: N=8')

hold off

subplot(2,1,2);plot(w*N/(2*pi),phaH*180/pi,'--');

axis([-0.1,8.1,-200,200]); hold on

stem(k,phaX);

xlabel('k');

ylabel('Degrees'); title('Angle of the DFT: N=8');pause

%print -deps2 me0507a.eps

% c) 16-point DFT

subplot(1,1,1)

x = [x, zeros(1,8)];

N = length(x);

k = [0:N-1];

X = dft(x);

magX = abs(X), phaX = angle(X)*180/pi

subplot(2,1,1);plot(w*N/(2*pi),magH,'--'); 

axis([-0.1,16.1,-1,5]); hold on

stem(k,magX);

xlabel('k');

ylabel('|X(k)|'); title('Magnitude of the DFT: N=16')

hold off

subplot(2,1,2);plot(w*N/(2*pi),phaH*180/pi,'--');

axis([-0.1,16.1,-200,200]); hold on

stem(k,phaX);

xlabel('k');

ylabel('Degrees'); title('Angle of the DFT: N=16')

%print -deps2 me0507b.eps

