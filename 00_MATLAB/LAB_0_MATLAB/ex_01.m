%% EXERCISE 1

% This script illustrate principal aspect of plot function
clc
close all
clear all

N = 10; h = 1/N; x = 0:h:1;
y = sin(3*pi*x);
plot(x,y)
N = 100; h = 1/N; x = 0:h:1;
y = sin(3*pi*x); figure, plot(x,y)
title('Graph of y = sin(3pi x)')
xlabel('x axis')
ylabel('y-axis')

figure, plot(x,y,'k-',x,cos(3*pi*x),'g--')
legend('Sin curve','Cos curve')
title('Multi-plot ')
xlabel('x axis'), ylabel('y axis')
grid

y1 = sin(3*pi*x);
y2 = cos(3*pi*x);
figure, plot(x,y1,'k-'), hold on
plot(x,y2,'gx'), hold off
legend('Sin curve','Cos curve')
title('Multi-plot ')
xlabel('x axis'), ylabel('y axis')
grid

figure, subplot(221), plot(x,y)
xlabel('x'),ylabel('sin 3 pi x')
subplot(222), plot(x,cos(3*pi*x))
xlabel('x'),ylabel('cos 3 pi x')
subplot(223), plot(x,sin(6*pi*x))
xlabel('x'),ylabel('sin 6 pi x')
subplot(224), plot(x,cos(6*pi*x))
xlabel('x'),ylabel('cos 6 pi x')

%complex sequences
t=0:.001:1; 			% temporal axis [sec]
f=4; 				% frequency [Hz]
s=exp(i*2*pi*f*t); 		% complex exponential
figure, plot(t,real(s),t,imag(s))
figure, comet(real(s),imag(s))
figure, plot3(t,real(s),imag(s))
figure, comet3(t,real(s),imag(s))
figure, subplot(2,1,1), plot(t, abs(s));
subplot(2,1,2), plot(t, angle(s));


pause
close 1
pause
clf
pause
figure
figure(9)
clf