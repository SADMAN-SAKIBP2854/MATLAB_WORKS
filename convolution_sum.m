function [y,k] = convolution_sum(nx, x, nh, h)

% input to the function
% nx is the index vector of x
% x is the first signal (input signal)
% nh is the index vector y
% h is the second signal (impulse response)

% output to the function
% y is the convoluted output signal
% k is the index vector of y

kmin = min(nx)+min(nh); % lowest time index of the convolution sum
                        ... is the sum of the lowest time indices of the two
                        ... signals to be convolved.
kmax = max(nx)+max(nh); % same as the kmin

k = kmin:kmax; % index vector k
y = conv(x,h); % convolution of x and h
end