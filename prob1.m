clc;
clear all;
close all;
n1 = -2:2;
n2 = -3:2;
x1 = n1;
x2 = n2;
subplot(3,1,1)
stem(n1,x1)
subplot(3,1,2)
stem(n2,x2)
subplot(3,1,3)
[y,n]=sigmult(n1,x1,n2,x2);
stem(n,y)