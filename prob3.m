clc
close all;
clear all;
n=0:10;
x1=n+cos(pi/2);
x2=n;
[y1,n1]=system2(2*x1,n);
[y2,n2]=system2(3*x2,n);
[y3,n3]=system2(2*x1+3*x2,n);
subplot(2,1,1)
stem(n1,y1+y2)
title("superposition of individual output");
subplot(2,1,2)
stem(n3,y3)
title("output of the superposition of the inputs");


