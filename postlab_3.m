clc
close all;
clear all;
p=[32,56,44,16,2];
q=[-12,18,-15,3,3];
zplane(p,q);
figure
freqz(p,q,256,512)