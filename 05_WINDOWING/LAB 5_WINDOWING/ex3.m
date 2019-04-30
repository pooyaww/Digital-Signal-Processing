clc
clear all
close all

M=[ 20 , 30 , 40 , 80 ] ;
for i = 1 : length(M)
    N = 2^14;
    Omega_M = 2*pi/(N/1000) ;
    Omega_1 = Omega_M
    Omega_2 = Omega_M + 2*pi/40 
    n = [0:N-1] ;
    T = 1;
    x = cos(Omega_1*n*T)'+cos(Omega_2*n*T)' ;
    w_R = 1/M(i)*ones(M(i),1);
    w_R = [w_R; zeros(N-M(i),1)];
    y = x.*w_R;
    Y = fft(y,N);
    omega = (2*pi*[-N/ 2 : N/2-1] / N)';
    subplot(2,2,i), plot(omega,fftshift(20*log10(abs(Y)))) ;
    title(['M = ' num2str(M(i))])
    xlabel ('frequency(radians/sample)') ;
    ylabel ('amplitude(dB)') ;
    %axis([0,pi,-30,0])
end