clc;
clear all;
close all;




Fo = 400; % Signal Frequency
To = 1/Fo; % Signal Period
Fs = 1600;% Sa1mpling Frequency which is greater than Nyquist Rate
Ts = 1/Fs;

t = 0:To/100:To; % Time axis for continuous signal
xc = 3*cos(200*pi*t)+4*sin(500*pi*t)-cos(800*pi*t); % continuous signal

t1 = 0:Ts:To; % Sampled time axis
xs = 3*cos(200*pi*t1)+4*sin(500*pi*t1)-cos(800*pi*t1); % Sampled Signal
n=t1/Ts;

% Visualizing pulse
figure(1)
plot(t,xc, 'Linewidth', 2);
title('Original Continuous Pulse');
xlabel('Time (seconds)');
ylabel('x(t)');
figure(2)
stem (t1,xs, 'Linewidth', 2);
title('Sampled sinusoidalPulse');
xlabel('Index (n)');
ylabel('x(n)');

%% Fourier Series Analysis
N = length(xs); % no. of data points
m = 1; % number of periods to be observed of cks

[k, c] = dtfs_analysis(m, n, xs);

figure (3)
subplot(211)
stem(k, abs(c), 'Linewidth', 2); 
title('Fourier Series Coefficients');
ylabel('|Ck|'); xlabel('k');
subplot(212)
stem(k, angle(c)*180/pi, 'Linewidth', 2);
ylabel('Angle Ck (degrees)'); xlabel('k');







