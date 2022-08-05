clc;
clear all;
close all;


[x,n] = unit_impulse(1,-3,2); %calling unit_impulse function 
stem(n,x); %displaying the output
