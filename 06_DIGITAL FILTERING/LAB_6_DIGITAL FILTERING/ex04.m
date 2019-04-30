clc
close all
clear all


% transfer function H(z) = 1 + 0.2 zˆ-1 / 1 - 0.9 zˆ-1
b = [ 1 0.2] ;
a = [ 1 -0.9] ;

%impulse response
Nfft = 2^14;  % 16384
delta = [1 zeros(1 ,Nfft-1)];
h = filter(b, a, delta);
n = [0 :Nfft-1];
figure,
plot(n,h); title('h ( n )');
axis([0 500 0 1.4]),
xlabel('samples');

% frquency response
[H, f ] = freqz(b, a, Nfft);
figure,
plot(f,20*log10(abs(H)), 'LineWidth', 2);
title('Module of the frequency response'), 
xlabel('frequency [Hz]'), ylabel('|H(f)|');


%FIR f i l t e r
%see what happens if you truncate the impulse response 
h1 = h(1:20);
h2 = h(1:100);
h3 = h(1:1000);
h4 = h(1:10000);

[H1, f] = freqz(h1, 1, Nfft);
[H2, f] = freqz(h2, 1, Nfft);
[H3, f] = freqz(h3, 1, Nfft);
[H4, f] = freqz(h4, 1, Nfft);
hold on
plot(f,20*log10(abs(H1)), 'r--');
%plot(f,20*log10(abs(H2)), 'g--');
%plot(f,20*log10(abs(H3)), 'k--');
%plot(f,20*log10(abs(H4)), 'm--');
xlabel ('Frequency [Hz]');
ylabel ('|H(f)| [dB]');
hold off