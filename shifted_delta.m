clc;
clear all;
close all;

[x1, n] = unit_impulse(1, -1, 6);
[x2, n] = unit_impulse(5, -3, 6);

x = x1+3*x2;
stem(n,x, 'Linewidth', 3);