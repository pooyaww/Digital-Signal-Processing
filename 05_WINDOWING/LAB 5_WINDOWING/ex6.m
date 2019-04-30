clc
close all
clear all


%[x,Fs,nbits]=wavread( 'flute2.wav' ) ;
[x Fs Nbit] = wavread('piano.wav');

M = floor(0.050*Fs) ; %window length (50msec )
R = floor (M/4) ; %hop size
N = 2^14; %power of 2 larger than M + Nh - 1
w = hanning (M) ;

xm = zeros(M,1);
ym = zeros(M,1);

Nframes = floor((length(x)-M-1)/R)
STFT = zeros(Nframes,N/2);
for m =0:Nframes
xm = x(m*R+1:m*R+M);
ym = w.*xm;
temp = abs(fft(ym,N));
STFT(m+1,:) = temp(1:N/2); 
end
STFT = STFT';
t = [0:Nframes - 1]*R/Fs ;
f = Fs*[0:N/2-1]/N;
figure, imagesc(t,f,20*log10(abs(STFT)))
xlabel('time(sec)');
ylabel('frequency(Hz)');

%soundsc(x)