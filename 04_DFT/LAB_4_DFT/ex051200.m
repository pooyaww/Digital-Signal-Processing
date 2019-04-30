% Chapter 05: Example 05.12: Circular shift example

%
clc
clear all
close all


% a) plot x((n-6))15

n = 0:10; x = 10*(0.8) .^ n;

m = 6;

N = 15;

y = cirshftt(x,m,N); 

x = [x, zeros(1,N-length(n))];

n = 0:N-1; 

figure, subplot(2,1,1); stem(n,x); title('Original sequence')

xlabel('n'); ylabel('x(n)'); axis([-1,15,-1,11])

subplot(2,1,2); stem(n,y); 

title('Circularly shifted sequence, N=15')

xlabel('n'); ylabel('x((n-6) mod 15)'); 

axis([-1,15,-1,11])


% Verify the property

X = fft(x,N);

Y = fft(y,N);

figure, subplot(2,2,1); stem(n,abs(Y)); title('DFT of the shifted sequence')

xlabel('k'); ylabel('|Y(k)|)'); 

subplot(2,2,2); stem(n,angle(Y)); title('DFT of the shifted sequence')

xlabel('k'); ylabel('<Y(k))');


k = [0:1:N-1];                       % row vecor for k

WN = exp(-j*2*pi*m/N);                 % Wn factor

WNmk = WN .^ k;                     % DFT matrix

Xk = X.* WNmk;                      % row vector for DFT coefficients

subplot(2,2,3); stem(n,abs(Xk)); title('Wmk_N * X(k)')

xlabel('k'); ylabel('|Xk(k)|)'); 

subplot(2,2,4); stem(n,angle(Xk)); title('Wmk_N * X(k)')

xlabel('k'); ylabel('<Xk(k))');


