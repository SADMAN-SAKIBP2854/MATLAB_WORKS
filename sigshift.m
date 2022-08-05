function [y,n] = sigshift(x,n1,n0)
%We'll generate y[n] = x[n-n0]

n = n1+n0; %new index
y = x; % Here only the index will change, not the actual signal's value

end