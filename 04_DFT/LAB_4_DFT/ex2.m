%  LINEARITY

a = 0.2;                %Mix coefficients
b = 0.3;
x = ones(100,1);        %x sequence
y = triang(100);        %y sequence
z1 = a*x+b*y;           %Mix signal in temporal domain

X = dft(x');             
Y = dft(y');
Z2 = a*X+b*Y;           %Mix signal in frequency domain
Z = dft(z1');
error=sum(abs(Z)-abs(Z2))

z2 = real(ifft(Z2));
error2 = sum(z1'-z2)


figure, subplot(2,1,1);
plot(z2,'b');
title('z=idft(Z)');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
plot(z1,'r');
title('Mix signal obtained in time domain z=ax+by');
xlabel('Samples');
ylabel('Amplitude');


figure, subplot(2,1,1);
plot(abs(Z2),'b');
title('Z=aX+bY');
xlabel('Samples');
ylabel('Amplitude');

subplot(2,1,2);
plot(abs(Z),'r');
title('Z=DFT(ax+by)');
xlabel('Samples');
ylabel('Amplitude');
