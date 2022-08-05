clc
close all
clear all
n=-4:5;
x=[1 1 2 3 5 8 13 21 34 55];
[x1,n1]=sigfold(x, n);
[x2,n2]=sigshift(x1,n1,-3);
[x3,n3]=sigfold(x,n);
[x4,n4]=sigshift(x1,n3,4);
subplot(2,1,1)
stem(n2,x2)
title('x[-n-3]');
subplot(2,1,2)
stem(n4,x4)
title('x[-n+4]');