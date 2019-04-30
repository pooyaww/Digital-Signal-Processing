clc
clear all
close all

Nfft=1024;
N=41;
M=4;
fc=1/(2*M)


h = fir1(N,2*fc) ;
figure,
subplot(211), stem(h)
H=fft(h,Nfft);
w=2*pi*[0:Nfft-1]./Nfft;
subplot(212), plot(w,20*log10(abs(H)))
%subplot(212), plot(w,fftshift(20*log10(abs(H))))

w1=pi/16;
w2=pi/8;
w3=pi/2;
n=[0:200];
x = cos(w1*n)+0.5*cos(w2*n)+2*cos(w3*n);

% filtering
xfilt = conv(h,x);

%downsampling
xdec = xfilt(1:M:end);

figure,
subplot(3,1,1), plot(x)
subplot(3,1,2), plot(xfilt)
subplot(3,1,3), plot(xdec)

[H, w] = freqz(x, 1, 1024) ;
[Hfilt, w] = freqz(xfilt,1,1024) ;
[Hdec, w] = freqz(xdec,1,1024);
figure,
plot(w, 10*log10(abs(H).^2));
hold on
plot(w, 10*log10(abs(Hfilt).^2), 'b-.');
plot(w, 10*log10(abs(Hdec).^2), 'r--');
hold off
legend('|X(\omega)|', '|Xfilt(\omega)|', '|Xdec(\omega)|') ;

figure,
subplot(3,1,1), plot(w, 10*log10(abs(H).^2))
subplot(3,1,2), plot(w, 10*log10(abs(Hfilt).^2), 'b-.');
subplot(3,1,3), plot(w, 10*log10(abs(Hdec).^2), 'r--');

% compare the output and the downsampled spectra
figure, subplot(211)
plot(w, 10*log10(abs(Hdec).^2), 'r--');
hold on
[Hdown, w] = freqz(x(1:M:end),1,1024);
plot(w, 10*log10(abs(Hdown).^2));
hold off
subplot(2,1,2), plot(xdec)
hold on,
plot(x(1:M:end),'r')
hold off


% see also
d=decimate(x,M); 
figure,
plot(w, 10*log10(abs(Hdec).^2), 'r--');
hold on
[D, w] = freqz(d,1,1024);
plot(w, 10*log10(abs(D).^2));
hold off
legend('|Xdec(\omega)|', '|Dec(\omega)|') ;


%swap
xdown=x(1:M:end);
hdown=h(1:M:end);
xdf=conv(xdown,hdown);
figure,
plot(w, 10*log10(abs(Hdec).^2), 'r--');
hold on
[Hdf, w] = freqz(xdf,1,1024);
plot(w, 10*log10(abs(Hdf).^2));
hold off

xdown=x(1:M:end);
xdf=conv(xdown,h);
figure,
plot(w, 10*log10(abs(Hdec).^2), 'r--');
hold on
[Hdf, w] = freqz(xdf,1,1024);
plot(w, 10*log10(abs(Hdf).^2));
hold off
