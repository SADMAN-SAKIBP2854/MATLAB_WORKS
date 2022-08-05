function [y,n] = sigsubstrac(n1, x1, n2, x2)
% In order to add two signals, we need to
% make their length equal by padding zeros otherwise dimension mismatch
% will occur
%n1 = index vector of signal x1
%n2 = index vector of signal x2
%x1 = signal 1
%x2 = signal 2
n = min(min(n1),min(n2)):max(max(n1),max(max(n2))); % Defining the index
%vector for the output signal. For example if n1 = -3:2 and n2 = 0:4
% then n will run from -3 to 4. So we need to define 'n' from the minimum
% of individual minimum of n1 and n2. The same goes for the maximum.
y1 = zeros(1, length(n)); %initializing two vectors to store
y2 = y1; ... the zero padded signals
y1 (((n>=min(n1)) & (n<=max(n1)))) = x1; % The idea is that if min(n1)<=n<=
% max(n1)
y2 (((n>=min(n2)) & (n<=max(n2)))) = x2; ... then y1 = x1(y2=x2).
y = y1-y2;
end
