clc;
clear all;
close all;

nx = 0:15; % defining time index

x = 0.05*nx.^2; %defining a signal n

% y = x[n-5]
n0 = 5;
[y, ny] = sigshift(x, nx, n0);

% calculating cross-correlation using convolution
% rxy = y[n]*x[-n]

[x, nx] = sigfold(x, nx);

[rxy, nxy] = convolution_sum(nx, x, ny, y);
stem(nxy, rxy);