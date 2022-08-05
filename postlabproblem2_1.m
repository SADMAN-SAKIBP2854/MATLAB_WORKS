clc;
clear all;
close all;

Fo = 125; % Signal Frequency
To = 1/Fo; % Signal Period
Fs1 = 2000; % Sampling Frequency which is greater than Nyquist Rate
Ts1 = 1/Fs1;


n=-10:10;
tc =0:To/100:3*To; % Time axis for continuous signal
xc = 10*cos(250*pi*tc+(60*pi/180))+5*sin(200*pi*tc+(75*pi/180)); % continuous signal

ts=0:Ts1:3*To;% Time axis for continuous signal
xs = 10*cos(250*pi*ts+(60*pi/180))+5*sin(200*pi*ts+(75*pi/180)); % continuous signal
subplot(321)
plot(tc, xc, 'Linewidth', 2); % plotting continuous-time signal
subplot(322)
stem(ts, xs, 'Linewidth', 2)
title("Sampled signal")

subplot(323)
 % Time axis for continuous signal
xs = 10*cos(250*pi*n*Ts1+(60*pi/180))+5*sin(200*pi*n*Ts1+(75*pi/180));
stem(n, xs, 'Linewidth', 2)
title("Discrete signal")

%% Up-sampling
L=3;            %Scaling factor
[xup, nup] = upsampling(xs, n, L);
subplot(324)
stem(nup,xup, 'Linewidth',2);
title("Up-sampled Signal");

%% Down-sampling
M = 4;
[xdown, ndown] = downsampling(xup,nup,M);
subplot(325)
stem(ndown, xdown, 'Linewidth', 2);
title('Down-sampled Signal/Final Output');

