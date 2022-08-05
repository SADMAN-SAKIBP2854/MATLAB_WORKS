clc
close all;
clear all;


x=[1,1,0,0,1];
N=5000;

%%Strating
[X,k]=DFT(x,N);
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
[xn,n]=IDFT(X,N);
figure(2)
stem(n,real(xn),"Linewidth",2); %%Showing only the real part of idft