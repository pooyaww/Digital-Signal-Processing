% Example 2.7

clc
clear all
close all


%

% x(n)=[3,11,7,0,-1,4,2]; nx = [-3:3]

% h(n)=[2,3,0,-5,2,1]; nh = [-1:4]

% y(n)=conv(x,h)

x = [3, 11, 7, 0, -1, 4, 2]; nx = [-3: 3];

h = [2, 3, 0, -5, 2, 1]; nh = [-1: 4];

[y,ny] = conv_m(x,nx,h,nh);

k = -100:100; w = (pi/100)*k;        % frequency between -pi and +pi

Y = y * (exp(-j*pi/100)).^(ny'*k);    % DTFT of y

%verification

X = x * (exp(-j*pi/100)).^(nx'*k);    % DTFT of x

H = h * (exp(-j*pi/100)).^(nh'*k);    % DTFT of h

Y_Ver=X.*H;


error = max(abs(Y-Y_Ver))           % Difference

% graphical verification

subplot(1,1,1)

subplot(2,2,1); plot(w/pi,abs(Y)); grid; axis([-1,1,0,200])

xlabel('frequency in pi units'); ylabel('Abs(Y)');


subplot(2,2,2); plot(w/pi,angle(Y)/pi); grid; axis([-1,1,-2,2])

xlabel('frequency in pi units'); ylabel('Phase(Y)');


subplot(2,2,3); plot(w/pi,abs(Y_Ver)); grid; axis([-1,1,0,200])

xlabel('frequency in pi units'); ylabel('abs(Y_Ver)');



subplot(2,2,4); plot(w/pi,angle(Y_Ver)/pi); grid; axis([-1,1,-2,2])

xlabel('frequency in pi units'); ylabel('Phase(Y_Ver)');



