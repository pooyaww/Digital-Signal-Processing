% Exercise 7
% function find

clear all
close all
clc

% vector
x = -1:.05:1;
y = sin(3*pi*x).*exp(-x.^2); plot(x,y,':')
k = find(y > 0.2)
hold on, plot(x(k),y(k),'o')
km = find( x>0.5 & y<0)
plot(x(km),y(km),'x')


% matrix
A = [ -2 3 4 4; 0 5 -1 6; 6 8 0 1]
k = find(A==0)
n = find(A<=0)
m = find(A'==0)

[r,c]=size(A)
for index=1:length(k)
    column(index) = floor(k(index)/r);
    row(index) = k(index)-column(index)*r;
    if row(index)==0
       row(index)=r;
       column(index)=column(index);
    else
        row(index) = row(index);
        column(index) = column(index) + 1;
    end
end

column
row

A(k)
% for i=1:length(row)
%     A(row(i),column(i))
% end
