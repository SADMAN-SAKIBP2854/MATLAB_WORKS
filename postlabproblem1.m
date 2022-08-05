clc;
clear all;
close all;

Fo = 75; % Signal Frequency
To = 1/Fo; % Signal Period
Fs1 = 4*Fo; % Sampling Frequency which is greater than Nyquist Rate
Fs2 = 2*Fo; %% Sampling Frequency which is greater to Nyquist Rate
Fs3 = Fo;%%sampling Frequency which is equal to Nyquist rate
Ts1 = 1/Fs1;
Ts2=1/Fs2;
Ts3=1/Fs3;


t = 0:To/100:3*To; % Time axis for continuous signal
xc = 10*cos(120*pi*t)+5*sin(100*pi*t+(30*pi/180))+4*sin(150*pi*t+(45*pi/180)); % continuous signal

t1 = 0:Ts1:3*To; % Sampled time axis
xs1 = 10*cos(120*pi*t1)+5*sin(100*pi*t1+(30*pi/180))+4*sin(150*pi*t1+(45*pi/180)); % Sampled Signal

t2 = 0:Ts2:3*To; % Sampled time axis
xs2 = 10*cos(120*pi*t2)+5*sin(100*pi*t2+(30*pi/180))+4*sin(150*pi*t2+(45*pi/180));


t3 = 0:Ts3:3*To; % Sampled time axis
xs3 = 10*cos(120*pi*t3)+5*sin(100*pi*t3+(30*pi/180))+4*sin(150*pi*t3+(45*pi/180));

subplot(321)
plot(t, xc, 'Linewidth', 2); % plotting continuous-time signal
hold on 
stem(t1, xs1, 'Linewidth', 2); % showing the sampled values in the same plot
subplot(322)
stem(t1, xs1, 'Linewidth', 2); % showing the sampled values in a separate plot

subplot(323)
plot(t, xc, 'Linewidth', 2); % plotting continuous-time signal
hold on 
stem(t2, xs2, 'Linewidth', 2); % showing the sampled values in a same plot
subplot(324)
stem(t2, xs2, 'Linewidth', 2); % showing the sampled values in a same plot


subplot(325)
plot(t, xc, 'Linewidth', 2); % plotting continuous-time signal
hold on 
stem(t3, xs3, 'Linewidth', 2); % showing the sampled values in a same plot
subplot(326)
stem(t3, xs3, 'Linewidth', 2); % showing the sampled values in a separate plot
