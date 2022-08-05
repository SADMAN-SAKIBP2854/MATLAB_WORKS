clc;
clear all;
close all;

%Linear System & Non Linear system demonstration

n = 0:9; %index vector
x1 = n+2; %input signal 1
x2 = n; %input signal 2
%output of system1 & system2 defined by functions "system1" and "system2"
% we're assuming x1 and x2 are of the same length for avoiding complexity
[y1, n1] = system1(2*x1, n);
[y2,n2] = system1(3*x2,n);
[y3,n3] = system1(2*x1+3*x2,n);

subplot(211)
stem(n1, y1+y2, 'Linewidth', 3);
title("Superposition of the individual outputs");
subplot(212)
stem(n3, y3, 'Linewidth', 3);
title("Output of the superposition of the inputs");

