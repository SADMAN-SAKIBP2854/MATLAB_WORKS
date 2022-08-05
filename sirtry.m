clc;
clear all;
close all;
x = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55];
nx = [-4,-3,-2,-1, 0,1,2,3,4,5];
[z,p] = sigfold(x,nx);
[y,n] = sigshift(z,p,3)
subplot(311)
stem(x,nx, 'Linewidth', 2);
xlim([-20,20]);
subplot(312)
stem(z, p, 'Linewidth', 2);
xlim([-20, 20]);
subplot(313)
stem(y,n, 'Linewidth', 2)