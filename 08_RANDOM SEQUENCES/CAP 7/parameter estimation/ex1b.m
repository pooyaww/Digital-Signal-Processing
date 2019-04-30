clear
close all
clc

%R = input('Number of times to repeat the experiment:');
R=10;

m = 3;
sigma2 = 2;
cont=1;

for N=10:100:10000

    x = sqrt(sigma2)*randn(R,N) + m;
    mS = zeros(R,1);
    mM = zeros(R,1);

    for r = 1:R
        mS(r) = mean(x(r,:));
        mM(r) = (max(x(r,:)) + min(x(r,:)))/2;
    end

    biasS(cont) = m - mean(mS);
    biasM(cont) = m - mean(mM);
    
    cont=cont+1;
end

figure, subplot(211), plot([10:100:10000], biasS);
title('bias');
xlabel('number of samples');
ylabel('bias(mean(x))');
subplot(212), plot([10:100:10000], biasM);
xlabel('number of samples');
ylabel('bias(mean(x))');