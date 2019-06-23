
Calculating energy of ‘Saltation’ using the Gaussian module in delphi C++ 

The physiological ionic strength within living cell is 0.15 M. A realistic and more accurate estimate of binding energy upon interaction of two protein chains should ideally take into account this physiological ionic strength by considering the contribution of mobile ions in the water phase (without a definite solute-solvent boundary). To that end, delphi invokes its Gaussian-based smooth dielectric function, which, treats mobile ions via a Boltzmann distribution with an added desolvation penalty.  The effect is known as ‘Saltation’ (Please see for reference, the following paper). 

Jia, Z.; Li, L.; Chakravorty, A.; Alexov, E. Treating Ion Distribution with Gaussian-Based Smooth Dielectric Function in DelPhi. J. Comput. Chem. 2017, 38 (22), 1974–1979.

In this example, we demonstrate how to calculate the ‘energy of saltation’ in case of a protein-protein binding. Take the example of the protein-protein complex, ‘COLICIN E9 Dnase Domain with its Cognate Immunity Protein Im9’ (PDB ID: 1EMV) involving the interaction of two helical (all-α) chains, A and B. Implementing the Gaussian approach, first, the ‘total grid energy’ is to be computed for both the free chains (A, B) as well as the complex (A-B), twice; first, at ‘zero’ salt and then at physiological salt (0.15 M). Let these terms be ∆Gnz_AB, ∆Gnz_A, ∆Gnz_B (for A-B, A and B chains at non-zero salt), ∆Gz_AB, ∆Gz_A, ∆Gz_B (at zero salt). Then, the energy of ‘saltation’ would be: 

∆∆G_saltation  = ∆∆Gsalt_AB - (∆∆Gsalt_A + ∆∆Gsalt_B) 

where, 

∆∆Gsalt_AB  =   ∆Gnz_AB - ∆Gz_AB
∆∆Gsalt_A   =   ∆Gnz_A - ∆Gz_A
∆∆Gsalt_B   =   ∆Gnz_B - ∆Gz_B

How to Run:

Open the bash script ./run.sh in a text editor.
In line 3, locate "DELPHI_COMMAND" and replace its value "_DELPHI_COMMAND_" with the appropriate command to run delphi.

E.g. To run delphi's sequential version, replace "_DELPHI_COMMAND_" with "<absolute/path/of/Delphi/executable>"


Then run the script by typing 
$ ./run.sh


The script runs delphi on six consecutive files to return the following values. 

Salt: Zero
Energy> Total grid energy                             :     63971.15 kT
Energy> Total grid energy                             :     24138.68 kT
Energy> Total grid energy                             :     39785.12 kT
Salt: Non-Zero
Energy> Total grid energy                             :     62767.11 kT
Energy> Total grid energy                             :     23693.72 kT
Energy> Total grid energy                             :     39008.93 kT

delG0_complex (G0_nonzero - G0_zero): -1204.04
delG0_mol1    (G0_nonzero - G0_zero): -444.96
delG0_mol2    (G0_nonzero - G0_zero): -776.19


del_delG_salt: 17.11
