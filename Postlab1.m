clc;
clear all;
close all;

% Here we'll compute DTFS of a periodic rectangular pulse
% So, first we'll need to generate the rectangular pulse

Fs = 100e3;       %Sampling frequency
dt = 1/Fs;        %Sampling period

% Generating the rectangular pulse train

T = 1e-3;                     %Period of the pulse train
D = .1;                       %duty cycle
PW = D*T;                     %Pulse width
f = 1/T;                      %Analog frequency
t = -T/2:dt:T/2;              %Time interval for a period

n = t/dt;                     %Index for data points for a period
L = PW/dt;                    %Data points in the high time
x = zeros(1,length(t));       %Initializing a single rectangular pulse 
x(find(abs(n)<=L/2))=1.1;   %Generation of a single rectangular pulse

% Visualizing the rectangular pulse
figure(1)
plot(t,x, 'Linewidth', 2);
title('Original Continuous Rectangular Pulse');
xlabel('Time (seconds)');
ylabel('x(t)');
figure(2)
stem (n,x, 'Linewidth', 2);
title('Sampled Rectangular Pulse');
xlabel('Index (n)');
ylabel('x(n)');

%% Fourier Series Analysis
N = length(x); % no. of data points
m1 = 0.5; % number of periods to be observed of cks
m2 = 1; % number of periods to be observed of cks
m2 = 3; % number of periods to be observed of cks

[k1, c1] = dtfs_analysis(m1, n, x);
[k2, c2] = dtfs_analysis(m2, n, x);
[k3, c3] = dtfs_analysis(m3, n, x);

figure (3)
subplot(411)
stem(k1, abs(c1), 'Linewidth', 2); 
title('Fourier Series Coefficients');
ylabel('|Ck|'); xlabel('k');
subplot(412)
stem(k1, angle(c1)*180/pi, 'Linewidth', 2);
ylabel('Angle Ck (degrees)'); xlabel('k');

subplot(413)
stem(k2, abs(c2), 'Linewidth', 2); 
title('Fourier Series Coefficients');
ylabel('|Ck|'); xlabel('k');
subplot(414)
stem(k2, angle(c2)*180/pi, 'Linewidth', 2);
ylabel('Angle Ck (degrees)'); xlabel('k');

%% Reconstruction of signal from Fourier coefficients

t_remax = T/2; % Maximum time upto which the original...
                ... signal will be reconstructed
t_re = -t_remax:dt:t_remax; % time axis for reconstructed signal
n_re = t_re/dt; % index vector for the reconstructed signal

x_re = zeros(1, length(n_re)); % initializing the reconstructed signal

% To compute x_re, we need to compute the sum:
% x[n] = sum (ck*exp(j*2*pi*kn/N)) from k = 0 to N-1
% for each n

for i1 = 1:length(k)
    for i2 = 1:length(x_re)
        x_re(i2) = x_re(i2)+c(i1)*exp(1i*2*pi*k(i1)*n_re(i2)/N); 
    end
end

figure(4)
subplot(211)
stem(n_re, real(x_re), 'Linewidth', 2); xlabel('n');
title('Reconstructed Signal');
subplot(212)
plot(t_re, real(x_re), 'Linewidth', 2); ylabel('t');
title('Reconstructed Signal');






