% Find the approximate value of the root of the equation x = cos x
clc
close all
clear all

% We may do this by making a guess x1 = pi*4, then computing the sequence 
% of values x_n = cos x_n-1; n = 2; 3; 4; ...
% and continuing until the difference between two successive values 
% |x_n - x_n-1| is small enough.

xold = pi/4; n = 1; d = 1;
while d > 0.001 & n < 20
    n = n+1; xnew = cos(xold);
    d = abs( xnew - xold );
    xold = xnew;
end


[n, xnew, d]

% We continue around the loop so long as d > 0.001 and n < 20. 
% For greater precision we could use the condition d > 0.0001:

xold = pi/4; n = 1; d = 1;
while d > 0.0001 & n < 20
    n = n+1; xnew = cos(xold);
    d = abs( xnew - xold );
    xold = xnew;
end

[n, xnew, d]
