clear all
close all
clc


N = 1000;
%a(1)*y(n)=-a(2)*y(n-1)+b(1)*x(n)+b(2)*x(n-1);
b = [ 1 1 ];
a = [ 1 -0.9];
x = randn(N,1);
y = filter(b,a,x);

figure,
subplot(2,1,1), plot([0:N-1],x), title('input signal')
subplot(2,1,2), plot([0:N-1],y), title('output signal')


%impulse response
delta = [ 1 ; zeros(N-1,1)]';
h = filter(b,a,delta);
figure
subplot(3,1,1), stem([0:50],x(1:51)), title('input signal')
subplot(3,1,2), stem([0:50],h(1:51)), title('impulse response')
subplot(3,1,3), stem([0:50],y(1:51)), title('output signal')


% CONVOLUZIONE
%   Filtering with the convolution function
y1 = conv(h,x);
y1 = y1(1:length(x));

% this is equivalent to
% y = filter(b,a,x);
% but length(y1) = length(x) + length(b)-1
% and length(y) = length(x)

figure,
subplot(3,1,1), plot([0:N-1], y), title('Filtered signal with filter'), xlabel('time (s)'), ylabel('y(t)'); 
subplot(3,1,2), plot([0:N-1], y1(1:N)), title('Filtered signal with conv'), xlabel('time (s)'), ylabel('y(t)');
subplot(3,1,3), plot([0:N-1], y-y1), title('Difference between the filtered signal'), xlabel('time (s)'), ylabel('y(t)');

error=sum(y-y1)