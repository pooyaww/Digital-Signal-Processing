function f = Fib3(n)

% Returns the nth number in the
% Fibonacci sequence.

if n==1
    f = 0;
elseif n==2
    f = 1;
else
    f = Fib3(n-1) + Fib3(n-2);
end