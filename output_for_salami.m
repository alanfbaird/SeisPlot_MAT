interfacefile='/Users/alanbaird/Documents/Work/Seismodel-Chinook/Seismodel-Geomech/Chinook/chnk_move_HP/topres.mat'
load(interfacefile);

ind=uint8(out);









cd /Users/alanbaird/Documents/Work/Seismodel-Chinook/Seismodel-Output/Chinook/chnk_move_HP/


fname='chnk_move_HP_explicit_seismic_bsp.1.out'
savename='bsp1'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);


fname='chnk_move_HP_explicit_seismic_bsp.3.out'
savename='bsp3'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_move_HP_explicit_seismic_bsp.6.out'
savename='bsp6'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);



close all
cd /Users/alanbaird/Documents/Work/Seismodel-Chinook/Seismodel-Output/Chinook/chnk_move_LP/

xslice=710000; yslice=6063600; zslice=-2400;
fname='chnk_move_LP_explicit_seismic_bsp.1.out'
savename='bsp1'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_move_LP_explicit_seismic_bsp.3.out'
savename='bsp3'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_move_LP_explicit_seismic_bsp.6.out'
savename='bsp6'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);




close all

cd /Users/alanbaird/Documents/Work/Seismodel-Chinook/Seismodel-Output/Chinook/chnk_nomove_HP/

fname='chnk_nomove_HP_explicit_seismic_bsp.1.out'
savename='bsp1'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_nomove_HP_explicit_seismic_bsp.3.out'
savename='bsp3'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_nomove_HP_explicit_seismic_bsp.6.out'
savename='bsp6'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);



close all

cd /Users/alanbaird/Documents/Work/Seismodel-Chinook/Seismodel-Output/Chinook/chnk_nomove_LP/


fname='chnk_nomove_LP_explicit_seismic_bsp.1.out'
savename='bsp1'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_nomove_LP_explicit_seismic_bsp.3.out'
savename='bsp3'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);
fname='chnk_nomove_LP_explicit_seismic_bsp.6.out'
savename='bsp6'
test=SM_import_ec_cell(fname);
[top,bot]=SM_array_top_bot(test(2:end-1,2:end-1,:),ind);
SM_salami_out([savename 'salami_in.txt'],top,bot);


