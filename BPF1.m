t0=0.2;
ts=0.001;
fc=250;
fs=1/ts;
N=1024;

%% creating a LOw pass filter
fcut = 200; % cut-off frequency of the low pass filter
ncut = floor(fcut*fs/N); % index vector for filter upto cut-off frequency
H = zeros(1,N); % Filter vector
H(ncut+1:2*ncut) = 1*ones(1,ncut); % Other portion of the low pass filter

plot(H,'Linewidth',2)