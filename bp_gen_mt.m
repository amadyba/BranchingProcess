function res=bp_gen_mt(n,t,Dist,Immigr)
% Function Z = bp_gen_mt(n,t,Dist,Immigr) returns 
%   the vector of parent pointers and the generation level for a 
%   BGW process with more than one trees with same theoretical 
%   distribution.
%
%   INPUT:
%   n - generations
%   t - number of trees
%
%   Dist - Structure of Distribution and parameters
%   Dist.dist - distribution
%   Dist.par1 - parameter1
%   Dist.par2 - parameter2
%   Dist.par3 - parameter3
%
%   Immigr - the structure of immigration parameters
%   Immigr.dist - Immigration distribution
%   Immigr.par1 - Immigration parameter
%   Immigr.par2 - Immigration parameter
%   Immigr.par3 - Immigration parameter
%
%   OUTPUT:
%   Z(1,:) - vector of parent pointers
%   Z(2,:) - generation
%   Z(3,:) - type ot particle (1 - live, 2 - dead, 3-immigrant)
%   Z(4,:) - tree number

%  04.2016, Amady Ba
%  amady.sba@gmail.com

if t == 1
    warning('There is only one tree. Better use gen_bp or gen_bp_immigr!!!');
end;

res  = [];
for T = 1:t
    if nargin == 3
        Z = gen_bp(n,Dist);
    elseif nargin == 4
        Z = gen_bp_immigr(n,Dist,Immigr);
    else
        error('Wrong number of input arguments!!!');
    end;
    Z = [Z' ones(size(Z,2),1)*T]';
    
    res = [res Z];
end;

