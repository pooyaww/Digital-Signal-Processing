clear;
close all;
clc

Fs = 16000;

%   Filter specifications
    % f_pass = 2*3500/Fs;
    % f_stop = 2*4000/Fs;
    % F=[0,f_pass,f_stop,1];
    % A=[1,1,10^(-50/2),0];

%   Load the filter
load h_filter.mat      
Nfft=1024;
figure,
subplot(211), stem(h)
H=fft(h,Nfft);
w=2*pi*[0:Nfft-1]./Nfft;
subplot(212), plot(w,20*log10(abs(H)))

%   Find polyphase components H_m(z)
M = 2;
e = decompose(h,M);
L = length(h);
K = size(e, 1); %   length of the subfilters H_m(z)


%   Generate input signal
T = 1/Fs;
t= [0:Fs-1]*T;
f1 = 1000;   %  First sinusoid: 1000 Hz
f2  = 4500;  %  Second sinusoid: 4500 Hz: out of the new Nyquist Frequency
x = 0.5*sin(2*pi*f1*t)+0.5*sin(2*pi*f2*t);
Nx = length(x);

y = zeros(1, M*(Nx+K-1)+M-1);
xf=zeros(M,Nx+K-1);

%   For each subfilter
for m  = 1:M
    
     %   Filtering
    size(conv(x, M*e(:,m)));
    xf(m,:) = conv(x, M*e(:,m));
        
    %   Shift and upsample
    xup(m,:) = zeros((M*length(xf))+M-1, 1); 
    xup(m,m:M:end-(M-1)) = xf(m,:);
    
    %   Sum
    y = y + xup(m,:);
    
end

X = fft(x,Nfft);
Y = fft(y,Nfft);
w=2*pi*[0:Nfft-1]/Nfft;
figure;
subplot(211);
plot(w, 20*log10(abs(X)));
xlabel('Frequencies[Hz]');
ylabel('Amplitude [dB]');
title('Spectrum of the original signal');
subplot(212);

plot(w, 20*log10(abs(Y)));
xlabel('Frequencies[Hz]');
ylabel('Amplitude [dB]');
title('Spectrum of the upsampled signal');


% Direct Form (Inefficient) 
xup = zeros(M*length(x), 1); 
xup(1:M:end ) = x ;
yint = filter(M*h, 1, xup);

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

Hint = fft(yint,1024);
subplot(313),
plot(w, 20*log10(abs(Hint)));
