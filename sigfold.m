function [y,n] = sigfold(x, m)

% This code will generate y[n] = x[-n]
% The folding operation
% Use fliplr function which flips the elements of an array
n = -fliplr(m); % generating n = -m index
y = fliplr(x);  
end