% COMPUTE THE DFT IN ACCORDANCE WITH THE DEFINITION,
% COMPARE THE RESUT WITH FFT
% COMPUTE THE IFFT

clc
clear all
close all

% signal input
x = triang(20)';

% Compute the DFT in accordance with definition
X = dft(x);

figure(1),
subplot(2,2,1), 
plot(x), title('Original signal x');
subplot(2,2,2), 
plot(real(X)), title('Real part of the DFT');
subplot(2,2,3), 
plot(imag(X)), 
title('Imaginary part of the DFT');
subplot(2,2,4), 
plot(20*log10(abs(X))-20*log10(max(abs(X)))), title('Module of the DFT in dB');

%  Compare with FFT
X1 = fft(x)
figure(2),
subplot(2,2,1), 
plot(abs(X)), title('Module of the DFT');
subplot(2,2,2), 
plot(abs(X1)), title('Module of the FFT');
subplot(2,2,3), 
plot(abs(X) - abs(X1)); title('Module of the difference');


% Compute the IFFT and compare it with the original signal
x1 = ifft(X1);
figure(3),
subplot(2,2,1), 
plot(x), title('Original signal x');
subplot(2,2,2), 
plot(x1), title('Antitrasformated signal');
subplot(2,2,3), 
plot(x-x1); title('Difference');

