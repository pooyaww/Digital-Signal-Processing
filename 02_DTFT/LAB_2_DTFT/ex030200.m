clear all 
close all
clc

x= 1:5;  n=-1:3;

[X,w] = DTFT(x,n);

magX = abs(X);
angX = angle(X);
realX = real(X); 
imagX = imag(X);

subplot(2,2,1); plot(w/pi,magX); %grid

xlabel('frequency in pi units'); title('Magnitude Part'); ylabel('Magnitude')

subplot(2,2,3); plot(w/pi,angX); %grid

xlabel('frequency in pi units'); title('Angle Part'); ylabel('Radians')

subplot(2,2,2); plot(w/pi,realX); %grid

xlabel('frequency in pi units'); title('Real Part'); ylabel('Real')

subplot(2,2,4); plot(w/pi,imagX); %grid

xlabel('frequency in pi units'); title('Imaginary Part'); ylabel('Imaginary')






% comparing with the DTFT obtained in example 2
Xc = exp(j*w)+2+3*exp(-j*w)+4*exp(-j*2*w)+5*exp(-j*3*w);

magXc = abs(Xc); angXc = angle(Xc);

realXc = real(Xc); imagXc = imag(Xc);

figure, subplot(2,2,1); plot(w/pi,magXc); grid

xlabel('frequency in pi units'); title('Magnitude Part'); ylabel('Magnitude')

subplot(2,2,3); plot(w/pi,angXc); grid

xlabel('frequency in pi units'); title('Angle Part'); ylabel('Radians')

subplot(2,2,2); plot(w/pi,realXc); grid

xlabel('frequency in pi units'); title('Real Part'); ylabel('Real')

subplot(2,2,4); plot(w/pi,imagXc); grid

xlabel('frequency in pi units'); title('Imaginary Part'); ylabel('Imaginary')

%differences
sum(X-Xc)

