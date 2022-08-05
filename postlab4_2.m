clear all;
close all;
clc;
n = 0:6;
x = [1,1,2,3,5,8,13];
M = 501;
w = linspace(-pi, pi, M);
X = zeros(1, length(w));
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