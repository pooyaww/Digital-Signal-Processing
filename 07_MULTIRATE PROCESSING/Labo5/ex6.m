clear;
close all;

Nfft=1024;
w=2*pi*[0:Nfft-1]./Nfft;

%   Generate input signal
Fs = 16000;
T = 1/Fs;
t= [0:Fs-1]*T;
f1 = 1000;   %  First sinusoid: 1000 Hz
f2  = 4500;  %  Second sinusoid: 4500 Hz: out of the new Nyquist Frequency
x = 0.5*sin(2*pi*f1*t)+0.5*sin(2*pi*f2*t);
Nx = length(x);

%   Load the filter
load h_filter.mat 
%   Filter specifications
    % f_pass = 2*3500/Fs;
    % f_stop = 2*4000/Fs;
    % F=[0,f_pass,f_stop,1];
    % A=[1,1,10^(-50/2),0];

figure,
subplot(211), stem(h)
H=fft(h,Nfft);
subplot(212), plot(w,20*log10(abs(H)))

%   Find polyphase components H_m(z)
M = 2;
e = decompose(h,M);
L = length(h);
K = size(e, 1); %   length of the subfilters H_m(z)

y = zeros(1, floor((Nx + L - 1)/M)+1);

%   For each subfilter
for m  = 1:M
    
    %   Shift and downsample
    if m==1
    x_m = [x(m:M:end) 0];
    else
    x_m = [0 x(m:M:end)];
    end
    %   Filtering
    xf_m = conv(x_m, e(:,m));
    
    %   Sum
    y = y + xf_m;
    
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
title('Spectrum of the downsampled signal');


xfilt = conv(h,x);
xdec = xfilt(1:M:end);

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

Hdec = fft(xdec,1024);
subplot(313),
plot(w, 20*log10(abs(Hdec)));
