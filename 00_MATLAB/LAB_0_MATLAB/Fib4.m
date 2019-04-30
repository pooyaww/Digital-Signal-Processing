function f = Fib4(n)

% Returns the nth number in the
% Fibonacci sequence.

A = [0 1;1 1];

y = A^n*[1;0];  % y = fn ; fn+1

% A^n = A*A*A*A*...*A (n times)

f=y(1);