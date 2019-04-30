clc
close all
clear all

rho = 0.99;
R = 10;
N = 10000;
z = randn(R,N);
ACS = zeros(R, 2*N-1);

for r = 1:R
    x = filter(1 , [ 1 -rho ] , z(r,:));
    ACS(r, :) = xcorr(x , 'biased')';
    % ACS(r, :) = xcorr(x, 'unbiased')';
end

ACSmean = mean(ACS) ;
ACSvar = var(ACS) ;

ACStrue = (1/(1-rho^2))*rho.^(abs([-N+1:+N-1]));

plot([-N+1:+N-1], ACStrue, 'r', 'LineWidth', 2);
hold on
plot([-N+1:+N-1], ACSmean);
plot([-N+1:+N-1], ACSmean + sqrt(ACSvar), 'g--');
plot([-N+1:+N-1], ACSmean - sqrt(ACSvar), 'g--');
hold off