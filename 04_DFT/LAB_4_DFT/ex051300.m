% Chapter 05: Example 05.12: Circular shift example

%

x1 = [1,2,2]; x2 = [1,2,3,4];

N =4;

y = circonvt(x1,x2,N)


X1 = fft(x1,N);

X2 = fft(x2,N);

Y = X1.*X2;

y = ifft(Y,4)