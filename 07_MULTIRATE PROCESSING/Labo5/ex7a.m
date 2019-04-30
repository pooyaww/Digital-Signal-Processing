clc
clear all
close all


% Create input signal and filter
x=1:21;
h=[1 2 3 4 5 6 7 8 9 10 0 0 ] ; % Pad zeros to make length equal to integer multiple of M
M=4;
% Direct Form (Inefficient) 
xup = zeros(M*length(x), 1); 
xup(1:M:end ) = x ;
yint = filter(M*h, 1, xup);

%Polyphase Form (Efficient)
% Select polyphase filters
p0=h(1:4:end )
p1=h(2:4:end )
p2=h(3:4:end )
p3=h(4:4:end )
% Select polyphase signals

x0=[filter(M*p0,1,x)];
x1=[filter(M*p1,1,x)];
x2=[filter(M*p2,1,x)];
x3=[filter(M*p3,1,x)];


x0up = zeros(M*length(x0), 1); 
x0up(1:M:end ) = x0 ;
x1up = zeros(M*length(x1), 1); 
x1up(1:M:end ) = x1 ;
x2up = zeros(M*length(x2), 1); 
x2up(1:M:end ) = x2 ;
x3up = zeros(M*length(x3), 1); 
x3up(1:M:end ) = x3 ;

% Put a zero in front to provide the x[-3], x[-2], and x[-1] terms
x_0=[x0up' 0 0 0];
x_1=[0 x1up' 0 0];
x_2=[0 0 x2up' 0];
x_3=[0 0 0 x3up'];
% filter each polyphase component and add together
y_poly_int = x_0+x_1+x_2+x_3;


Nfft=1024;
figure,
subplot(211), stem(h)
H=fft(h,Nfft);
w=2*pi*[0:Nfft-1]./Nfft;
subplot(212), plot(w,20*log10(abs(H)))

X = fft(x,Nfft);
Y = fft(y_poly_int,Nfft);
w=2*pi*[0:Nfft-1]/Nfft;
Hint = fft(yint,1024);

figure, subplot(311),
plot(w, 20*log10(abs(X)));
xlabel('Frequencies[Hz]');
ylabel('Amplitude [dB]');
title('Spectrum of the original signal');

subplot(312);
plot(w, 20*log10(abs(Y)));
xlabel('Frequencies[Hz]');
ylabel('Amplitude [dB]');
title('Spectrum of the upsampled signal');


subplot(313),
plot(w, 20*log10(abs(Hint)));