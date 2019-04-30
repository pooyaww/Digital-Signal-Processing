% Chapter 05: Example 05.09: Circular symmetry property

%

clc
clear all
close all


% a) plot x((-n))N

n=[0:1:20];
N=length(n);
x=10*(0.8).^n;  


y = x(mod(-n,N)+1)

figure, subplot(2,1,1); stem(n,x); title('Original sequence')

xlabel('n'); ylabel('x(n)'); 

subplot(2,1,2); stem(n,y); title('Circularly folded sequence')

xlabel('n'); ylabel('x(-n mod 11)'); 


%

% b) verify property

X = fft(x,N); Y = fft(y,N);

figure, subplot(2,2,1); stem(n,real(X)); 

title('Real{DFT[x(n)]}'); xlabel('k');

subplot(2,2,2); stem(n,imag(X)); 

title('Imag{DFT[x(n)]}'); xlabel('k');

subplot(2,2,3); stem(n,real(Y)); 

title('Real{DFT[x((-n))21]}'); xlabel('k');

subplot(2,2,4); stem(n,imag(Y));

title('Imag{DFT[x((-n))21]}'); xlabel('k');



