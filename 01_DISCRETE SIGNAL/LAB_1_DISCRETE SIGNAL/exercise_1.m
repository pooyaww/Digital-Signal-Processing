clc 
clear all
close all

% exercise 1: types of sequences

n=[-3 -2 -1 0 1 2 3 4];
x=[2 1 -1 0 1 4 3 7];
figure, stem(n,x)
title('sequence')
xlabel('n')
ylabel('x(n)')


clear n, clear x
[x,n]=impseq(3,0,10)
figure, stem(n,x)
title('Unit sample sequence')
xlabel('n')
ylabel('delta(n-n0)')


clear n, clear x
[x,n]=stepseq(3,0,10)
figure, stem(n,x)
title('Unit step sequence')
xlabel('n')
ylabel('u(n-n0)')

clear n, clear x
n=[0:10];
x=(0.9).^n;
figure, stem(n,x)
title('real valued exponential')
xlabel('n')
ylabel('x(n)')

clear n, clear x
n=[0:10];
x=exp((2+3j).*n);
figure, stem(n,real(x))
title('complex valued exponential')
xlabel('n')
ylabel('x(n)')


clear n, clear x
n=[0:10];
x1=3*cos(0.1*pi*n+pi/3);
x2=2*sin(0.5*pi*n);
x= x1+x2; 
figure, stem(n,x)
title('sinusoidal sequence')
xlabel('n')
ylabel('x(n)')
figure, subplot(1,2,1), stem(n,x1)
xlabel('n')
ylabel('x1(n)')
subplot(1,2,2), stem(n,x2)
xlabel('n')
ylabel('x2(n)')
clear x, clear x2


P=4;
xtilde= x1'*ones(1,P)   % P columns of x', x is a row vector
xtilde=xtilde(:);      % reads matrix by column obtaining a long column vector
xtilde=xtilde';        % row vector
figure, stem(xtilde)
title('periodic sinusoidal sequence')
xlabel('n')
ylabel('x(n)')