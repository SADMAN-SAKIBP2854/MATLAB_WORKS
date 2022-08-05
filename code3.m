clc
close all
clear all
n=1:5;
x=n;
subplot(3,1,1)
stem(n,x)
subplot(3,1,2)
[y,n]=sigshift(x,n,3)
stem(n,y)
subplot(3,1,3)
[y,n]=sigfold(x,n)
stem(n,y)