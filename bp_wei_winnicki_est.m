function [m,l] = bp_wei_winnicki_est(Z)
%function [m,l] = bp_wei_winnicki_est(Z)
%   returns the estimates of the  offspreng and immigrantion mean for the process Z
%
%   The output is
%   m - the offspring mean
%       m(t) = Wei-Winnicki estimator using t generations
%   l - the immigrantion mean
%       l(t) = Wei-Winnicki estimator using t generations
%
%    The process Z is generated by gen_bp
%   Z(1,:) - vector of parent pointers
%   Z(2,:) - generation
%   Z(3,:) - type ot particle (1 - live, 2 - dead, 3 - immigrant)

%  04.2016, Amady Ba
%  amady.sba@gmail.com

Y = bp_count_popul(Z); % number of particles in each generation

gen = max(Z(2,:)); % max numbes of generations

m=[];
l=[];
for t=2:gen
    if abs ((sum( Y(1:t-1) + 1 ) * sum( (Y(1,t-1) + 1).^(-1) ) ) - t^2) > 1e-8
        m(t) = ( sum(Y(2:t)) * sum( (Y(1:t-1) + 1).^(-1) ) - t * sum( Y(2:t).*((Y(1:t-1) +1).^(-1)) ) )/( (sum( Y(1:t-1) + 1 ) * sum( (Y(1,t-1) + 1).^(-1) ) ) - t^2 );
        l(t) = (sum( Y(1:t-1) ) .* sum( Y(2:t) .* ( Y(1:t-1) + 1).^(-1) ) - sum( Y(2:t) ) .* sum( Y(2:t) .* (Y(1:t-1) + 1).^(-1) )) / ( (sum( Y(1:t-1) + 1 ) * sum( (Y(1,t-1) + 1).^(-1) ) ) - t^2 );
    else
        m(t) = 0;
        l(t) = 0;
    end;
end;


