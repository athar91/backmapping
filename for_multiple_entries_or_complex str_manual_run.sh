./initram.sh -f CG_posre.gro -o aa_opls.gro -to charmm36 -p topol.top ##(without lig info, ligand canbe added later stage, remember topol file here is generated from AA structure) 
#update backmapped.top, update info there, add lig here, in backmapped.top 
#FOR Protein only, no need to run any further commands 
cp ~/Downloads/backmap/WORKED/*.mdp . #needs previous .mdp files
sed -i "s/;1K8/1K8/g" backmapped.top #add ligand name in new .top file
gmx_mpi grompp -f 1-EM.mdp -c 0-backward.gro -n backmapped.ndx -p backmapped.top -o 1-EM -maxwarn 2 
gmx_mpi mdrun -deffnm 1-EM -v -nt 0 
gmx_mpi grompp -f 2-EM.mdp -c 1-EM.gro -n backmapped.ndx -p backmapped.top -o 2-EM -maxwarn 2 
gmx_mpi mdrun -deffnm 2-EM -v -nt 0 
gmx_mpi grompp -f 3-mdpr-0.0002.mdp -c 2-EM.gro -r 0-backward.gro -p backmapped.top -o 3-mdpr-0.0002 -maxwarn 2 
gmx_mpi mdrun -deffnm 3-mdpr-0.0002 -v -nt 0 
gmx_mpi grompp -f 4-mdpr-0.0005.mdp -c 3-mdpr-0.0002.gro -r 0-backward.gro -p backmapped.top -o 4-mdpr-0.0005 -maxwarn 2 
gmx_mpi mdrun -deffnm 4-mdpr-0.0005 -v -nt 0 
gmx_mpi grompp -f 5-mdpr-0.001.mdp -c 4-mdpr-0.0005.gro -r 0-backward.gro -p backmapped.top -o 5-mdpr-0.001 -maxwarn 2 
gmx_mpi mdrun -deffnm 5-mdpr-0.001 -v -nt 0 
gmx_mpi grompp -f 6-mdpr-0.002.mdp -c 5-mdpr-0.001.gro -r 0-backward.gro -p backmapped.top -o 6-mdpr-0.002 -maxwarn 2 
gmx_mpi mdrun -deffnm 6-mdpr-0.002 -v -nt 0 
