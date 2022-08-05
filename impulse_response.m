clc;
clear all;
close all;

% y[n] + 0.6*y[n-1] = x[n]
% for impulse response, h[n] + 0.6*h[n-1] = delta[n]
% assuming causal system h[-1] = 0
% we'll start index from i = 2, where h(1) = h[-2] = 0, h(2) = h[-1], h(3) = h[0] etc.

n = -20:100; % time index vector
x = (n==0); % delta[n]
h = zeros(1,length(n)); %defining 

for i = 3:length(n)
    h(i) = x(i) + h(i-1) - 0.9*h(i-2);
end

stem(n,h);