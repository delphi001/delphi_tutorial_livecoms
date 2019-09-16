#!/bin/bash               

DELPHI_COMMAND=$DELPHI_EXE

echo ' ' 
echo ' lys5 peptide only'
echo 'run with dipolar bc. periodicity in xy. scale = 0.25'
echo 'salt=0.1' > lys5_025.prm
echo 'scale=0.25' >> lys5_025.prm
echo 'gsize=155' >> lys5_025.prm
echo 'Acenter(0,0,0)' >> lys5_025.prm
echo 'bndcon=2' >> lys5_025.prm
echo 'nonit=800' >> lys5_025.prm
echo 'linit=50' >> lys5_025.prm
echo 'pbx=t' >> lys5_025.prm
echo 'pby=t' >> lys5_025.prm
echo 'relpar=1.0' >> lys5_025.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_025.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_025.prm
echo 'indi=2.0' >> lys5_025.prm
echo 'exdi=80.0' >> lys5_025.prm
echo 'prbrad=1.4' >> lys5_025.prm
echo 'rmsc=0.0001' >> lys5_025.prm
echo 'out(phi,file=phimap_lys5_025.cube,format=cube)' >> lys5_025.prm
echo 'energy(s,c,g)' >> lys5_025.prm
echo 'in(pdb,file="lys5.pdb")' >> lys5_025.prm
echo 'maxwarn=5' >> lys5_025.prm
$DELPHI_COMMAND lys5_025.prm > lys5_025.log

echo 'run with focussing bc.  scale = 0.5'
echo 'salt=0.1' > lys5_05.prm
echo 'scale=0.5' >> lys5_05.prm
echo 'gsize=155' >> lys5_05.prm
echo 'Acenter(0,0,0)' >> lys5_05.prm
echo 'bndcon=3' >> lys5_05.prm
echo 'nonit=800' >> lys5_05.prm
echo 'linit=50' >> lys5_05.prm
echo 'relpar=1.0' >> lys5_05.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_05.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_05.prm
echo 'indi=2.0' >> lys5_05.prm
echo 'exdi=80.0' >> lys5_05.prm
echo 'prbrad=1.4' >> lys5_05.prm
echo 'rmsc=0.0001' >> lys5_05.prm
echo 'in(phi,file=phimap_lys5_025.cube,format=cube)' >> lys5_05.prm
echo 'out(phi,file=phimap_lys5_05.cube,format=cube)' >> lys5_05.prm
echo 'energy(s,c,g)' >> lys5_05.prm
echo 'in(pdb,file="lys5.pdb")' >> lys5_05.prm
echo 'maxwarn=5' >> lys5_05.prm
$DELPHI_COMMAND lys5_05.prm > lys5_05.log

echo 'run with focussing bc.  scale = 1.0'
echo 'salt=0.1' > lys5_1.prm
echo 'scale=1.0' >> lys5_1.prm
echo 'gsize=155' >> lys5_1.prm
echo 'Acenter(0,0,0)' >> lys5_1.prm
echo 'bndcon=3' >> lys5_1.prm
echo 'nonit=800' >> lys5_1.prm
echo 'linit=50' >> lys5_1.prm
echo 'relpar=1.0' >> lys5_1.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_1.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_1.prm
echo 'indi=2.0' >> lys5_1.prm
echo 'exdi=80.0' >> lys5_1.prm
echo 'prbrad=1.4' >> lys5_1.prm
echo 'rmsc=0.0001' >> lys5_1.prm
echo 'in(phi,file=phimap_lys5_05.cube,format=cube)' >> lys5_1.prm
echo 'out(phi,file=phimap_lys5_1.cube,format=cube)' >> lys5_1.prm
echo 'energy(s,c,g)' >> lys5_1.prm
echo 'in(pdb,file="lys5.pdb")' >> lys5_1.prm
echo 'maxwarn=5' >> lys5_1.prm
$DELPHI_COMMAND lys5_1.prm > lys5_1.log


