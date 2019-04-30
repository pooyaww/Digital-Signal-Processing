clear
clc
close all

z=[2; 3*exp(j*pi/8); 3*exp(-j*pi/8); 0.5*exp(j*pi/4); 0.5*exp(-j*pi/4)] 
p = [0.9; 0.8*exp(j*pi/2); 0.8*exp(j*pi/2)];

figure, zplane(z,p)

b = poly(z);
a = poly(p);

z_minp = z(abs(z) < 1) %take the elements of z t.c. |z|<1
z_maxp = z(abs(z) >= 1)

b_allpass = poly(z_maxp);
a_allpass = conj(fliplr(b_allpass));

b_minp = poly(z_minp) ;
a_minp = poly(p) ;

[H, w] = freqz(b,a,1024);
[H_minp, w] = freqz(b_minp,a_minp,1024);
[H_allpass , w] = freqz(b_allpass,a_allpass,1024);


figure,
subplot(3,2,1); plot(w/pi, abs(H)) ; title ( '|H(\omega) |' )
subplot(3,2,2); plot(w/pi, phase(H)/pi) ; title ( '\angleH( \omega)' )
subplot(3,2,3); plot(w/pi, abs(H_minp)) ; title ( '|H_{minp}(\omega)|')
subplot(3,2,4); plot(w/pi, phase(H_minp)/pi) ; title('\angle H_{minp}(\omega)')
subplot(3,2,5); plot(w/pi, abs(H_allpass )) ; title('| H_{allpass}(\omega)|')
subplot(3,2,6); plot(w/pi, phase(H_allpass)/pi) ; title('\angle H_{allpass}(\omega)')


figure,
subplot(2,2,1); plot(w/pi, abs(H)) ; title ( '|H(\omega) |' )
subplot(2,2,2); plot(w/pi, phase(H)/pi) ; title ( '\angleH( \omega)' )
HR = H_minp.*H_allpass
subplot(2,2,3); plot(w/pi, abs(HR)) ; title ( '|cascadeH(\omega)|')
subplot(2,2,4); plot(w/pi, phase(HR)/pi) ; title('\angle cascadeH(\omega)')
