% Chapter 05: Example 05.10: Circular even/odd property

%

% a) plot xec(n) and xoc(n)

n = 0:10; x = 10*(0.8) .^ n;

[xec,xoc] = circevod(x);

figure, subplot(2,1,1); stem(n,xec); title('Circular-even component')

xlabel('n'); ylabel('xec(n)'); axis([-0.5,10.5,-1,11])

subplot(2,1,2); stem(n,xoc); title('Circular-odd component')

xlabel('n'); ylabel('xoc(n)'); axis([-0.5,10.5,-4,4])


%

% b) verify property

X = fft(x,11); Xec = fft(xec,11); Xoc = fft(xoc,11);

figure, subplot(2,2,1); stem(n,real(X)); axis([-0.5,10.5,-5,50])

title('Real{DFT[x(n)]}'); xlabel('k');

subplot(2,2,2); stem(n,imag(X)); axis([-0.5,10.5,-20,20])

title('Imag{DFT[x(n)]}'); xlabel('k');

subplot(2,2,3); stem(n,real(Xec)); axis([-0.5,10.5,-5,50])

title('DFT[xec(n)]'); xlabel('k');

subplot(2,2,4); stem(n,imag(Xoc)); axis([-0.5,10.5,-20,20])

title('DFT[xoc(n)]'); xlabel('k');

