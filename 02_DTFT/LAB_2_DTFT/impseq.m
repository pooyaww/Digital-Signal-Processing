function [x,n]=impseq(n0,n1,n2)

% Generates x(n) = delta(n-n0) n1<=n<=n2

n =[n1:n2];       % n starts from n1 and end
x = [(n-n0)==0];  % if n-n0 is equal to 0 --> then x(n) is equal to 1
                  % else if n-n0 is different from 0 --> then x(n)=0


