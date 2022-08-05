clc;
close all;
clear all;

n = 0:3;
x = n;

[y,m] = sigfold(n,x);


subplot(211)
stem(n,x, 'Linewidth', 3);
xlim([min(min(m),min(n)), max(max(n),max(m))]);
subplot(212)
stem(m,y, 'Linewidth', 3);
xlim([min(min(m),min(n)), max(max(n),max(m))]);