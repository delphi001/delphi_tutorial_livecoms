Calculating the Solvation energy of a charged sphere (also output as the "corrected reaction field energy" by delphi)
In this particular example the charge of the sphere is set as +1 eu and the radius is set as 3 Angstroms.
Using the analytical expression (Born formula) the solvation energy is:

delG = (-K * q^2 / 2R) (1/e_int - 1/e_ext) = -92.33 kT  
where q=1 is the charge of the sphere, R=3 is its radius, e_int=1 and e_ext=80 are the internal and external dielectric constant(s).
And K=561 is the conversion factor to convert delG to kT units. 

How to run:
Check that you have all the input files: born.pdb, born.crg, born.siz, param_charged_sphere.prm

To run it, type: 
<path>/delphi param_charged_sphere.prm > charged_sphere.log
Press enter key, and you should get the results.
*Note: <path> is the full path where the delphi executable is located.

Details of the run: 
This example is used to calculate the electrostatic component of solvation energy of the simplest system: a charged sphere.
born.pdb is the file which contains the coordinate information of a charged sphere. born.crg and born.siz files contain the charge and size information, respectively.
After the run, in log file you will see:

Energy > Corrected reaction field energy               :       -92.50 kT

Where “Corrected reaction field energy” is the electrostatic component of solvation energy for this charged sphere.   
Note that Coulombic energy is zero since there is only one charge and no charge-charge interactions. 

