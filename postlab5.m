clear all;
close all;
clc;
%Generation of message and carrier signal
to = 0.1;
ts = 0.001;
fc1 = 250;
fs = 1/ts;
t = -to/2:ts:to/2;
m1 = sinc(100*t);
c1 = cos(2*pi*fc1*t);
to = 0.1;
ts = 0.001;
fc2 = 750;
fs = 1/ts;
t = -to/2:ts:to/2;
m2 = (sinc(100*t)).^2;
c2 = cos(2*pi*fc2*t);
% Modulation
u1 = m1.*c1;
N1 = 1024;
M1 = fft(m1, N1);
M1 = M1/fs;
U1 = fft(u1, N1);
U1 = U1/fs;
% Visualizing modulated spectrum
fn1 = [0:1/N1:1-1/N1]*fs-fs/2;
subplot(511), plot(fn1, abs(fftshift(M1)), 'Linewidth', 2);
title('Message Signal 1');
subplot(512), plot(fn1, abs(fftshift(U1)), 'Linewidth', 2);
title('Modulated Signal 1');
u2 = m2.*c2;
N2 = 1024;
M2 = fft(m2, N2);
M2 = M2/fs;
U2 = fft(u2, N2);
U2 = U2/fs;
% Visualizing modulated spectrum
fn2 = [0:1/N2:1-1/N2]*fs-fs/2;
subplot(513), plot(fn2, abs(fftshift(M2)), 'Linewidth', 2);
title('Message signal - 2');
subplot(514), plot(fn2, abs(fftshift(U2)), 'Linewidth', 2);
title('Modulated Signal - 8');
y = u1+u2;
subplot(515), plot(t,y, 'Linewidth', 2);
title('y(t)');