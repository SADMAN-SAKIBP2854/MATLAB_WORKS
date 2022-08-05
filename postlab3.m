clc;
clear all;
close all;
To = 0.001; % Signal Period
Fs = 5000;% Sa1mpling Frequency which is greater than Nyquist Rate
Ts = 1/Fs;
t = -To:To/100:To; % Time axis for continuous signal
xc = (sinc(100*t)).^2;% continuous signal
t1 = -To:Ts/100:To; % Sampled time axis
xs = sinc(100*t1).^2; % Sampled Signal
n=t1/Ts;
M = 501; % Number of points in digital frequency grid
w = linspace(-pi, pi, M); % Defining digital frequency grid
X = zeros(1, length(w)); % Defining the spectrum vector of x

% To find out X, we need to carry out the sum in equation (4)
for i1=1:M
    for i2=1:length(xs)
        X(i1)=X(i1)+xs(i2)*exp(-1i*w(i1)*n(i2));    
    end
end

figure(2)
subplot(211)
plot(w, abs(X), 'Linewidth', 2);
title('Magnitude Spectrum');
ylabel('|X(w)|');
xlabel('Frequency(rad/s)');
grid on
subplot(212)
plot(w, angle(X)*180/pi, 'Linewidth', 2);
title('Phase Spectrum');
ylabel('Angle of X(w) (degrees)');
xlabel('Frequency(rad/s)');
grid on
