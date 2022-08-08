# githubtest
###Backmapping commands from coarse grain to AA topology######################### 

you should deactivate conda in order to make use of the right version of python 

copy both script and Mapping folder into the file where CG to AA 	conversion has to make	 

Make a .top file using pdb2gmx command using gmx (already made 	crystalstr/Aligned_onto_prev/) 

source the correct gmx in .sh file 

protein can be directly converted, but issues with ligand. 

cp .map file from AA simulation (check 7 may ppt for details), 	add name in .map, .top and update molecule name (for projected dont use molecule name in the end of topol.top) 