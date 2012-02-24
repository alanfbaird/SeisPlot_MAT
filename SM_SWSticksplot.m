
test=SM_import_ec_cell(fname);
fign=SM_SWSticks(test(2:end-1,2:end-1,zlevel),[savename num2str(test(1,1,zlevel).z) '.SWSticks.eps']);