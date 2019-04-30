clc
clear all
close all

N = 2000; % number of time samples
R = 2000; % number of realizations

a = randn(R,1);

x = ones (R,N);
for i=1:R
    x(i,:) = a(i).*x(i,:);
end


% time statistics(N) (assume only first realization available)
% ensemble statistics(R) (compute only at time 50 because WSS)
mN = mean(x(1,:))
mR = mean(x(:,50))
mT = 0
vN = var(x(1,:))
vR = var(x(:,50))
vT = 1


[rN lagN]=xcorr(x(1,:));
nN=lagN;
figure, subplot(211), plot(nN,rN)

[rR lagR]=xcorr(x(:,50));
nR=lagR;
subplot(212), plot(nR,rR)
