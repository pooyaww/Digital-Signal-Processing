clear
clc
close all

%[x, fs, nbits] = wavread('Toms_diner_16.wav');
w1=pi/16;
w2=pi/8;
w3=pi/2;
n=[0:200];
x = cos(w1*n)+0.5*cos(w2*n)+2*cos(w3*n);

%fs=16000
%f_out = 10000;
%   f_out/fs = 10/16 = 5/8, therefore:
upsample_factor = 5;
downsample_factor = 8;

h1 = fir1(30, 1/upsample_factor);
h2 = fir1(30, 1/downsample_factor); %   The new cut-off frequency is now referred to the new 
                                    %   sampling frequency (fs*upsample_factor)
Nfft=1024;
w=2*pi*[0:Nfft-1]./Nfft;
H1=fft(h1,Nfft);
H2=fft(h2,Nfft);


%   Upsampling (interpolation)

y_up = zeros(length(x)*upsample_factor, 1);
y_up(1:upsample_factor:end) = x;

y_up = filter(upsample_factor*h1, 1, y_up);

%   Dowsample (decimation)

y_down = filter(h2, 1, y_up);
y_down = y_down(1:downsample_factor:end);

X=fft(x,Nfft);
Y=fft(y_down,Nfft);

figure, subplot(211), plot(w,20*log10(abs(H1)))
subplot(212), plot(w,20*log10(abs(H2)))

figure, subplot(211), plot(w,20*log10(abs(X)))
subplot(212), plot(w,20*log10(abs(Y)))