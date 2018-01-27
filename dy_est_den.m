function res=dy_est_den(x,l,th_add,C)
% res=dy_est_den(x,l,th_add,Cell)
%   calculates the minnul log of the density function for the robust estimator 
%   based on the Dion & Yanev estimator of the immigration mean
%   
%   The inputs are
%       x - observed value
%       l - the estimated marameter
%       th_add - additional parameters
%           th_add(1) - the offspring mean
%           th_add(2) - the offspring variance
%           th_add(3) - immigration variance
%       C - cell array of additional parameters
%            C{1,k}.l = lamda_t(n) = x(C{2,1});
%            C{1,k}.n = n;
%            C{1,k}.t = t;
%            C{2,1} = index of current observation

%  04.2016, Amady Ba
%  amady.sba@gmail.com

m = th_add(1);
s = th_add(2);
b = th_add(3);

n = C{1,C{2,1}}.n;
t = C{1,C{2,1}}.t;

if m > 1
    res = -log(normpdf(sqrt(n*m^t)*(x-l),0,l));
elseif m == 1
    res = -log(normpdf(sqrt(n/t)*(x-l),0,l*s));
else
    res = -log(normpdf(sqrt(n)*(x-l),0,(l*s)/(m*(m-1)) + b ));
end;
