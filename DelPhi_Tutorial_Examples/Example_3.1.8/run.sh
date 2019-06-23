#!/bin/bash

DELPHI_COMMAND=$DELPHI_EXE

$DELPHI_COMMAND param_gauss_salt_1_zero.prm > log1z
$DELPHI_COMMAND param_gauss_salt_2_zero.prm > log2z
$DELPHI_COMMAND param_gauss_salt_3_zero.prm > log3z

$DELPHI_COMMAND param_gauss_salt_1_nonzero.prm > log1nz
$DELPHI_COMMAND param_gauss_salt_2_nonzero.prm > log2nz
$DELPHI_COMMAND param_gauss_salt_3_nonzero.prm > log3nz

echo "Salt: Zero"

grep "Total grid energy" log1z
grep "Total grid energy" log2z
grep "Total grid energy" log3z

echo "Salt: Non-Zero"
grep "Total grid energy" log1nz
grep "Total grid energy" log2nz
grep "Total grid energy" log3nz


p1nz=`grep "Total grid energy" log1nz | cut -f2 -d ':' `
p2nz=`grep "Total grid energy" log2nz | cut -f2 -d ':' `
p3nz=`grep "Total grid energy" log3nz | cut -f2 -d ':' `

p1z=`grep "Total grid energy" log1z | cut -f2 -d ':' `
p2z=`grep "Total grid energy" log2z | cut -f2 -d ':' `
p3z=`grep "Total grid energy" log3z | cut -f2 -d ':' `

g1nz=`echo ${p1nz/kT/}`
g2nz=`echo ${p2nz/kT/}`
g3nz=`echo ${p3nz/kT/}`

g1z=`echo ${p1z/kT/}`
g2z=`echo ${p2z/kT/}`
g3z=`echo ${p3z/kT/}`

delg01=`echo "$g1nz-($g1z)" | bc -l`
delg02=`echo "$g2nz-($g2z)" | bc -l`
delg03=`echo "$g3nz-($g3z)" | bc -l`

echo
echo "delG0_complex (G0_nonzero - G0_zero):" $delg01
echo "delG0_mol1    (G0_nonzero - G0_zero):" $delg02
echo "delG0_mol2    (G0_nonzero - G0_zero):" $delg03
echo

delG_salt=`echo "$delg01-($delg02+$delg03)" | bc -l`

#echo "$delg01-($delg02+$delg03)" 
echo
echo "del_delG_salt:" $delG_salt
echo



