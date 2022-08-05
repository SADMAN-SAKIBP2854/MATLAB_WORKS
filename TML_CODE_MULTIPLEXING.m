clc;
clear all;
close all;

% DSB-SC Modulation and demodulation of message signal using FFT

%% message signal and carrier signal generation
% we'll use a sinc function as a messeage signal 
% and a cosine function with 250 Hz frequency as carrier

to = 0.2; % duration of the sinc function
ts = 0.001; % sampling period
fc1 = 150; % Carrier frequency
fc2 =300; % Carrier frequency
fc3=450; % Carrier frequency
fs = 1/ts; % Sampling Frequency
t = -to/2:ts:to/2; % time axis for message signal

m1 = sinc(100*t); % message signal 1
m2 = sin(100*t);%message signal 2
m3 = 5*sin(100*t);%message signal 3

c1 = cos(2*pi*fc1*t); % carrier signal
c2 = cos(2*pi*fc2*t); % carrier signal
c3 = cos(2*pi*fc3*t); % carrier signal

%% Modulation
u1 = m1.*c1; % DSB-AM modulated signal
u2 = m2.*c2; % DSB-AM modulated signal
u3 = m3.*c3; % DSB-AM modulated signal
N = 1024; % FFT Bin size

M1 = fft(m1, N); % N point DFT of message signal
M1 = M1/fs; % scaling
U1 = fft(u1, N); % N point DFT of modulated signal
U1 = U1/fs;

M2 = fft(m2, N); % N point DFT of message signal
M2 = M2/fs; % scaling
U2 = fft(u2, N); % N point DFT of modulated signal
U2 = U2/fs;

M3 = fft(m3, N); % N point DFT of message signal
M3 = M3/fs; % scaling
U3 = fft(u3, N); % N point DFT of modulated signal
U3 = U3/fs;
%Multiplexing
U4=U1+U2+U3;
U4=U4/fs;

% Visualizing modulated spectrum
fn = [0:1/N:1-1/N]*fs-fs/2; % Frequency axis for spectrum
figure(1)
subplot(421), plot(fn, abs(fftshift(M1)), 'Linewidth', 2); % showing message spectrum
title('Spectrum of the message signal 1');

subplot(422), plot(fn, abs(fftshift(M2)), 'Linewidth', 2); % showing message spectrum
title('Spectrum of the message signal 2');

subplot(423), plot(fn, abs(fftshift(M3)), 'Linewidth', 2); % showing message spectrum
title('Spectrum of the message signal 3');

subplot(424), plot(fn, abs(fftshift(U1)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the modulated signal 1');

subplot(425), plot(fn, abs(fftshift(U2)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the modulated signal 2');

subplot(426), plot(fn, abs(fftshift(U3)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the modulated signal 3');


figure(2)
plot(fn, abs(fftshift(U4)), 'Linewidth', 2); % Showing the modulated spectrum
title('Spectrum of the multiplexed signal');






%% Demodulation
% Here we'll demodulate the modulated signal
% and then filter the demodulated signal to obtain message signal
y1 = u1.*c1; % demodulation 
Y1 = fft(y1,N); % N-point DFT of demodulated signal
Y1 = Y1/fs; 
y2 = u2.*c2; % demodulation 
Y2 = fft(y2,N); % N-point DFT of demodulated signal
Y2 = Y2/fs; 
y3 = u3.*c3; % demodulation 
Y3 = fft(y3,N); % N-point DFT of demodulated signal
Y3 = Y3/fs;

figure(3)

subplot(3,1,1)
plot(fn, abs(fftshift(Y1)), 'Linewidth', 2); % showing the demodulated spectrum
title('Spectrum of Demultiplexed  signal 1');
subplot(3,1,2)
plot(fn, abs(fftshift(Y2)), 'Linewidth', 2); % showing the demodulated spectrum
title('Spectrum of Demultiplexed  signal 2');
subplot(3,1,3)
plot(fn, abs(fftshift(Y3)), 'Linewidth', 2); % showing the demodulated spectrum
title('Spectrum of Demultiplexed  signal 3');

%% filtering
figure(4)
fcut1 = 100; % cut-off frequency of the low pass filter
ncut1 = floor(fcut1*fs/N); % index vector for filter upto cut-off frequency
H1 = zeros(1,N); % Filter vector
H1(1:ncut1) = 2*ones(1,ncut1); % Low pass filter with gain 2 
H1(N-ncut1+1:N) = 2*ones(1, ncut1); % Other portion of the low pass filter
Ufiltered1 = Y1.*H1; % Filtering the modulated spectrum
subplot(311)
plot(fn, abs(fftshift(Ufiltered1)), 'Linewidth', 2);
title('Spectrum of the filtered Signal');


fcut2 = 250; % cut-off frequency of the low pass filter
ncut2 = floor(fcut2*fs/N); % index vector for filter upto cut-off frequency
H2 = zeros(1,N); % Filter vector
H2(1:ncut2) = 2*ones(1,ncut2); % Low pass filter with gain 2 
H2(N-ncut2+1:N) = 2*ones(1, ncut2); % Other portion of the low pass filter
Ufiltered2 = Y2.*H2; % Filtering the modulated spectrum
subplot(312)
plot(fn, abs(fftshift(Ufiltered2)), 'Linewidth', 2);
title('Spectrum of the filtered Signal');



fcut3 = 380; % cut-off frequency of the low pass filter
ncut3 = floor(fcut3*fs/N); % index vector for filter upto cut-off frequency
H3 = zeros(1,N); % Filter vector
H3(1:ncut3) = 2*ones(1,ncut3); % Low pass filter with gain 2 
H3(N-ncut3+1:N) = 2*ones(1, ncut3); % Other portion of the low pass filter
Ufiltered3 = Y3.*H3; % Filtering the modulated spectrum
subplot(313)
plot(fn, abs(fftshift(Ufiltered3)), 'Linewidth', 2);
title('Spectrum of the filtered Signal');

%% visualizing the original and reconstructed message signal in time domain

ufiltered1 = real(ifft(Ufiltered1))*fs; % ufiltered is the time domain version of Ufiltered
ufiltered2 = real(ifft(Ufiltered2))*fs; % ufiltered is the time domain version of Ufiltered
ufiltered3 = real(ifft(Ufiltered2))*fs; % ufiltered is the time domain version of Ufiltered
figure(5)
subplot(611)
plot(t, m1, 'Linewidth', 2);
title('Message Signal 1');
subplot(612)
plot(t, ufiltered1(1:length(t)), 'Linewidth', 2);
title('Reconstructed Signal 1');

subplot(613)
plot(t, m2, 'Linewidth', 2);
title('Message Signal 2');
subplot(614)
plot(t, ufiltered2(1:length(t)), 'Linewidth', 2);
title('Reconstructed Signal 2');

subplot(615)
plot(t, m3, 'Linewidth', 2);
title('Message Signal 3');
subplot(616)
plot(t, ufiltered3(1:length(t)), 'Linewidth', 2);
title('Reconstructed Signal 3');


