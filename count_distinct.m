function [R,C] = count_distinct(X)
% function [R,C] = count_distinct(X)
%   returns the distinct values of the 
%   vector X in R and the counted frequences 
%   in C.

%  04.2016, Amady Ba
%  amady.sba@gmail.com


if size(X,1) > 1
    error('X must be a vector.');
end;
if nargout < 2
    error('Wrong number of output parameters.');
end;

R = distinct(X);
C = [];
for k = 1:size(R,2)
    C(k) = length(find(X == R(k)));
end;
