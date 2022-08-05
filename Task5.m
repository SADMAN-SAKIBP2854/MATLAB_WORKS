clc;
clear all;
close all;

% DSB-SC Modulation and demodulation of message signal using FFT

%% message signal and carrier signal generation
% we'll use a sinc function as a messeage signal 
% and a cosine function with 250 Hz frequency as carrier

to = 0.2; % duration of the sinc function
ts = 0.001; % sampling period
fc1 = 250; % Carrier frequency
fc2 = 750; % Carrier frequency
fs = 1/ts; % Sampling Frequency
t = -to/2:ts:to/2; % time axis for message signal

m1 = sinc(100*t); % message signal
m2 = sinc(100*t).^2; % message signal

c1 = cos(2*pi*fc1*t); % carrier signal
c2 = cos(2*pi*fc2*t); % carrier signal

%% Modulation
u1 = m1.*c1; % DSB-AM modulated signal
N = 1024; % FFT Bin size

M1 = fft(m1, N); % N point DFT of message signal
M1 = M1/fs; % scaling
U1 = fft(u1, N); % N point DFT of modulated signal
U1 = U1/fs;

u2 = m2.*c2; % DSB-AM modulated signal

M2 = fft(m2, N); % N point DFT of message signal
M2 = M2/fs; % scaling
U2 = fft(u2, N); % N point DFT of modulated signal
U2 = U2/fs;

y=u1+u2;

% Visualizing modulated spectrum
fn = [0:1/N:1-1/N]*fs-fs/2; % Frequency axis for spectrum
figure(1)
subplot(411), plot(fn, abs(fftshift(M1)), 'Linewidth', 2); % showing message spectrum
title('Spectrum of the message signal 1');

subplot(412), plot(fn, abs(fftshift(U1)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the modulated signal');
subplot(413), plot(fn, abs(fftshift(M2)), 'Linewidth', 2); % showing message spectrum
title('Spectrum of the message signal 2');
subplot(414), plot(fn, abs(fftshift(U2)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the modulated signal2');

%addition

figure(2)

plot(t, y,'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of output signal y(t)');
