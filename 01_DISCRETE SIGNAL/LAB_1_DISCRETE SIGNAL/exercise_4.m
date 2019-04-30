% exercise_4

clc
clear all
close all

% consider two sequences and a scalar

n1=[0:10];
x1=cos(0.1*pi*n1+pi/3);
[x2,n2]=impseq(7,3,20);
a=3;

figure, subplot(2,1,1), stem(n1,x1)
xlabel('n')
ylabel('x1(n)')
subplot(2,1,2), stem(n2,x2)
xlabel('n')
ylabel('x2(n)')

% add the sequences:
[y,n] = sigadd(x1,n1,x2,n2);
figure, stem(n,y)
title('sequence addition')
xlabel('n')
ylabel('y(n)')


% multiply the sequences:
clear n, clear y
[y,n] = sigmult(x1,n1,x2,n2);
figure, stem(n,y)
title('sequence multiplication')
xlabel('n')
ylabel('y(n)')

%scaling:
clear n, clear y
y = a*x1;
figure, subplot(2,1,1), stem(n1,x1)
xlabel('n')
ylabel('x1(n)')
subplot(2,1,2), stem(n1,y)
title('scaling')
xlabel('n')
ylabel('y(n)')


%shifting
clear n, clear y
[y,n] = sigshift(x1,n1,3);
figure, subplot(2,1,1), stem(n1,x1)
xlabel('n')
ylabel('x1(n)')
subplot(2,1,2),  stem(n,y)
title('shifting')
xlabel('n')
ylabel('y(n)')


%folding
clear n, clear y
[y,n] = sigfold(x1,n1);
figure, subplot(2,1,1), stem(n1,x1)
xlabel('n')
ylabel('x1(n)')
subplot(2,1,2),  stem(n,y)
title('folding')
xlabel('n')
ylabel('y(n)')

% sample summation
clear s
s = sum(x1)

% sample product
clear p
p = prod(x1)

%signal energy
Ex=sum(x1.*conj(x1))  % first way
Ex_bis=sum(abs(x1).^2)   % second way


% signal power
N=length(x1);
Px=(sum(abs(x1).^2))./N

