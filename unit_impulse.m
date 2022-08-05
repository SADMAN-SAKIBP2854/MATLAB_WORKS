function [x,n] = unit_impulse(n0, n1, n2)

% Generates x[n] = delta(n-n0) 
% n1<=n<=n2 
% n0 is the origin of the unit impulse function
% We'll use logical index concept here to compute 
% unit impulse

n = n1:n2; % defining the index vector n

x = (n==n0);

end