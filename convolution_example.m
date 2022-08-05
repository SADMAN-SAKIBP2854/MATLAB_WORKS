clc; 
clear all; 
close all;


x = [1, 1, 0, 1, 1]; %first signal
nx = [-2, -1, 0, 1, 2]; %time index of signal x

h = [1, -2, -3, 4]; % second signal
nh = [-3, -2, -1, 0]; % time index of signal h

% now call the function to compute convolution
[y, n] = convolution_sum(nx, x, nh, h); 

%displaying the output signal
stem(n,y, 'Linewidth', 2);



