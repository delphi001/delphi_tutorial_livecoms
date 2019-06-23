Finding the potential on a closed surface placed outside of the protein
(SURFPOT module).

This example demonstrates the usage of a new feature in DelPhi that reports the potential on the grid-points that are found to lie on a surface outside of the protein. 

Basically, a surface sought at some distance 'delta' from the vdW surface of any solute is defined by the collection of all the grid-points that lie at a distance 'delta' from the vdW surface. This can also be understood as an extended version of vdW surface of the solute where the radius of each atom has been extended by 'delta'. 

The output from DelPhi is a .zphi file that reports the actual Cartesian-coordinates of the grid-points on the surface and the corresponding potential values (in kT/e) at those points. In the console output of DelPhi, the average of these values are reported. The same average is also mentioned in the first line of the .zphi file as a REMARK. This is an estimation of the corresponding zeta potential.

The user can use the .zphi file information to analyze the collection of potential values and perform various statistical measurements.

For reference, please view the following article:
	Arghya Chakravorty, Zhe Jia, Lin Li, and Emil Alexov, 
	"A New DelPhi Feature for Modeling Electrostatic Potential around Proteins: Role of Bound Ions and Implications for Zeta-Potential", Langmuir 2017 33 (9), 2283-2295


Note: This feature is a development in the C++ version of delphi and absent in the fortran version.

To obtain surface potential from a DelPhi run, the parameter file must contain the following lines

!SU=1 | SU=0 for no surface calculations
SURFPOT=1

!SD=4 (must be > 0 and < 10)
!surface requested at delta=4A from the vdW surface
!SU=1 is necessary
SURFDIST=4


! ZPHI output format outputs the potential on the
! X-Y-Z coordinates of the grid-points lying on the
! surface. The potentials are in kT/e units.
!SU = 1 is necessary.
out(zphi,file="lysozyme_surface.zeta")

How to run:
Check that if you have all the input files: charmm22.crg, lysozyme.pdb, param_sphere_surfpot.prm, sphere.pqr, charmm22.siz, lysozyme.pqr
To run it, type:
<path>/delphi param_protein_surfpot.prm > zeta_protein.log
Output files: lysozyme_surface.zeta
<path>/delphi param_sphere_surfpot.prm > zeta_sphere.log
Output files: sphere_surface.zeta
*Note: <path> is the full path where the delphi executable is located

Even if there is no output option specified in the parameter file when SURFPOT=1, DelPhi reports the Cartesian coordinates and the potential values in a default ‘surfacePot.zphi’ file. A sample zphi file looks like this:

#REMARK IMPORTANT INFORMATION AT THE BOTTOM OF THIS FILE
   -5.1855   17.7125    -7.224        3.10057
   -6.6855   18.2125    -7.224        3.13824
   -6.1855   18.2125    -7.224        3.13575
   -5.6855   18.2125    -7.224        3.12448
   -5.1855   18.2125    -7.224        3.10535
   -4.6855   18.2125    -7.224        3.07987
   -4.1855   18.2125    -7.224        3.04965
   -6.6855   18.7125    -7.224        3.13188
   -6.1855   18.7125    -7.224        3.13029
     .        .          .             .
     .        .          .             .
     .        .          .             .
     .        .          .             .
     .        .          .             .
   -2.6855   13.2125    49.776        2.21192
   -2.1855   13.2125    49.776        2.21186
   -1.6855   13.2125    49.776        2.20767
   -1.1855   13.2125    49.776        2.19958
   -3.1855   13.7125    49.776        2.18826
   -2.6855   13.7125    49.776        2.19174
   -2.1855   13.7125    49.776        2.19108
# -------------------------------------------------------
#REMARK SIMPLE AVERAGE SURFACE POTENTIAL      = 2.78699 kT/e
#REMARK GEOMETRIC CENTER (ANG)                = -0.1855  14.7125  21.276


A user, for instance, could perform a density estimation of the potential values and get a weighted average. From a charged sphere, the potentials are averaged after density estimations and are shown to be very similar (almost identical) to the analytical solution of coulomb's law for various distances from the surface.

Visualization:

A VMD script is provided at our website which can be sourced and used to view the distribution of potential around the solute. Please refer to the docx / pdf version of the README for more details and the graphics.


