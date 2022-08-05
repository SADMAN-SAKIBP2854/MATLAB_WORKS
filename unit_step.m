function [u, n] = unit_step(n0, n1, n2)

% n0 = the origin
% n1 = starting index number
% n2 = ending index number

n = n1:n2; %defining the index vector

u = (n>=n0); % u[n-n0] = 1 if n>=n0. This implemented here using 
                ... logical indexing
end