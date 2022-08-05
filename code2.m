clc
close all
clear all
n=-10:10
w0=pi/5;
a=0;
phi=0;
A=10;
x=A*exp(a*n).*sin(n*w0+phi)
stem(n,x);
