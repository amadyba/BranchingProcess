D.dist = 'poiss';
D.par1 = 1.1;

D

I.dist = 'poiss';
I.par1 = 1.1;

I

Z = gen_bp_immigr(10,D,I);
Zm = bp_gen_mt(10,10,D,I);

%bp_treeplot(Z);
bp_count_childs(Z)

bp_count_popul(Z)

%bgwi2bgwr(Z)

bp_harris_est(Z)

bp_harris_est_mt(Zm)

bp_heyde_seneta_est(Z)

bp_immigr_dy_est(Z, 1)

bp_immigr_est(Z)

bp_immigr_var_mt_d(Z)

bp_ind_dist(Z)

bp_ind_dist_mt(Zm)

bp_ind_var(Z,1)

bp_ln_est(Z)

bp_ln_est_mt(Zm)

[l,m] = bp_wei_winnicki_est(Z)