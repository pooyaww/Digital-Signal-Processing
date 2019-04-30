clc
clear all
close all


% generate i.i.d. Bernoulli sequence of 1000 samples, arbitrary p
y = rand(1000,1);
x2 = zeros(length(y),1);
p = 0.2;
x2(y<p) = 0 ;
x2(y>=p) = 1 ;

figure, stem(x2)
axis([1 100 0 1])


% generate i.i.d. Bernoulli sequence of 1000 samples, p = 0.5
x1 = round(rand(1000, 1));
figure, stem(x1)
axis([1 100 0 1])


N=length(x2);
m=mean(x2)
ms=(1/N)*sum(x2)

sigma=var(x2)
vars=(1/(N-1))*sum((x2-ms).^2)  

