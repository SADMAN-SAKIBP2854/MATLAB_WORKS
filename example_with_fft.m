clc;
clear all;
close all;

% Discrete Fourier Transform of a sinc function using FFT

t0 = 0.2; % duration of sinc pulse
ts = 3e-3; % sampling period
t = -t0/2:ts:t0/2; % defining time variable
x = sinc(100*t); % sinc function 
fs = 1/ts; % sampling frequency
N = 128; % Number of points DFT will be calculated
X = fft(x, N);
df = fs/N;
f = -fs/2:df:fs/2-df+df/2*mod(N,2);
subplot(311)
plot(t, x, 'Linewidth', 2);
title('sinc Pulse');
ylabel('Amplitude');
xlabel('t');
subplot(312)
stem(f, abs(fftshift(X)), 'Linewidth', 2); % We'll use fftshift while plotting an fft 
title('Magnitude Spectrum');
ylabel('|X(k)|');
xlabel('f');
subplot(313)
stem(f, angle(fftshift(X))*180/pi, 'Linewidth', 2);
title('Phase Spectrum');
ylabel('Phase (Degrees)');
xlabel('f');


