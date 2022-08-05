clc;
clear all;
close all;

x1 = [1, 2,4];
n1 = [-1,0,1];
x2 = [2,3,4,5,6,7];
n2 = [-3,-2,-1,0,1,2];

[y,n] = sigadd(n1, x1, n2, x2);

subplot(311)
stem(n1, x1, 'Linewidth',2);
subplot(312)
stem(n2,x2, 'Linewidth', 2);
subplot(313)
stem(n,y, 'Linewidth', 2);