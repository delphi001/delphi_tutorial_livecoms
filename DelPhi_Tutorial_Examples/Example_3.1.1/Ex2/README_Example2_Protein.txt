Calculating the total electrostatic energy of a protein (at Zero salt concentration) and the electrostatic potential map

How to run:
Check that you have all the input files: 1brs.pdb, amber.crg, amber.siz, param_protein.prm

To run it, type: 
<path>/delphi param_protein.prm > protein.log
Press enter key, you should get the results.
Output files: phimap.cube (the electrostatic potential map)
*Note: <path> is the full path where the delphi executable is located

Details of the run: 
This example is used to calculate total electrostatic energy of a protein (at Zero salt concentration) and the electrostatic potential map. 
For other molecules such as DNA, RNA, etc, the method is similar.
1brs.pdb is the file containing atomic coordinates of the protein 'barnase'. 
amber.crg and amber.siz files contain the charge and size information, respectively.
After the run, in log file you will see the result shown as below:

 Energy> Corrected reaction field energy               :     -1005.07 kT
 Energy> Coulombic energy                              :    -28450.24 kT
 Energy> All required energy terms but grid energy     :    -29455.31 kT

The "Corrected reaction field energy" is the electrostatic component of solvation energy; 
"Coulambic energy" is the coulambic interaction energy between charged atoms in homoginious medium with an internal dielectric constant of indi
In this particular instance, indi is set as 2.0
"All required energy terms but grid energy" is the sum of the above two energy terms and represents the total electrostatic energy of the protein. 

The electrostatic potential map output file (phimap.cube) may be used to various visualization purposes by graphical interfaces such as Chimera, VMD, Pymol etc.

