clc;
clear all;
close all;


n = -1:3; % time index for the signal
x = 1:5; % signal

M = 501; % Number of points in digital frequency grid
w = linspace(-pi, pi, M); % Defining digital frequency grid
X = zeros(1, length(w)); % Defining the spectrum vector of x

% To find out X, we need to carry out the sum in equation (4)
for i1=1:M
    for i2=1:length(x)
        X(i1)=X(i1)+x(i2)*exp(-1i*w(i1)*n(i2));    
    end
end


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
