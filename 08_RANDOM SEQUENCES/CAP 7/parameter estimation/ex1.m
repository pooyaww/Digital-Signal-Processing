clc
close all
clear all

N = input('Inputh the desired length of the sequence:');
R = input('Number of time to repeat the experiment:');

%R=10;
%N = 100000;

m = 3;
sigma2 = 2;
x = sqrt(sigma2)*randn(R,N) + m;
mS = zeros(R,1);
mM = zeros(R,1);

for r = 1:R
    mS(r) = mean(x(r,:));
    mM(r) = (max(x(r,:)) + min(x(r,:)))/2;
end

mumeanS = mean(mS)
muvarS = var(mS)
mumeanM = mean(mM)
muvarM = var(mM)

figure, subplot(211), plot([1:R],mS)
subplot(212), plot([1:R],mM)