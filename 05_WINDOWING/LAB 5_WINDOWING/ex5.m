clc
clear all
close all

%% h1
b = [ 1 ];
a = [ 1 -0.99];
freqz(b,a,2^10);
% truncate imp response
K = 1000;
impulse = [ 1, zeros(1, K-1)];
h2 = filter(b,a,impulse);
%
% load flute
%[x, Fs ] = wavread('flute2.wav');
[x, Fs ] = wavread('gb.wav');
x = x';
%x = randn(1, 1000); %[1 2 3 4 ] ;
N = length(x) + length (h2) - 1;
out = zeros(1, N);
M = floor(0.050*Fs);
R = floor(M/2);
w = bartlett(M)';
Nfft= M + K - 1;

for k = 0:R:N-M-K
% current portion of signal
xcurr = x( k+1 : k+M );
xwind = w.*xcurr;
Xwind = fft(xwind , Nfft);
H2 = fft(h2, Nfft);
Xfilt = Xwind.*H2;
xfilt= ifft(Xfilt, Nfft)';
% xfilt= conv(xwind, h2)';
%reconstruct output
out(k+1:k+Nfft) = out(k+1:k+Nfft) + xfilt';
end
%soundsc(out)
figure, plot(out)
hold on
plot(conv(h2,x),'r--')
hold off



sum=zeros(1,length(x));
for k = 0:R:length(x)-M+1
% current portion of signal
sum(k+1:k+M) = sum(k+1:k+M) + w;
end
figure, plot(sum), axis([0 length(x) -1 2]) 