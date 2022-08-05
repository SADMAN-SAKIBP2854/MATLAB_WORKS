clc;
clear all;
close all;

% Linear convolution using DFT

x = [2, 1, 2, 1]; % signal x
nx = 0:3; % index vector of x
h = [1, 2, 3, 4]; % signal h
nh = 0:3; % index vector of h
[y1, ny1] = convolution_sum(nx, x, nh, h);
ny = min(nx)+min(nh):max(nx)+max(nh); % index vector of y
len = length(ny)
% padding zero after x and h to make it of length len
x = [x zeros(1, len-length(x))]
h = [h zeros(1, len-length(h))]

X = fft(x, len); % len point DFT of x
H = fft(h, len); % len point DFT of h

Y = X.*H; % Y is the product of X and H 
y = ifft(Y) % y in time domain



