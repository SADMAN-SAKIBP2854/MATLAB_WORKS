clc;
clear all;
close all;

x = [1,2,3];
nx = [1,2,3];
n0 = [-2, -1, 0, 1, 2];

for i = 1:length(n0)
    [y,ny] = sigshift(x, nx, n0(i));
    subplot(211)
    stem(nx, x, 'Linewidth', 2);
    xlim([-3,7]);
    subplot(212)
    stem(ny, y, 'Linewidth', 2);
    xlim([-3,7]);
    pause(2)
end
