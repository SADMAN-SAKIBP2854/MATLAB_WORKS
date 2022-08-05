clc
close all
clear all
x=[6 4 0 3 2];
nx=[-1 0 1 2 3];
h1=[0 1 2 3];
nh1=[-2 -1 0 1];
h2=[5 4 2 -1];
nh2=[-2 -1 0 1];
%For showing {x[n]*h1[n]}
[a1,b1]=convolution_sum(nx, x, nh1, h1);
%For showing {x[n]*h1[n]}*h2[n]
[a2,b2]=convolution_sum(b1, a1, nh2, h2);
%For showing h1[n]*h2[n]
[a3,b3]=convolution_sum(nh1, h1, nh2, h2);
%For showing x[n]*{h1[n]*h2[n]}
[a4,b4]=convolution_sum(b3, a3, nx, x);
subplot(2,1,1)
stem(b2,a2)
subplot(2,1,2)
stem(b4,a4)

