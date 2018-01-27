function res=distinct(X)
% Function res=distinct(X) returns
%   a matrix with rows containing
%   the distinct values of the rows 
%   of the matrix X.

%  04.2016, Amady Ba
%  amady.sba@gmail.com

res = X(1,1);
for k = 1:size(X,1)
    for l = 1:size(X,2)
        if isempty(find(res(k,:) == X(k,l)))
            res(k,size(res,2)+1) = X(k,l);
        end;
    end;
end;
