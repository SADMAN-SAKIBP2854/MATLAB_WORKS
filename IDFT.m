function [xn, n] = IDFT(Xk, N)

% computes Inverse DFT from Xk
% Xk = DFT coefficient array over 0<=k<=N-1
% xn = N-point finite duration sequence over 0<=n<=N-1
% N = length of DFT

n = 0:N-1; % row vector for n
k = 0:N-1; % row vector for k

WN = exp(-1j*2*pi/N); % WN = e^(-j2pi/N);
nk = n'*k; % creates a N x N matrix of nk values
WN_nk = WN.^(-nk); % IDFT Matrix 
xn = (Xk*WN_nk)/N; % Computes the matrix multiplication in equation (12)

end