clear
clc
close all

% design lowpass filter (order , passband ripple , stopband attenuation , cutoff frequency )

%[B,A] = butter(6,0.20);      %[b,a]=butter(N,wn);
%[B,A] = cheby1(4,1,0.2);     %[b,a]=cheby1(N,Rp,wn);
%[B,A]=cheby2(4,15,0.3);      %[b,a]=cheby2(N,As,wn);
[B,A] = ellip(3,1,15,0.2);   %[b,a]=ellip(N,Rp,As,wn);

%
%
%
B = B.*(0.95).^[ 1 : length(B) ]; % contract zeros by 0.95

[H,w] = freqz(B,A); % frequency response
subplot ( 2 , 1 , 1 ) , plot (w, abs(H))
title('Module' )
xlabel ( 'Frequency (radians / sample)');
ylabel ( '|H(\omega)|' ) ;
subplot ( 2 , 1 , 2 ) , plot(w, unwrap(angle(H)))
title( 'Phase response unwrapped ' )
xlabel ( 'Frequency (radians / sample)');
ylabel (' \Theta(\omega)') ;
