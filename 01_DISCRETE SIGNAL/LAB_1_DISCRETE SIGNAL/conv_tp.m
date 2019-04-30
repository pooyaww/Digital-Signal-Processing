function [y,ny,H]=conv_tp(x,nx,h,nh)

% Linear Convolution using Toeplitz Matrix

% ----------------------------------------

% [y,ny,H] = conv_tp(x,nx,h,nh)

% y = output sequence in column vector form

% H = Toeplitz matrix corresponding to sequence h so that y = Hx

% h = Impulse response sequence in column vector form

% x = input sequence in column vector form

%

Nx = length(x); Nh = length(h);

nyb = nx(1)+nh(1); nye = nx(Nx) + nh(Nh);

ny = [nyb:nye];

hc=[h; zeros(Nx-1, 1)];

hr=[h(1),zeros(1,Nx-1)];

H=toeplitz(hc,hr);  % hc is the first column and hr is the first row

y=H*x;

