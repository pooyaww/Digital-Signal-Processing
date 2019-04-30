
clc
clear all
close all

A1 = 1 ;
A2 = 0.5 ;
f1 = 440;
f2 = 500;
phi1 = pi ;
phi2=0;

Fs = 8000;
T = 1/Fs ;
t = [1:T:1.050-T];
N = length(t)
n=[0:1:N-1];

% Sample the signal with a samling frequency Fs and 
% plot the discrete signal in the time interval [1, 1.05 sec] 

x = A1*sin(2*pi*f1*t+phi1)+A2*sin(2*pi*f2*t+phi2);
figure;
subplot(3,1,1);
plot(t,x);
% plot(n,x);
ylabel('x(t)');
xlabel('t[sec]');
subplot(3,1,2);
plot(t,A1*sin(2*pi*f1*t+phi1));
ylabel('sin1');   % first component of the signal: 1/f1 = 0.0023 sec
xlabel('t[sec]');
subplot(3,1,3);
plot(t,A2*sin(2*pi*f2*t+phi2)); 
ylabel('sin2');   % second component of the signal 1/f2=0.002 sec
xlabel('t[sec]');


% Compute the DFT and plot the modulus 

X = fft(x);
w = 2*pi*[0:N-1]/N;
f = Fs*[0:N-1]/N;
fn = [0:N-1]/N; % normalized frequency  fnorm=f/Fs=f*T
figure;
subplot(4,1,1);
plot([0:N-1], abs (X) ) ;
xlabel ('sample') ;
ylabel('|X(w)|') ;
subplot(4,1,2) ;
plot( f , abs (X) ) ;
xlabel('Hz') ;
ylabel('|X(f)|') ;
subplot(4,1,3),
plot(fn, abs (X) ) ;
xlabel ('normalized frequency') ;
ylabel('|X(w)|') ;
subplot(4,1,4) ;
plot( w , abs (X) ) ;
xlabel('rad/s') ;
ylabel('|X(f)|') ;

%there is no spectral leakage since f1=k1*Fs/N and f2=k2*Fs/N 
% with k1 = 22 and k2 = 25