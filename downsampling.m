function [xdown, ndown] = downsampling(x, n, M)

% M downsampling factor
% x input sampled signal
% n is the index vector of original sampled signal

pos = (find(mod(n,M) == 0)); % Finding the position of the index which is 
                                ... the multiple of M
xdown = x(pos);
ndown = n(pos)/M;
end