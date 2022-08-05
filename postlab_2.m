clc
close all;
clear all;
M=[-1,2,-2,1];
N=[-0.1,0.8,-1.7,1];
[z,x,y]=tf2zp(M,N);
zplane(M,N)