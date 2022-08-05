clc;
clear all;
close all;

Fo = 15; % Signal Frequency
To = 1/Fo; % Signal Period
Fs= 5*Fo; % Sampling Frequency which is greater than Nyquist Rate
Ts= 1/Fs;
tc=0:To/100:To*20;
xc = 0.5*sin(14*pi*tc)+(1/3)*sin(18*pi*tc)+(1/5)*sin(24*pi*tc)+(1/7)*sin(30*pi*tc); % continuous signal
t1=0:Ts:To*20;
xs = 0.5*sin(14*pi*t1)+(1/3)*sin(18*pi*t1)+(1/5)*sin(24*pi*t1)+(1/7)*sin(30*pi*t1); % continuous signal
 
y=interp1(t1,xs,tc);
subplot(221)
plot(tc,xc);
title("ORIGINAL SIGNAL")
subplot(222)
plot(tc,xc);
hold on
stem(t1,xs);
title("signal with sample");
subplot(223)
stem(t1,xs)
title("sample signal")
subplot(224)
plot(tc,y);
title("Reconstructed Signal")