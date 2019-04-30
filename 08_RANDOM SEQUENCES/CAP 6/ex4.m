clc
clear all
close all

rho = 0.9; 
varz = 0.1;
N = 2000; % number of time samples
R = 2000; % number of realizations
x = zeros(R,N); 
z = sqrt(varz)*randn(R,N);
for r = 1 :R
x(r,:) = filter(1,[1 -rho], z(r,:));
end

% time statistics(N) (assume only first realization available)
% ensemble statistics(R) (compute only at time 50 because WSS)
mN = mean(x(1,:))
mR = mean(x(:,50))
mT = 0
vN = var(x(1,:))
vR = var(x(:,50))
vT = varz/(1-rho^2)


[rN lagN]=xcorr(x(1,:));
nN=lagN;
figure, subplot(211), plot(nN,rN)

[rR lagR]=xcorr(x(:,50));
nR=lagR;
subplot(212), plot(nR,rR)
