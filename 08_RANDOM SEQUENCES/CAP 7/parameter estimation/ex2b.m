clear
close all
clc

%R = input('Number of times to repeat the experiment:');
R=10;

var_x = 1;
cont=1;

for N=10:100:10000

    x = sqrt(var_x)*randn(R,N);
    vs = zeros(R,1);

    for r = 1:R
        vs(r) = var(x(r,:),1);
    end
    
    bias(cont) = var_x - mean(vs);

    biasest(cont) = var_x - ((N-1)/N)*var_x;
    cont=cont+1;
end

figure, plot([10:100:10000], bias);
title('bias');
xlabel('number of samples');
ylabel('bias(var(x))');
