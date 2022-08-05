clc;
clear all;
close all;

% We'll sample a signal at a frequency 500 Hz
% xc = 10*cos(200*pi*t)
% Signal Frequency, Fo = 100 and Signal Period, To = 1/100
% Sampling Frequency, Fs = 500 and Sampling Period, Ts = 1/500

Fo = 15; % Signal Frequency
To = 1/Fo; % Signal Period
Fs1 = 5*Fo; % Sampling Frequency which is greater than Nyquist Rate
Fs2 = 1.5*Fo; %% Sampling Frequency which is greater to Nyquist Rate

Ts1 = 1/Fs1;
Ts2=1/Fs2;



tc = 0:To/100:2; % Time axis for continuous signal
xc = 0.5*sin(14*pi*tc)+(1/3)*sin(18*pi*tc)+(1/5)*sin(24*pi*tc)+(1/7)*sin(30*pi*tc); % continuous signal

t1 = 0:Ts1:2; % Sampled time axis
xs1 = 0.5*sin(14*pi*t1)+(1/3)*sin(18*pi*t1)+(1/5)*sin(24*pi*t1)+(1/7)*sin(30*pi*t1); % Sampled Signal

t2 = 0:Ts2:2; % Sampled time axis
xs2 = 0.5*sin(14*pi*t2)+(1/3)*sin(18*pi*t2)+(1/5)*sin(24*pi*t2)+(1/7)*sin(30*pi*t2);

subplot(321)
plot(tc, xc, 'Linewidth', 2); % plotting continuous-time signal
hold on 
stem(t1, xs1, 'Linewidth', 2); % showing the sampled values in the same plot
title("plotting continuous-time signal and showing the sampled values in the same plot")
subplot(322)
stem(t1, xs1, 'Linewidth', 2); % showing the sampled values in a separate plot
title("showing the sampled values in a separate plot")

subplot(323)
plot(tc, xc, 'Linewidth', 2); % plotting continuous-time signal
hold on 
stem(t2, xs2, 'Linewidth', 2); % showing the sampled values in a same plot
title("plotting continuous-time signal and showing the sampled values in the same plot")
subplot(324)
stem(t2, xs2, 'Linewidth', 2); % showing the sampled values in a seperate plot
title("showing the sampled values in a separate plot")

N1=length(t1);
N2=length(t2);
%% Reconstruction of signal by using the sample 1:
% xr(t) = sum over n = 0...., N-1 : x(nT)*sin(pi*(t-nT)/T)/(pi*(t-nT)/T)
% Here sin(pi*(t-nT)/T)/(pi*(t-nT)/T) = sinc((pi*(t-nT))/T)

xr1 = zeros(1, length(tc)); % initialize the reconstructed signal which is the 
							... same length as continuous-time axis
sinc_fun = zeros(N1, length(tc)); % initializing the interpolation function or sinc function

for t = 1:length(tc)
	for n = 0:N1-1
		%sinc_fun(n+1,:) = sin(pi*(tc-n*Ts)/Ts)./(pi*(tc-n*Ts)/Ts); % sinc function. This line is required if you want to visualize the
																	... sinc function. 
		xr1(t) = xr1(t) + xs1(n+1)*sin(pi*(tc(t)-n*Ts1)/Ts1)/(pi*(tc(t)-n*Ts1)/Ts1); % this is the sum of x(nTs)*sinc((t-nT)/T)
																			... from 0 to N-1. As MATLAB doesn't allow 0 indexing
																			... we've taken the index inside the loop from n+1
	end
end


%% plot the results
subplot(325)
plot(tc, xc);
hold on
stem(t1, xs1);
hold on
plot(tc, xr1);
title("Recontruction from sample 1")

%% Reconstruction by using the sample 3:
% xr(t) = sum over n = 0...., N-1 : x(nT)*sin(pi*(t-nT)/T)/(pi*(t-nT)/T)
% Here sin(pi*(t-nT)/T)/(pi*(t-nT)/T) = sinc((pi*(t-nT))/T)

xr2 = zeros(1, length(tc)); % initialize the reconstructed signal which is the 
							... same length as continuous-time axis
sinc_fun = zeros(N2, length(tc)); % initializing the interpolation function or sinc function

for t = 1:length(tc)
	for n = 0:N2-1
		%sinc_fun(n+1,:) = sin(pi*(tc-n*Ts)/Ts)./(pi*(tc-n*Ts)/Ts); % sinc function. This line is required if you want to visualize the
																	... sinc function. 
		xr2(t) = xr2(t) + xs2(n+1)*sin(pi*(tc(t)-n*Ts2)/Ts2)/(pi*(tc(t)-n*Ts2)/Ts2); % this is the sum of x(nTs)*sinc((t-nT)/T)
																			... from 0 to N-1. As MATLAB doesn't allow 0 indexing
																			... we've taken the index inside the loop from n+1
	end
end


%% plot the results
subplot(326)
plot(tc, xc);
hold on
stem(t2, xs2);
hold on
plot(tc, xr2);
title("Recontruction from sample 2")




