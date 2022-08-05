close all;
clear all;
clc;

n=-10:10; % index vector of original signal
x=sin(0.7*n); % original samples
subplot(311),
stem(n,x, 'Linewidth', 2);
title('Original Signal')

%% Up-sampling
L=5;            %Scaling factor
[xup, nup] = upsampling(x, n, L);
subplot(312)
stem(nup,xup, 'Linewidth',2);
title(['Up-sampled Signal by ',num2str(L)]);

%% Down-sampling
M = 3;
[xdown, ndown] = downsampling(x,n,M);
subplot(313)
stem(ndown, xdown, 'Linewidth', 2);
title(['Down-sampled Signal by ',num2str(M)]);















