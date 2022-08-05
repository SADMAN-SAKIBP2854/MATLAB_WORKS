clc
close all
clear all
x=[1, 1, 2, 3, 5, 8, 13];
N=7
k=0:N-1
%% For seeing autocorrelation directly 
% z=xcorr(x);
% index=min(nx)+min(nx):max(nx)+max(nx);
% plot(index,z/max(z));


%%Strating
X=fft(x,N);
MagX=abs(X);  %Magnitude Spectrum
PhaseX=angle(X)*180/pi;  %Angle in degree
figure(1)
subplot(2,1,1)
stem(k,MagX,'Linewidth',2);
xlabel("k");
ylabel("Magnitude");
subplot(2,1,2) 
stem(k,PhaseX,'Linewidth',2); 
xlabel("k");
ylabel("Phase Spectrum");


%%IDFT to obtain the orginal signal from its DFT
xn=ifft(X,N);
figure(2)
stem(k,real(xn),"Linewidth",2); %%Showing only the real part of idft