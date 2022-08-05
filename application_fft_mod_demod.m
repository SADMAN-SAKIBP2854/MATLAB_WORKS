clc;
clear all;
close all;

% DSB-SC Modulation and demodulation of message signal using FFT

%% message signal and carrier signal generation
% we'll use a sinc function as a messeage signal 
% and a cosine function with 250 Hz frequency as carrier

to = 0.2; % duration of the sinc function
ts = 0.001; % sampling period
fc = 250; % Carrier frequency
fs = 1/ts; % Sampling Frequency
t = -to/2:ts:to/2; % time axis for message signal

m = sinc(100*t); % message signal
c = cos(2*pi*fc*t); % carrier signal

%% Modulation
u = m.*c; % DSB-AM modulated signal
N = 1024; % FFT Bin size

M = fft(m, N); % N point DFT of message signal
M = M/fs; % scaling
U = fft(u, N); % N point DFT of modulated signal
U = U/fs;

% Visualizing modulated spectrum
fn = [0:1/N:1-1/N]*fs-fs/2; % Frequency axis for spectrum
figure(1)
subplot(211), plot(fn, abs(fftshift(M)), 'Linewidth', 2); % showing message spectrum
title('Spectrum of the message signal');
subplot(212), plot(fn, abs(fftshift(U)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the modulated signal');


%% Demodulation
% Here we'll demodulate the modulated signal
% and then filter the demodulated signal to obtain message signal
y = u.*c; % demodulation 
Y = fft(y,N); % N-point DFT of demodulated signal
Y = Y/fs; 
figure(2)
subplot(211)
plot(fn, abs(fftshift(Y)), 'Linewidth', 2); % showing the demodulated spectrum
title('Spectrum of Demodulated signal');

%% filtering

fcut = 200; % cut-off frequency of the low pass filter
ncut = floor(fcut*fs/N); % index vector for filter upto cut-off frequency
H = zeros(1,N); % Filter vector
H(1:ncut) = 2*ones(1,ncut); % Low pass filter with gain 2 
H(N-ncut+1:N) = 2*ones(1, ncut); % Other portion of the low pass filter
Ufiltered = Y.*H; % Filtering the modulated spectrum
subplot(212)
plot(fn, abs(fftshift(Ufiltered)), 'Linewidth', 2);
title('Spectrum of the filtered Signal');

%% visualizing the original and reconstructed message signal in time domain

ufiltered = real(ifft(Ufiltered))*fs; % ufiltered is the time domain version of Ufiltered
figure(3)
subplot(211)
plot(t, m, 'Linewidth', 2);
title('Message Signal');
subplot(212)
plot(t, ufiltered(1:length(t)), 'Linewidth', 2);
title('Reconstructed Signal');

