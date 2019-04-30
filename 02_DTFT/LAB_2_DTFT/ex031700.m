% Analog Signal

Dt = 0.00005;    %grid interval

t = -0.005:Dt:0.005;

xa = exp(-1000*abs(t));  %analog signal

%

% Continuous-time Fourier Transform

Wmax = 2*pi*2000;

K = 500; k = 0:1:K;   %501 samples

W = k*Wmax/K;      % interval [0 Wmax] with 501 samples 

Xa = xa * exp(-j*t'*W) * Dt;

Xa = real(Xa);    % consider only the real part --> is even!!

W = [-fliplr(W), W(2:501)]; % Omega from -Wmax to Wmax

Xa = [fliplr(Xa), Xa(2:501)];

subplot(1,1,1)

subplot(2,1,1);plot(t*1000,xa);

xlabel('t in msec.'); ylabel('xa(t)')

title('Analog Signal')

subplot(2,1,2);plot(W/(2*pi*1000),Xa);

xlabel('Frequency in KHz'); ylabel('Xa(jW)')

title('Continuous-time Fourier Transform')



