clc;
clear all;
close all;

n = -20:20; %defining the time index vector
x = sin(pi/5*n); %the signal

z = xcorr(x); %auto-correlation of x
index = min(n)+min(n):max(n)+max(n); %corresponding time index vector of z
plot(index, z/max(z), 'Linewidth', 3); % showing normalized output