echo 'run with focussing bc.  scale = 2.0'
echo 'salt=0.1' > lys5_2.prm
echo 'scale=2.0' >> lys5_2.prm
echo 'gsize=155' >> lys5_2.prm
echo 'Acenter(0,0,0)' >> lys5_2.prm
echo 'bndcon=3' >> lys5_2.prm
echo 'nonit=800' >> lys5_2.prm
echo 'linit=50' >> lys5_2.prm
echo 'relpar=1.0' >> lys5_2.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_2.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_2.prm
echo 'indi=2.0' >> lys5_2.prm
echo 'exdi=80.0' >> lys5_2.prm
echo 'prbrad=1.4' >> lys5_2.prm
echo 'rmsc=0.0001' >> lys5_2.prm
echo 'in(phi,file=phimap_lys5_1.cube,format=cube)' >> lys5_2.prm
echo 'out(phi,file=phimap_lys5_2.cube,format=cube)' >> lys5_2.prm
echo 'energy(s,c,g)' >> lys5_2.prm
echo 'in(pdb,file="lys5.pdb")' >> lys5_2.prm
echo 'maxwarn=5' >> lys5_2.prm
$DELPHI_COMMAND lys5_2.prm > lys5_2.log



echo ' '
echo ' r4 '

echo ' '
echo ' membrane only '

echo 'run with dipolar bc. periodicity in xy. scale = 0.25'
echo 'salt=0.1' > r4_025.prm
echo 'scale=0.25' >> r4_025.prm
echo 'gsize=155' >> r4_025.prm
echo 'Acenter(0,0,0)' >> r4_025.prm
echo 'bndcon=2' >> r4_025.prm
echo 'nonit=800' >> r4_025.prm
echo 'pbx=t' >> r4_025.prm
echo 'pby=t' >> r4_025.prm
echo 'relpar=0.7' >> r4_025.prm
echo 'in(pdb,file="r4.pdb")' >> r4_025.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> r4_025.prm
echo 'in(crg,file="charmm22.crg")' >> r4_025.prm
echo 'indi=2.0' >> r4_025.prm
echo 'exdi=80.0' >> r4_025.prm
echo 'prbrad=1.4' >> r4_025.prm
echo 'rmsc=0.0001' >> r4_025.prm
echo 'out(phi,file=phimap_r4_025.cube,format=cube)' >> r4_025.prm
echo 'energy(s,c,g)' >> r4_025.prm
echo 'maxwarn=5' >> r4_025.prm
$DELPHI_COMMAND r4_025.prm > r4_025.log


echo 'run with focussing bc. scale = 0.5'
echo 'salt=0.1' > r4_05.prm
echo 'scale=0.5' >> r4_05.prm
echo 'gsize=155' >> r4_05.prm
echo 'Acenter(0,0,0)' >> r4_05.prm
echo 'bndcon=3' >> r4_05.prm
echo 'nonit=800' >> r4_05.prm
echo 'relpar=1.0' >> r4_05.prm
echo 'in(pdb,file="r4.pdb")' >> r4_05.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> r4_05.prm
echo 'in(crg,file="charmm22.crg")' >> r4_05.prm
echo 'indi=2.0' >> r4_05.prm
echo 'exdi=80.0' >> r4_05.prm
echo 'prbrad=1.4' >> r4_05.prm
echo 'rmsc=0.0001' >> r4_05.prm
echo 'in(phi,file=phimap_r4_025.cube,format=cube)' >> r4_05.prm
echo 'out(phi,file=phimap_r4_05.cube,format=cube)' >> r4_05.prm
echo 'energy(s,c,g)' >> r4_05.prm
echo 'maxwarn=5' >> r4_05.prm
$DELPHI_COMMAND r4_05.prm > r4_05.log


