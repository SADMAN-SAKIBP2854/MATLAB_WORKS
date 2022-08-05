clc;
close all;
clear all;


% First we'll sample the signal at a higher rate than 
% Nyquist Rate
% xc(t) = 5*cos(200*pi*t)
% Signal Frequency, Fo = 100 and period, To = 1/100
% Sampling Frequency, Fs = 800 and period, Ts = 1/800

Fo = 100; % signal frequency
To = 1/Fo; % signal period
Fs = 800; % sampling frequency
Ts = 1/Fs; % sampling period

tc = 0:To/100:3*To; % defining time axis for xc upto 3 cycles
xc = 5*cos(200*pi*tc); % constructing the continuous-time signal

ts = 0:Ts:3*To; % sampled the time axis a rate Fs
xs = 5*cos(200*pi*ts); % sampled signal at a frequency Fs
N = length(ts); % number of samples

%% Reconstruction by using the formula:
% xr(t) = sum over n = 0...., N-1 : x(nT)*sin(pi*(t-nT)/T)/(pi*(t-nT)/T)
% Here sin(pi*(t-nT)/T)/(pi*(t-nT)/T) = sinc((pi*(t-nT))/T)

xr = zeros(1, length(tc)); % initialize the reconstructed signal which is the 
							... same length as continuous-time axis
sinc_fun = zeros(N, length(tc)); % initializing the interpolation function or sinc function

for t = 1:length(tc)
	for n = 0:N-1
		%sinc_fun(n+1,:) = sin(pi*(tc-n*Ts)/Ts)./(pi*(tc-n*Ts)/Ts); % sinc function. This line is required if you want to visualize the
																	... sinc function. 
		xr(t) = xr(t) + xs(n+1)*sin(pi*(tc(t)-n*Ts)/Ts)/(pi*(tc(t)-n*Ts)/Ts); % this is the sum of x(nTs)*sinc((t-nT)/T)
																			... from 0 to N-1. As MATLAB doesn't allow 0 indexing
																			... we've taken the index inside the loop from n+1
	end
end


%% plot the results

plot(tc, xc);
hold on
stem(ts, xs);
hold on
plot(tc, xr);

%% Reconstruction Process Visualization

% This portion is not mandatory for reconstructing a signal
% This is just for visualization purpose
% To run this segment, you must uncomment the sinc_fun line

% figure(2)
% hold on
% grid on
% plot(tc, xs.'.*sinc_fun);
% stem(ts, xs);
% title('Reconstruction Process');
% xlabel('Time(s)');
% ylabel('Amplitude');
