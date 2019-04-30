function [A] = area(a,b,c)
% Compute the area of a triangle whose sides have length a, b and c.
% Inputs:
% a,b,c: Lengths of sides
% Output:
% A: area of triangle
% Usage:
% Area = area(2,3,4);
% Written by dfg, Oct 14, 1996.
s = (a+b+c)/2;
A = sqrt(s*(s-a)*(s-b)*(s-c));
%%%%%%%%% end of area %%%%%%%%%%%

% The variable s used in the definition of the function above is a local 
% variable: its value is local to the function and cannot be used outside.