echo 'run with focussing bc.  scale = 1.0'
echo 'salt=0.1' > r4_1.prm
echo 'scale=1.0' >> r4_1.prm
echo 'gsize=155' >> r4_1.prm
echo 'Acenter(0,0,0)' >> r4_1.prm
echo 'bndcon=3' >> r4_1.prm
echo 'nonit=800' >> r4_1.prm
echo 'relpar=1.2' >> r4_1.prm
echo 'in(pdb,file="r4.pdb")' >> r4_1.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> r4_1.prm
echo 'in(crg,file="charmm22.crg")' >> r4_1.prm
echo 'indi=2.0' >> r4_1.prm
echo 'exdi=80.0' >> r4_1.prm
echo 'prbrad=1.4' >> r4_1.prm
echo 'rmsc=0.0001' >> r4_1.prm
echo 'in(phi,file=phimap_r4_05.cube,format=cube)' >> r4_1.prm
echo 'out(phi,file=phimap_r4_1.cube,format=cube)' >> r4_1.prm
echo 'energy(s,c,g)' >> r4_1.prm
echo 'maxwarn=5' >> r4_1.prm
$DELPHI_COMMAND r4_1.prm > r4_1.log


echo 'run with focussing bc.  scale = 2.0'
echo 'salt=0.1' > r4_2.prm
echo 'scale=2.0' >> r4_2.prm
echo 'gsize=155' >> r4_2.prm
echo 'Acenter(0,0,0)' >> r4_2.prm
echo 'bndcon=3' >> r4_2.prm
echo 'nonit=800' >> r4_2.prm
echo 'relpar=1.2' >> r4_2.prm
echo 'in(pdb,file="r4.pdb")' >> r4_2.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> r4_2.prm
echo 'in(crg,file="charmm22.crg")' >> r4_2.prm
echo 'indi=2.0' >> r4_2.prm
echo 'exdi=80.0' >> r4_2.prm
echo 'prbrad=1.4' >> r4_2.prm
echo 'rmsc=0.0001' >> r4_2.prm
echo 'in(phi,file=phimap_r4_1.cube,format=cube)' >> r4_2.prm
echo 'out(phi,file=phimap_r4_2.cube,format=cube)' >> r4_2.prm
echo 'energy(s,c,g)' >> r4_2.prm
echo 'maxwarn=5' >> r4_2.prm
$DELPHI_COMMAND r4_2.prm > r4_2.log



echo ' '
echo ' r4 '

echo ' '
echo ' membrane and lys5 peptide '

echo 'run with dipolar bc. periodicity in xy. scale = 0.25'
echo 'salt=0.1' > lys5_r4_025.prm
echo 'scale=0.25' >> lys5_r4_025.prm
echo 'gsize=155' >> lys5_r4_025.prm
echo 'Acenter(0,0,0)' >> lys5_r4_025.prm
echo 'bndcon=2' >> lys5_r4_025.prm
echo 'nonit=800' >> lys5_r4_025.prm
echo 'pbx=t' >> lys5_r4_025.prm
echo 'pby=t' >> lys5_r4_025.prm
echo 'relpar=0.7' >> lys5_r4_025.prm
echo 'in(pdb,file="lys5_r4.pdb")' >> lys5_r4_025.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_r4_025.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_r4_025.prm
echo 'indi=2.0' >> lys5_r4_025.prm
echo 'exdi=80.0' >> lys5_r4_025.prm
echo 'prbrad=1.4' >> lys5_r4_025.prm
echo 'rmsc=0.0001' >> lys5_r4_025.prm
echo 'out(phi,file=phimap_lys5_r4_025.cube,format=cube)' >> lys5_r4_025.prm
echo 'energy(s,c,g)' >> lys5_r4_025.prm
echo 'maxwarn=5' >> lys5_r4_025.prm
$DELPHI_COMMAND lys5_r4_025.prm > lys5_r4_025.log

