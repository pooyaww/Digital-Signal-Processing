% Exercise 6

clear all
close all
clc

Area = area(2,3,4)
%s

clear all


% Fibonnaci sequence:  fn = fn-1 + fn-2; n = 3, 4, 5, ...
% f1 = 0; f2 = 1 

% We want to construct a function that will return the
% nth number in the Fibonnaci sequence fn.
% Input: Integer n
% Output: fn
% We shall describe four possible functions:

n=20
tic
f1 = Fib1(n)
toc
% it saved all the entries in the sequence even though we only required 
% the last one for output.

tic
f2 = Fib2(n)
toc
% it removes the need to use a vector

tic
f3 = Fib3(n)
toc
% recursive programming

tic
f4 = Fib4(n)
toc


% One may think that, on grounds of style, the 3rd is best 
% (it avoids the use of loops) followed by the second 
% (it avoids the use of a vector). 
% The situation is much different when it cames to speed of execution. 


n=200
tic
f1 = Fib1(n)
toc
tic
f2 = Fib2(n)
toc
tic
f4 = Fib4(n)
toc


% It is impractical to use Method 3 for any value of n
% much larger than 20 since the time taken by method 3
% almost doubles whenever n is increased by just 1.


