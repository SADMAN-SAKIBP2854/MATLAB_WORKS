clc
close all;
clear all;
n=-20:25;
x=(n==0);
h=zeros(1,length(n));
for i=3:length(n)
    h(i)=x(i)-x(i-1)+4*h(i-1)-4*h(i-2);
end
subplot(2,1,1)
stem(n,h)
title('Differential EQ')

n1= -20:25;
a=[1 -4 4];
b=[1 -1];
x=(n1==0);
h=filter(b,a,x);
subplot(2,1,2)
stem(n1,h)
title('FILTER')