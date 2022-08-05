clc;
clear all;
close all;

x = [1, 2, 3, 4];
nx = [0,1,2,3];

[y,ny] = sigfold(x,nx);
subplot(211)
stem(nx,x, 'Linewidth', 2);
xlim([-10,10]);
subplot(212)
stem(ny, y, 'Linewidth', 2);
xlim([-10, 10]);