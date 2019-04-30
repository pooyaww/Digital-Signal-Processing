% % Chapter 05: Example-5.16: Overlap and save

%


clear all
close all


x1 = [1,2,2,1]; 
x2=[1,-1,-1,1];

x3 = conv(x1,x2)

l= length(x3)


x4 = circonvt(x1,x2,l)

X1 = fft(x1,l);
X2 = fft(x2,l);
X3 = X1.*X2;

x5 = real(ifft(X3))