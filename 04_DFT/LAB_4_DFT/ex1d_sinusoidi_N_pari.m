% SINUSOIDAL BASIS SET

% N EVEN

clc
clear all
close all

N = 8;     % Sequence's length
p=[0:0.01:N-1]; % defined for the signal continuous in time
n=[0:1:N-1];
i=0;


% sinusoid from -N/2 to (N/2)-1
%continuous
sc=zeros(N,length(p));
i=0;
figure,
for k = -N/2:(N/2)-1
    i=i+1;
    sc(i,:) = exp(j*2*pi*p*(k)/N);
    subplot(N,1,i), plot(p,real(sc(i,:)))
    axis([0 N-1 -1 1])
    hold on
end

%discrete
s1=zeros(N,length(n));
i=0;
for k = -N/2:(N/2)-1
    i=i+1;
    s1(i,:) = exp(j*2*pi*n*(k)/N);
    subplot(N,1,i), plot(n,real(s1(i,:)),'*')
    ylabel(['k = ',num2str(k)])
    axis([0 N-1 -1 1])
end
hold off



% sinusoid from 0 to N-1
% dicrete
s2=zeros(N,length(n));
figure,
for k = 1:N
    s2(k,:) = exp(j*2*pi*n*(k-1)/N);
    subplot(N,1,k), plot(n,real(s2(k,:)),'*')
     ylabel(['k = ',num2str(k-1)])
    axis([0 N-1 -1 1])
    hold on
end

% continuous. Rearrange them
i=0;
for k =-N/2:(N/2)-1
    i=i+1;
    if i<=(N/2)
        subplot(N,1,i), plot(p,real(sc(i+(N/2),:)))
    elseif i>(N/2)
        subplot(N,1,i), plot(p,real(sc(i-(N/2),:)))
    end
    axis([0 N-1 -1 1])
end
hold off




% Alternative method
% The N sinusoids are the IFFT of an impulse of area N at the
% specific freq k

%figure,
%for k=1:N
%y = zeros(N,1);
%y(k) = N;
%x = ifft(y);
%subplot(N,1,k);
%plot(n,real(x)) ;
%end