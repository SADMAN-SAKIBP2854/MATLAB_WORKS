clc;
close all;
clear all;

x = [1, 1, 0, 1, 1]; %first signal
nx = [-2, -1, 0, 1, 2]; %time index of signal x

h = [1, -2, -3, 4]; % second signal
nh = [-3, -2, -1, 0]; % time index of signal h

% now call the function to compute convolution x*h
[y, n] = convolution_sum(nx, x, nh, h); 

% again call the function to compute h*x
[z, k] = convolution_sum(nh, h, nx, x);

%displaying the results
subplot(211)
stem(n, y, 'Linewidth', 2);
subplot(212)
stem(k, z, 'Linewidth', 2);