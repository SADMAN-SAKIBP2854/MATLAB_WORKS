clc;
clear all;
close all;

% We'll sample a signal at a frequency 500 Hz
% xc = 10*cos(200*pi*t)
% Signal Frequency, Fo = 100 and Signal Period, To = 1/100
% Sampling Frequency, Fs = 500 and Sampling Period, Ts = 1/500

Fo = 100; % Signal Frequency
To = 1/Fo; % Signal Period
Fs = 800; % Sampling Frequency which is greater than Nyquist Rate
Ts = 1/Fs;

t = 0:To/100:3*To; % Time axis for continuous signal
xc = 10*cos(200*pi*t); % continuous signal

t1 = 0:Ts:3*To; % Sampled time axis
xs = 10*cos(200*pi*t1); % Sampled Signal

subplot(211)
plot(t, xc, 'Linewidth', 2); % plotting continuous-time signal
hold on 
stem(t1, xs, 'Linewidth', 2); % showing the sampled values in the same plot
subplot(212)
stem(t1, xs, 'Linewidth', 2); % showing the sampled values in a separate plot
