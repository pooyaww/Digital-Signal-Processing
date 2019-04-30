clc
clear all
close all

M = 1000; 
p = 3 ;
a = [0.8; 0.1; 0.05];
randn ('state',0) %resets the generator to its initial state.
e = randn(M, 1);
s = filter(1, [ 1 ; -a ], e);
subplot(2, 1, 1), plot(s);
subplot(2, 1, 2), plot(e)
r = zeros(p+1, 1);
for t=0 : p
    for m = 0 :M-1-t
        r(t+1) = r(t+1) + s(m+1)*s(m+t+1);
    end
end
% this is equivalent to
% [r2] = xcorr(s,p);
% r = r2(p+1: end);

R = toeplitz(r(1:p));
aest = R^(-1)*r(2:p+1);
% this is equivalent to
% aest = levinson(r,p);
% aest = -aest(2:end);

eres = filter([1 ; -aest], 1, s);
figure, plot(eres)
mean(eres.^2)
