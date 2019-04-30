% Chapter 8: Example 8.28

%            Chebyshev-1 Highpass Filter Design:

%                Use of the CHEBY1 function

%

% Digital Filter Specifications:        % Type: Chebyshev-I highpass

ws = 0.4586*pi;                         % Dig. stopband edge frequency

wp = 0.6*pi;                            % Dig. passband edge frequency

Rp = 1;                                 % Passband ripple in dB

As = 15;                                % Stopband attenuation in dB

Ripple = 10 ^ (-Rp/20);                 % Passband ripple

Attn = 10 ^ (-As/20);                   % Passband attenuation


% Calculations of Butterworth Filter Parameters:

[N,wn] = buttord(wp/pi,ws/pi,Rp,As);

[b,a] = butter(N,wn,'high')

% Calculations of Chebyshev-I Filter Parameters:

[N,wn] = cheb1ord(wp/pi,ws/pi,Rp,As);

[b,a] = cheby1(N,Rp,wn,'high')

% Calculations of Chebyshev-II Filter Parameters:

[N,wn] = cheb2ord(wp/pi,ws/pi,Rp,As);

[b,a] = cheby2(N,Rp,wn,'high')


% Calculations of Elliptic Filter Parameters:

[N,wn] = ellipord(wp/pi,ws/pi,Rp,As);

[b,a] = ellip(N,Rp,As,wn,'high')




b = b.*(0.95).^[ 1 : length(b) ]; % contract zeros by 0.95

[H,w] = freqz(b,a); % frequency response
subplot ( 2 , 1 , 1 ) , plot (w, abs(H))
title('Module' )
xlabel ( 'Frequency (radians / sample)');
ylabel ( '|H(\omega)|' ) ;
subplot ( 2 , 1 , 2 ) , plot(w, unwrap(angle(H)))
title( 'Phase response unwrapped ' )
xlabel ( 'Frequency (radians / sample)');
ylabel (' \Theta(\omega)') ;

