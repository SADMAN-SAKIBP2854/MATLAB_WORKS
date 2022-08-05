clc
close all;
clear all;
nx=-1:3;
x=[0 1 2 1 1];
ny=-1:3;
y=[3 5 8 13 21]

[y1,ny1]=sigfold(y,ny);
[rxy1,nxy1]=convolution_sum(nx, x, ny1, y1);
subplot(2,1,1)
stem(nxy1,rxy1)
title("x[k]*y[-k]")

[x,nx]=sigfold(x,nx);
[rxy2,nxy2]=convolution_sum(nx,x,ny,y);
subplot(2,1,2)
stem(nxy2,rxy2)
title("y[k]*x[-k]")

