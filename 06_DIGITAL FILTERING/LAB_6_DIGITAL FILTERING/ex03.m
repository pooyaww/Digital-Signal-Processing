clear
clc
close all

p = [0.99 ; 0.99*exp(j*pi/8) ; 0.99*exp(-j*pi/8)];
z = [-1; exp(j*pi/16) ; exp(-j*pi/16)];
figure, zplane(z,p)
a = poly(p); 
b = poly(z);

Ns = 1024;

% FREQUENCY IMPULSE RESPONSE
[H, w] = freqz(b,a,Ns);
 % w va da 0 a pi
 % column vectors
figure
subplot(2,1,1) 
plot(w,20*log10(abs(H))); 
title('Module of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('|H(\omega)|');
axis([-pi pi -50 50 ] )

subplot( 2 , 1 , 2 ) 
plot(w, phase(H) )
title('Phase of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('\angle(H(\omega))');
axis([ -pi pi -pi pi ])

% WE WANT TO SEE ALSO THE NEGATIVE FREQUENCIES
% w and H are column vector (we have to flip the rows)
w=[-flipud(w(2:end)); w];
H=[conj(flipud(H(2:end))); H];
% For flipping the columns we use the command fliplr

figure, subplot(2,1,1) 
plot(w,20*log10(abs(H))); 
title('Module of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('|H(\omega)|');
axis([-pi pi -50 50 ] )

subplot( 2 , 1 , 2 ) 
plot(w, phase(H) )
title('Phase of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('\angle(H(\omega))');
axis([ -pi pi -pi pi ])



% equivalently , the frequency response is computed as follows
B = fft(b,Ns);
A = fft(a,Ns);
w = 2*pi*[0:Ns-1]/(Ns);
H = B./A;
figure
subplot(2,1,1)
plot(w, 10*log10(abs(H).^2));
%axis( [ 0 pi -50 50 ] )
title('Module of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('|H(\omega)|');

subplot( 2 , 1 , 2 )
plot (w, phase (H) )
%axis ( [ 0 pi -pi pi ] )
title('Phase of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('\angle(H(\omega))');


% THIS FILTER IS STABLE AND RESONANTING AT THE FREQUENCY [rad/sample]
% 0 and pi/8=0.39

% input
n=[0:1:Ns-1];
x= sin((pi/10)*n);
y=filter(b,a,x);
figure,
plot(abs(y))



% feed an impulse in the filter and verify that h(z) is the impulse
% response

delta = [ 1 ; zeros(Ns-1,1)]';
h = filter(b,a,delta);
figure
subplot(2,1,1), stem([0:Ns-1],h), title('impulse response')

h1=ifft(H);
subplot(2,1,2), stem([0:Ns-1],h1), title('impulse response')

