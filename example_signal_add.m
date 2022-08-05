clc;
clear all;
close all;


n1 = -2:2;
n2 = -3:1;

x1 = n1; %x1 = 2n1
x2 = n2; %x2 = square(n2)

[y,y1,y2,n] = sigadd(n1,x1,n2,x2); %calling sigadd function to add two signals

%plotting the results
subplot(311)
stem(n,y1);
subplot(312)
stem(n,y2);
subplot(313)
stem(n,y);