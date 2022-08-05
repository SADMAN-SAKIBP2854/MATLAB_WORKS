clc;
clear all;
close all;

% verifying distributive law
% x*(h1+h2) = x*h1+x*h2

nx = -2:0; % index for x
x = [1,2,3]; % signal x
nh1 = -3:2; % index for h1
h1 = nh1.^2; % signal h1 = n^2
nh2 = 0:3; % index for h2
h2 = nh2+2; % signal h2 = n+2

% first calculate y = h1+h2 using "sigadd" function
[y, ny] = sigadd(nh1, h1, nh2, h2);

%now calculate z= x*y = x*(h1+h2)
[z,k] = convolution_sum(nx, x, ny, y);

% now we'll calculate x*h1+x*h2
% p1 = x*h1
[p1, np1] = convolution_sum(nx, x, nh1, h1);
% p2 = x*h2
[p2, np2] = convolution_sum(nx, x, nh2, h2);
% finally p = p1+p2 = x*h1+x*h2
[p, np] = sigadd(np1, p1, np2, p2);

%displaying the results to show z = p
subplot(211)
stem(k,z, "Linewidth", 2);
subplot(212)
stem(np, p, "Linewidth", 2);


