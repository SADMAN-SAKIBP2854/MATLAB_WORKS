clc;
clear all;
close all;

% Frequency response from transfer function

b = [1 -1.6180 1]; % numerator
a = [1 -1.5161 0.878]; % denominator
% freqz(b, a, 256, 500);
%Fs = 256 and number of points between 0 and Fs/2 is 512
[h,f] = freqz(b, a, 256, 500);
subplot(211)
plot(f, 20*log(abs(h)), 'Linewidth', 2);
title("Magnitude Response");
xlabel("Frequency (Hz)");
ylabel("Magnitude(dB)");
grid on
subplot(212)
plot(f, angle(h)*180/pi, 'Linewidth', 2);
title("Phase Response");
xlabel("Frequency (Hz)");
ylabel("Phase(degrees");
grid on