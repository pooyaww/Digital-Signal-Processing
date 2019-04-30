clc
close all
clear all


N = input('Input length of the sequence: ');
x = randn(1,N);
r_hat = zeros(1,2*N-1);

for k = 0:(N-1)
    for n = k+1:N
        r_hat(N+k) = r_hat(N+k) + x(n)*x(n-k); 
    end
end
r_hat(N-1:-1:1) = r_hat(N+1:2*N-1);

% biased estimate
r_hat = (1/N)*r_hat;

% generate realizations
R = 10;
x = randn(R,N);
r_est = zeros(R,2*N-1);

for r=1:R
    for k = 0:(N-1)
        for n = k+1:N
            r_est(r,N+k) = r_est(r,N+k) + x(r,n)*x(r,n-k); 
        end
    end
    r_est(r,N-1:-1:1) = r_est(r,N+1:2*N-1);
end
r_est=(1/N).*r_est;

r = mean(r_est,1); % row vector containing the mean value of each column

plot(r_hat)
hold on
plot(r,'r')
hold off
legend('estimated ACS', 'mean ACS')
