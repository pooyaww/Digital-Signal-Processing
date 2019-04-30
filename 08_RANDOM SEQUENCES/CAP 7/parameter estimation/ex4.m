clc
clear all
close all


N = 10 ; %dataset length
varx = 2 ; %known variance
theta = 1 ; %true mean (to be estimated)
x = sqrt(varx)*randn(N,1)+theta ; %dataset

%pdf
s =[-6:0.01:6]';
pdf = (1/(sqrt(2*pi*varx)))*exp(-(s-theta).^2/(2*varx));

%likelihood
thetas =[-6:0.01:6]';
L = ones(length(thetas),1);
for n=1:N
    L = L.*(1/(sqrt(2*pi*varx))).*exp((-1/(2*varx))*(x(n)-thetas).^2);
end
subplot(1,2,1)
plot(s,pdf);
xlabel({'x'; ''; ' a )'}); title('Gaussian p.d.f.\eta_x = 1,\sigma_x^2 = 2');
subplot(1,2,2)
plot(thetas,L);
xlabel({'\theta';'';'b)'}); title('              Likelyhood function - L(\theta,x)');


[Lmax ind]=max(L);
thetast=thetas(ind)