function res = bp_immigr_var_mt_d(Z)
% function res = bp_immigr_var_mt_d(Z)
%
%   Returns dummy estimator of the immigrantion variance
%
%

%  04.2016, Amady Ba
%  amady.sba@gmail.com

[l,q]=bp_immigr_est(Z(1:3,:));

x = 0:(length(q) - 1);

res = sum(((x - l).^2).*q);
