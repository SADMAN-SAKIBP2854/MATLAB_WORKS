function [Xk, k] = DFT(xn, N)

% computes N point DFT of xn
% Xk = DFT coefficient array over 0<=k<=N-1
% xn = N-point finite duration sequence
% N = length of DFT

n = 0:N-1; % index of data sequence
k = 0:N-1; % index of frequency sample

L = length(xn);
xn = [xn zeros(1, N-L)]; %  zero padding to make xn N point
WN = exp(-1j*2*pi/N); % WN = e^(-j2pi/N);
nk = n'*k; % creates a N x N matrix of nk values
WN_nk = WN.^nk; % Forming the WN_nk matrix given in equation (13)
Xk = xn*WN_nk; % Computes the matrix multiplication in equation (12)

end