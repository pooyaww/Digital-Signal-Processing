clc
close all
clear all

N = input('Input length of the sequence: ');

% generate realizations
R = 1000;
x = randn(R,N);
rm = zeros(R,2*N-1);

for k = 0:(N-1)
  %  for n = k+1:N
        for i = 1:R
             rm(i,N+k) = rm(i,N+k) + x(i,N)*x(i,N-k);
   %         rm(i,N+k) = rm(i,N+k) + x(i,n)*x(i,n-k);
        end
        r = mean(rm,1);
   % end
end

r(N-1:-1:1) = r(N+1:2*N-1);




r_hat = zeros(1,2*N-1);
x=x(1,:);

for k = 0:(N-1)
    for n = k+1:N
        r_hat(N+k) = r_hat(N+k) + x(n)*x(n-k); 
    end
end
r_hat(N-1:-1:1) = r_hat(N+1:2*N-1);

% biased estimate
r_hat = (1/N)*r_hat;

plot(r_hat)
hold on
plot(r,'r')
hold off
legend('estimated ACS', 'mean ACS')
% the process is ergodic
