clc;
clear all;
close all;

x = [1, 1, 0, 0, 1];
N = 5;
 
[X, k] = DFT(x, N);

MagX = abs(X); % Magnitude Spectrum
PhaseX = angle(X)*180/pi; % Showing angle in degree

figure(1)
subplot(221)
stem(k, MagX, 'Linewidth', 2);
xlabel('k');
ylabel('Magnitude Spectrum');
grid on
subplot(222)
stem(k, PhaseX, 'Linewidth', 2);
xlabel('k');
ylabel('Phase Spectrum (Degrees)');
grid on


% IDFT to obtain the original signal from its DFT
[xn, n] = IDFT(X, N);
subplot(2,2,[3,4])

stem(n, real(xn), 'Linewidth', 2);
set(gca,'Xtick', n);
title('Reconstructed Signal');
grid on