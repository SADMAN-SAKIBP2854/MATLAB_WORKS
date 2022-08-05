clc
close all
clear all


Cm=0:200;
x=cos((2/10)*pi*Cm)+(5/10)*cos((6/10)*pi*Cm);
[x1,Cm]=sigshift(x,Cm,20);
y=x+(1/10)*x1;
z=xcorr(x,y);
K=min(Cm)+min(Cm):max(Cm)+max(Cm);
plot(K,z/max(z),'Linewidth',3)