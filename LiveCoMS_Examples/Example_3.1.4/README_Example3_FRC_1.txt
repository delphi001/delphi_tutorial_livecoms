This example shows how to use 'FRC' Option to calculate the electrostatic potential, energy of interaction, force between two sets of atoms.
In the parameter file we need to add command 'site(arguement)', specially in this case site(a, p, f).
Two sets of pdb files are required in this case, one is my.pdb which contains coordinates of all atoms and another one is my1.pdb which contains the atoms specified in frc file where potential is calculated.

Once you have the input files: crg, siz, my1.pdb ,my.pdb and param.txt to run it type:
<path>/delphi param.txt

After the run we can get the result in 'my.frc'
