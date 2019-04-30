% Chapter 05: Example 05.09: Circular symmetry property

%

clc
clear all
close all


% a) plot x((-n))N

n = 0:10; N=length(n);

x = exp(j*pi*3.*n)

X = fft(x,11);

y = conj(x);

Y = fft(y,11)

figure, subplot(2,1,1); stem(n,abs(X)); title('|DFT(x*)|')

xlabel('k');  axis([-0.5,10.5,-1,11])


%
% b) verify property

Y2=X(mod(-n,N)+1);

Y2 = conj(Y2)


subplot(2,1,2); stem(n,abs(Y2)); axis([-0.5,10.5,-1,11])

title('|X*((-k))_N|'); xlabel('k');

