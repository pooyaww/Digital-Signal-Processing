function f = Fib2(n)

% Returns the nth number in the
% Fibonacci sequence.

if n==1
    f = 0;
elseif n==2
    f = 1;
else
    f1 = 0; f2 = 1;
    for i = 2:n-1
        f = f1 + f2;
        f1=f2; f2 = f;
    end
end