Example demonstrating the use of the 'focusing' method to calculate electrostatic potential and electric field for a particular region with high precision (scale=4) with a reduced computational time.

This is an alternative way to the previous example (example 3) where the potential and electric field were calculated in a single run at modest precision (scale=2). 

Improving the precision (scale=4) in a single run (as in example 3) would require much larger grid size resulting in large computational time.

To overcome the large computational cost and at the same time to ensure the desired precision, here we present the 'focusing' method which require two runs.

The first run would be course-grain (scale=1) while the second would be fine-grain (scale=4) implementing the 'focusing' technique.

For convenince, we keep the same test example inputs as example 3(frc_2) (barnase and ASP39 of barstar in complex with barnase). 

How to run:
Check that if you have all the input files: barnase.pdb, amber.crg, amber.siz, param_phimap1.prm, param_phimap2_focus.txt, frc_in.pdb

To run it, type: 
Run1: 
$DELPHI_EXE param_phimap1.prm > focusing1.log
This will output phimap1.cube which is then read by the second parameter file (param_phimap2_focus.prm)
Run2: 
$DELPHI_EXE param_phimap2_focus.prm > focusing2.log
Output files: frc.out
*Note: $DELPHI_EXE is the full path where the delphi executable is located

Details after the run: 

The focusing method is usually used for large systems. Here for simplicity, we just use the focusing method in a regular sized system, which is a barnase and a residue from barstar. Using focusing method you need a parent run (Run 1) and a child run (Run 2). The parent run is used to calculate a big system in a relatively low resolution and then output the potential map. The child run will take the potential map from the parent run as input and obtain boundary conditions from it. Then the child run uses higher resolution to generate more accurate potentials and fields in a smaller region. This focusing is very useful when the entire system is very big but the region of interest is only a small part of the whole system.
 
In the parent run, we need to output a potential map using the lines below. In this example, the potential map is phimap1.cube, with a resolution of scale=1.0.
scale=1.0
out(phi,file="phimap1.cube",format=cube)

The child run reads the phimap1.cube and outputs phimap2.cube. The resolution of the child run is higher than in the parent run (scale=4.0) and the calculation box is smaller; the acenter option is used to indicate where is the center of the child box; the boundary condition is set as 3 to indicate the boundary values are calculated based on the input phimap1.cube; an frc option is used to calculate the potential and field on a residue from barstar. 

scale=4.0
gsize=65
in(phi,file="phimap1.cube",format=cube)
acent(29.3265,39.6727,8.45517)
bndcon=3
in(frc,file="frc_in.pdb")
out(frc,file=frc.out)
site(a,p,f)

The results in frc.out are shown below:
ATOM DESCRIPTOR       GRID PT.    GRID FIELDS: (Ex, Ey, Ez)
N    ASP   39           4.1756    0.6405   -0.3778   -0.3490                    
CA   ASP   39           4.8222    0.4604   -0.5575   -0.2597                    
C    ASP   39           4.2671    0.4711   -0.7224   -0.1193                    
O    ASP   39           4.8549    0.5076   -0.7876   -0.0760                    
CB   ASP   39           4.9746    0.3860   -0.4938   -0.1966                    
CG   ASP   39           6.1325    0.6179   -0.8084   -0.8741                    
OD1  ASP   39           7.6227    0.2540   -0.7568   -1.7999                    
OD2  ASP   39           5.6482    1.6908   -1.3951   -0.6391                    
H    ASP   39           4.1805    0.8720   -0.2338   -0.2283                    
HA   ASP   39           5.5355    0.3913   -0.6681   -0.3523                    
HB3  ASP   39           4.3396    0.5483   -0.5301    0.0870                    
HB2  ASP   39           5.1324    0.0829   -0.2063   -0.0216  
total energy = -3.39614 kt



