clear all
clc
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filter specifications  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % f_pass = 2*3500/16000;
    % f_stop = 2*4000/16000;
    % F = [0,f_pass,f_stop,1];
    % A = [1,1,10^(-50/2),0];

%   Load the filter

load h_filter.mat
figure
freqz(h, 1, 1024);
    
[x, fs, nbits] = wavread('Toms_diner_16.wav');     %Speech audio file

%   Decimation
M = 2;   %  Downsampling factor


% N.B.: You can perform filtering in several modes:

%   Time-domain filtering
y_td = filter(h, 1, x); %   First low pass filtering
y_td = y_td(1:2:end);   %   Second decimation
% xfilt = conv(h,x);


%   Frequency-domain filtering
N_x = length(x);
N_h = length(h);
%   It establishes the closer power of two for FFT transformation
N = 2^ceil(log2(N_x + N_h - 1));

X = fft(x, N);
H = fft(h, N);
y_fd = ifft(X.*H, N); % First low pass filtering in the frequency domain
y_fd = y_fd(1:2:end); % Second decimation

%   Frequency-domain filtering by OLA
M=1000;                      %  Window size 
x=x(1:floor(length(x)/M)*M); %  Reduce the data size to a multiple of the window size
K=length(x)/M;               %  Number of frames (no overlap)        

Hm = fft(h, N);
%y_ola = zeros(K*M + (N - M), 1);
y_ola = zeros(K*M + (N - 1), 1);

for k=0:K-1
    
    xm = x(k*M+1:(k*M)+M);  %windowing (rect, no overlap)
    Xm = fft(xm, N);
    Xf=Xm.*Hm;
    ym = ifft(Xf, N);
    
    y_ola(k*M + 1:k*M + N) = y_ola(k*M + 1:k*M + N) + ym; %OLA
end;

y_ola = y_ola(1:2:end);

%   Compare input and output spectra
Nfft=1024
X_a=fft(x,Nfft);
Y_a=fft(y_td,Nfft);
w= 2*pi*[0:Nfft-1]/Nfft;

figure
subplot(211);
plot(w,20*log10(abs(X_a)));
xlabel('Frequency [rad/sample]');
ylabel('Amplitude[dB]');
title('Spectrum of the original signal');
xlim([0, pi]);
ylim([-70 50]);

subplot(212);
plot(w,20*log10(abs(Y_a)));
xlabel('Frequency [rad/sample]');
ylabel('Amplitude[dB]');
title('Spectrum of the decimated signal');
xlim([0, pi]);
ylim([-70 50]);

