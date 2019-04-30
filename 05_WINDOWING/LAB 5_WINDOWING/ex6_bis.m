%clear
%clc
%close all

NFFT = 2^14;

%   Load the wav file
%[x Fs Nbit] = wavread('flute2.wav');
%[x Fs Nbit] = wavread('piano.wav');
length(x)
M=floor(0.05*Fs)
%   Compute the spectrogram
B = specgram(x, NFFT, Fs, hanning(M), floor(M/4));


%   Sketch the spectrogram
figure, specgram(x, NFFT, Fs, hanning(M), floor(M/4)); colormap(jet), colorbar;

% soundsc(x)

%   Find the the minimum and the maximum frequency of the fundamental of
%   the signal: by inspection on the spectrogram

