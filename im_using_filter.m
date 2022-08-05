clc;
clear all;
close all;


% y[n] - y[n-1] +0.9y[n-2] = x[n]
% for impulse response: h[n] - y[n-1] + 0.9y[n-2] = delta[n]

n = -20:100; % time index vector
b = [1]; % coefficent vector of x[n]/delta[n]
a = [1 -1 0.9]; % coefficient vector of y[n]/h[n]

x = (n==0); % defining the delta sequence

h = filter(b,a,x);

stem(n,h);