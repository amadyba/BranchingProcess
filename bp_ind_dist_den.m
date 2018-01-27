function res=bp_ind_dist_den(Pk,p_h,Th_add,cell_opt)
% bp_ind_dist_den(Pk,p_h,cell_opt)
%   returns pdf of the transforned individual distributions
%   with the noermal asumption
%
%   Pk is the theoretical probability
%   p_h is the observed probability
%   Th_add not used   
%   cell_opt is cell array of parameters see wlte
%       cell_opt{1,:} are trees
%  

%  04.2016, Amady Ba
%  amady.sba@gmail.com

Z = cell_opt{1,cell_opt{2,1}};

P = bp_count_popul(Z);
ft = sum(P(1:length(P)-1));

st_n = p_h - Pk;
st_d = (1-Pk).*Pk;
res = (ft * (st_n.^2 / st_d ))/2;
