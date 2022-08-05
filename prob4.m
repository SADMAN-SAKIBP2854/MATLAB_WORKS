clc
close all;
clear all;

m=-4:5;
x=[1 1 2 3 5 8 13 21 34 55];
subplot(4,1,1)
stem(m,x)
title("Main signal")

subplot(4,1,2);
[y,n]=sigfold(x,m);
stem(n,y);
title("1st Signal after folding")


subplot(4,1,3);
[z,p]=sigshift(y,n,-3);
stem(p,z);
title("1st Signal after shifting/x[-n-3]")


subplot(4,1,4);
[x1,n1]=sigshift(y,n,4);
stem(n1,x1);
title("2nd Signal after shifting/x[-n+4]")



