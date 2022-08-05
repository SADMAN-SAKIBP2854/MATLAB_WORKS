clc;
clear all;
close all;

%In this code we'll show a sinusoidal function 
% of the form x[n] = A*exp(-a*n)*sin(w0*n+phi)
n = -20:20; %defining the index variable
w0 = pi/10; %angular frequency of the sinusoid
a = 0; %damping factor
phi = pi/4; %phase in radian
A = 10; %amplitude
x = A*exp(-a*n).*sin(w0*n+phi); %Look at the elementwise operation!!

stem(n,x); %plotting the output