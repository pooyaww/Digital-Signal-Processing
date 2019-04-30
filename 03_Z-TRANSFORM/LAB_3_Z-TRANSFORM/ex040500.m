% Chapter 4: Example 4.5:

x1 = [1 2 3 ];

n1 = [-1:1];

x2 = [2 4 3 5];

n2 = [-2:1];

[x3, n3] = conv_m(x1,n1,x2,n2)

% x = deconv(x3,x1)

% [x_v, n_v] = deconv_m(x3,n3,x1,n1)
