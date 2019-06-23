

DELPHI=$DELPHI_EXE

template(){
    # usage: template file.tpl
    while read -r line ; do
            line=${line//\"/\\\"}
            line=${line//\`/\\\`}
            line=${line//\$/\\\$}
            line=${line//\\\${/\${}
            eval "echo \"$line\""; 
    done < ${1}
}

calc(){ awk "BEGIN { print $*}"; }

# 
declare -A CPX
declare -A REC
declare -A LIG
declare -A DELG

for sa in {0..10};
do
    salt=`calc $sa*0.02`
    echo "Running calculation of electrostaic component of binding at concentration of salt=$salt"
    for molecule in barnase-barstar barnase barstar;
    do
        if [ "$molecule" == "barnase-barstar" ]; then
            gsize=""
            perfil="perfil=70"
            template template_param_2-diel.prm >  param_${molecule}_2-diel.prm
            $DELPHI param_${molecule}_2-diel.prm > param_${molecule}_2-diel_${salt}.log
            G_allbutgrid=`grep 'Energy> All required energy terms but grid energy' \
                        param_${molecule}_2-diel_${salt}.log | awk -F: '{print $2}' | awk '{print $1}'`
            G_grid=`grep 'Energy> Total grid energy' \
                        param_${molecule}_2-diel_${salt}.log | awk -F: '{print $2}' | awk '{print $1}'`
            CPX[$salt]=$G_allbutgrid
            CPX["grid_$salt"]=$G_grid
        fi
        if [ "$molecule" == "barnase" ]; then
            gsize="gsize=187"
            perfil=""
            template template_param_2-diel.prm >  param_${molecule}_2-diel.prm
            $DELPHI param_${molecule}_2-diel.prm > param_${molecule}_2-diel_${salt}.log
            G_allbutgrid=`grep 'Energy> All required energy terms but grid energy' \
                        param_${molecule}_2-diel_${salt}.log | awk -F: '{print $2}' | awk '{print $1}'`
            G_grid=`grep 'Energy> Total grid energy' \
                        param_${molecule}_2-diel_${salt}.log | awk -F: '{print $2}' | awk '{print $1}'`
            REC[$salt]=$G_allbutgrid
            REC["grid_$salt"]=$G_grid
        fi
        if [ "$molecule" == "barstar" ]; then
            gsize="gsize=187"
            perfil=""
            template template_param_2-diel.prm >  param_${molecule}_2-diel.prm
            $DELPHI param_${molecule}_2-diel.prm > param_${molecule}_2-diel_${salt}.log
            G_allbutgrid=`grep 'Energy> All required energy terms but grid energy' \
                        param_${molecule}_2-diel_${salt}.log | awk -F: '{print $2}' | awk '{print $1}'`
            G_grid=`grep 'Energy> Total grid energy' \
                        param_${molecule}_2-diel_${salt}.log | awk -F: '{print $2}' | awk '{print $1}'`
            LIG[$salt]=$G_allbutgrid
            LIG["grid_$salt"]=$G_grid
        fi
        
    done
    if [ "$salt" != "0" ]; then
        hashk="grid_$salt"
        echo "Saltation energy using Method-1 i.e. via difference of grid energies"
        echo "dG=${CPX[$hashk]} - ${REC[$hashk]} - ${LIG[$hashk]} - ${CPX[grid_0]} + ${REC[grid_0]} + ${LIG[grid_0]}"
        dGnzs=`calc ${CPX[$hashk]} - ${REC[$hashk]} - ${LIG[$hashk]}`
        deltaG=`calc ${CPX[$hashk]} - ${REC[$hashk]} - ${LIG[$hashk]} - ${CPX[grid_0]} + ${REC[grid_0]} + ${LIG[grid_0]}`
        echo "Using Method-1:: salt=$salt, dG=$deltaG"
        echo "$salt $deltaG" >> saltation_using_M1_for_biniding.dat
        echo "---------------------------------------------------------------------------------------"
    else
        echo "SALT dG_saltation(kT)" > saltation_using_M1_for_biniding.dat
    fi
done


