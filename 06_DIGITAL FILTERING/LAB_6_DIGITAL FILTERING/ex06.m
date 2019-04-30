clc
close all
clear all

% linear phase -> coefficient symmetric respect to center
% b3 == b0 = 1
% b1 == b2 = 2 arbitrarily choosen

warning off MATLAB:divideByZero
warning off MATLAB:log:logOfZero

b = [ 1 2 2 1 ] ;
figure,
zplane (b, 1 ) ;

% note : for the case of a real impulse response and three zeros , one is
% real and two lies on the unit circle .
% Never the less , there are linear phase filters that have zeros
% outside the unit circle. In this case, zeros always occur in groups of
% four, i.e., if z0 is a zero, also zo*, 1/z0, 1/z0* are zeros.
% In fact, it is possible to prove that:
% - generic zeros of a linear phase filter exist in sets of 4 .
% - zeros on the unit circle exist in sets of 2 (z0 , z0*)
% - zeros on the real line exist in sets of 2 (z0 ,1/z0)
% - zeros at 1 and -1 do not imply the existence of zeros at other specific points

% note : in order to be linear phase, a filter can also be ODD with respect
% to the center of the sequence (not treated in the lecture notes).
% Try : b = [1 -3.9 3.9 -1] . There are three real zeros and the phase is linear.

% plot frequency responce of filter
[ H, w ] = freqz(b, 1, 2^12);
figure,
subplot(2, 1, 1), 
plot(w, 20*log10(abs(H)));
title('Module of the frequency response'), 
xlabel('frequency [rad/sampl]'), ylabel('\|(H(\omega))|');

%phasedelay = unwrap(phase(H));
groupdelay = -unwrap(phase(H))./w;
subplot(2, 1, 2 ), plot(w, unwrap(phase(H))), title('phase');
%subplot(2, 1, 2 ), plot(w, groupdelay), title('groupdelayphase');
xlabel('frequency [rad/sampl]'), ylabel('\angle(H(\omega))');

% note: the phase delay is not constant due to the fact that there is a
% zero on the unit circle. Therefore , the phase discontinuity cannot be
% eliminated by the phase unwrapping operation