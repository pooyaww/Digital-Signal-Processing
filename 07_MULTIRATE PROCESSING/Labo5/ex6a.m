clc
clear all
close all


% Create input signal and filter
x=1:21;
h=[1 2 3 4 5 6 7 8 9 10 0 0 ] ; % Pad zeros to make length equal to integer multiple of M

% Direct Form (Inefficient) 
y=filter(h,1,x); % Compute filter output
ydec = y(1:4:end) % Throw away unneeded output samples

%Polyphase Form (Efficient)
% Select polyphase filters
p0=h(1:4:end )
p1=h(2:4:end )
p2=h(3:4:end )
p3=h(4:4:end )
% Select polyphase signals
% Put a zero in front to provide the x[-3], x[-2], and x[-1] terms
x0=x(1:4:end)
x1=[0 x(4:4:end)]
x2=[0 x(3:4:end)]
x3=[0 x(2:4:end)]
% filter each polyphase component and add together
y_poly_dec = filter(p0,1,x0)+filter(p1,1,x1)+filter(p2,1,x2)+filter(p3,1,x3)


Nfft=1024;
figure,
subplot(211), stem(h)
H=fft(h,Nfft);
w=2*pi*[0:Nfft-1]./Nfft;
subplot(212), plot(w,20*log10(abs(H)))

X = fft(x,Nfft);
Y = fft(y_poly_dec,Nfft);
w=2*pi*[0:Nfft-1]/Nfft;
Hdec = fft(ydec,1024);

figure, subplot(311),
plot(w, 20*log10(abs(X)));
xlabel('Frequencies[Hz]');
ylabel('Amplitude [dB]');
title('Spectrum of the original signal');

subplot(312);
plot(w, 20*log10(abs(Y)));
xlabel('Frequencies[Hz]');
ylabel('Amplitude [dB]');
title('Spectrum of the downsampled signal');


subplot(313),
plot(w, 20*log10(abs(Hdec)));
