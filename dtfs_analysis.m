function [K, C] = dtfs_analysis(m, n, x)

% m = how many periods of the fourier series coefficient
% are to observed
% n = index vector of x
% x = periodic signal

N = length(x); % Total number of data points
Nc = m*N;  % Total no. of coefficients

if mod(Nc,2)== 0
    k = -Nc/2:Nc/2-1; % Determining the range of ck's
else
    k = -(Nc-1)/2:(Nc-1)/2;
end

C = zeros(1,length(k));       %Initializing the fourier coefficients

for i1 = 1:length(k) % this loop is for computing all the ck's
    for i2 = 1:length(x) % this loop is for the sum in equation (3)
        % ck = 1/N*sum(x[n]exp(-i2*pi*kn/N)) from n = 0 to N-1
        C(i1)= C(i1)+1/N*x(i2)*exp(-i*2*pi*k(i1)*n(i2)/N);
    end
end
K = k;
end