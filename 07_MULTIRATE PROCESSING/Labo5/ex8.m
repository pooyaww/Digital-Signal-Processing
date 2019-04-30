clc
close all
clear all

x = randn(1000,1) + j*randn(1000,1) ; % input signal


M = 4 ; % number of subbands
K = 10 ;
L = M*K; % filter taps

h = fir1(L-1,1/M) ; %design filter with window method
em = zeros(M, length(h));

% compute polyphase filters
for m = 1:M
em(m,m:M:end) = h(m:M:end) ;
end
em

out = zeros(M, length(x)) ; % output subbands
% compute filter bank output
for m = 1 :M
y = filter(em(m, : ), 1, x) ;
out(m,1:length(y)) = y ;
end

out=fft(out);

% show output spectrum
for m = 1 :M
 subplot(M, 1 ,m), plot(abs(fft(out(m,:),1024)))
end