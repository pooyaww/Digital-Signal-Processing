
clear
close all
clc

N = input('Input the desired length of the sequence: ');
R = input('Number of times to repeat the experiment:');

var_x = 1;
x = sqrt(var_x)*randn(R,N);
vs = zeros(R,1);

for r = 1:R
    vs(r) = var(x(r,:),1);
end
    
figure, plot([1:R], vs);
title('variance estimator');
xlabel('Sequence length');
ylabel('var(x)');

bias = var_x - mean(vs)

biasest = var_x - ((N-1)/N)*var_x

