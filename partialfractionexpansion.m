clc;
clear all;
close all;

% Partial fraction expansion of X(z) = (1+2z^-1-z^-2)/(1-z^-1+0.3561z^-2)

num = [1, 2, -1]; % numerator polynomials
den = [1, -1, 0.3561]; % denominator polynomials

[r,p,k] = residuez(num, den)
% calling the residuez function
% r is the resiudes 
% p is the poles
% k is the direct term

