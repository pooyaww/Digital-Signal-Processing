%  Exercise 1
clc
clear all
close all
%

x = [1,1,1,1];

% b) 4-point DFT

N = length(x); 

[X, w] = dft_for(x,N);

magX = abs(X), phaX = angle(X)*180/pi

subplot(2,1,1);stem(w*N/(2*pi),magX); 

axis([-0.1,4.1,-1,5]);

xlabel('k');   ylabel('|X(k)|'); 

title('Magnitude of the DFT: N=4')


subplot(2,1,2); stem(w*N/(2*pi),phaX);

axis([-0.1,4.1,-200,200]); 

xlabel('k');     ylabel('Degrees'); title('Angle of the DFT: N=4')


[Xk] = dft(x)

k = [0:1:N-1]

figure, subplot(2,1,1);stem(k,abs(Xk)); 

axis([-0.1,4.1,-1,5]);

xlabel('k');   ylabel('|X(k)|'); 

title('Magnitude of the DFT: N=4')


subplot(2,1,2); stem(k,angle(Xk)*180/pi);

axis([-0.1,4.1,-200,200]); 

xlabel('k');     ylabel('Degrees'); title('Angle of the DFT: N=4')



