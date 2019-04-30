function [x2,nx2] = deconv_m(y,ny,x1,nx1)

% Modified convolution routine for signal processing

% --------------------------------------------------

% [y,ny] = conv_m(x,nx,h,nh)

%  y = convolution result

% ny = support of y

%  x1 = first signal on support nx1

% nx1 = support of x1

%  x2 = second signal on support nx2

% nx2 = support of x2

%

nxb = ny(1)-nx1(1); nxe = ny(length(y)) - nx1(length(x1));

nx2 = [nxb:nxe]

x2 = deconv(y,x1)