echo 'run with focussing bc. scale = 0.5'
echo 'salt=0.1' > lys5_r4_05.prm
echo 'scale=0.5' >> lys5_r4_05.prm
echo 'gsize=155' >> lys5_r4_05.prm
echo 'Acenter(0,0,0)' >> lys5_r4_05.prm
echo 'bndcon=3' >> lys5_r4_05.prm
echo 'nonit=800' >> lys5_r4_05.prm
echo 'relpar=1.0' >> lys5_r4_05.prm
echo 'in(pdb,file="lys5_r4.pdb")' >> lys5_r4_05.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_r4_05.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_r4_05.prm
echo 'indi=2.0' >> lys5_r4_05.prm
echo 'exdi=80.0' >> lys5_r4_05.prm
echo 'prbrad=1.4' >> lys5_r4_05.prm
echo 'rmsc=0.0001' >> lys5_r4_05.prm
echo 'in(phi,file=phimap_lys5_r4_025.cube,format=cube)' >> lys5_r4_05.prm
echo 'out(phi,file=phimap_lys5_r4_05.cube,format=cube)' >> lys5_r4_05.prm
echo 'energy(s,c,g)' >> lys5_r4_05.prm
echo 'maxwarn=5' >> lys5_r4_05.prm
$DELPHI_COMMAND lys5_r4_05.prm > lys5_r4_05.log


echo 'run with focussing bc.  scale = 1.0'
echo 'salt=0.1' > lys5_r4_1.prm
echo 'scale=1.0' >> lys5_r4_1.prm
echo 'gsize=155' >> lys5_r4_1.prm
echo 'Acenter(0,0,0)' >> lys5_r4_1.prm
echo 'bndcon=3' >> lys5_r4_1.prm
echo 'nonit=800' >> lys5_r4_1.prm
echo 'relpar=1.2' >> lys5_r4_1.prm
echo 'in(pdb,file="lys5_r4.pdb")' >> lys5_r4_1.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_r4_1.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_r4_1.prm
echo 'indi=2.0' >> lys5_r4_1.prm
echo 'exdi=80.0' >> lys5_r4_1.prm
echo 'prbrad=1.4' >> lys5_r4_1.prm
echo 'rmsc=0.0001' >> lys5_r4_1.prm
echo 'in(phi,file=phimap_lys5_r4_05.cube,format=cube)' >> lys5_r4_1.prm
echo 'out(phi,file=phimap_lys5_r4_1.cube,format=cube)' >> lys5_r4_1.prm
echo 'energy(s,c,g)' >> lys5_r4_1.prm
echo 'maxwarn=5' >> lys5_r4_1.prm
$DELPHI_COMMAND lys5_r4_1.prm > lys5_r4_1.log


echo 'run with focussing bc. scale = 2.0'
echo 'salt=0.1' > lys5_r4_2.prm
echo 'scale=2.0' >> lys5_r4_2.prm
echo 'gsize=155' >> lys5_r4_2.prm
echo 'Acenter(0,0,0)' >> lys5_r4_2.prm
echo 'bndcon=3' >> lys5_r4_2.prm
echo 'nonit=800' >> lys5_r4_2.prm
echo 'relpar=1.2' >> lys5_r4_2.prm
echo 'in(pdb,file="lys5_r4.pdb")' >> lys5_r4_2.prm
echo 'in(siz,file="pcpgps_aminos.siz")' >> lys5_r4_2.prm
echo 'in(crg,file="charmm22.crg")' >> lys5_r4_2.prm
echo 'indi=2.0' >> lys5_r4_2.prm
echo 'exdi=80.0' >> lys5_r4_2.prm
echo 'prbrad=1.4' >> lys5_r4_2.prm
echo 'rmsc=0.0001' >> lys5_r4_2.prm
echo 'in(phi,file=phimap_lys5_r4_1.cube,format=cube)' >> lys5_r4_2.prm
echo 'out(phi,file=phimap_lys5_r4_2.cube,format=cube)' >> lys5_r4_2.prm
echo 'energy(s,c,g)' >> lys5_r4_2.prm
echo 'maxwarn=5' >> lys5_r4_2.prm
$DELPHI_COMMAND lys5_r4_2.prm > lys5_r4_2.log

