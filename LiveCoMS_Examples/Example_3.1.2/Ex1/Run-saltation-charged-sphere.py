import math
import string
import pandas as pnd
import os
import subprocess
from string import Template

import matplotlib
import matplotlib.pyplot as plt

N_A = 6.02214076e23
# e: is elementary charge in Coulomb
e_c = 1.602176407e-19
# kB: Boltmann constant in SI unit
k_B = 1.3806504e-23
# Eo: Electric permitivity of free space in F/m
Eps_0 = 8.8541878176e-12
# T: Temperatue in Kelvin
T = 297.33
# mpAngs: meters-per-angstrom
mpAngs = 1.0e-10
# M2molpcc: M to mol/cc conversion factor
M2molpcc = 0.001

def elec_energy(Eps_0, salt=0, R=10.0, Q=5.0*e_c, Eps_ext=80.0, T=297.33):
    PI = math.pi
    """
    I_B = \frac{e_c^2}{(4\pi\epsilon_0\epsilon_{ext}k_BT)} 
    """
    Ib = (e_c**2) / (4 * PI * Eps_0 * Eps_ext*k_B*T * mpAngs) 
    """
    $ \kappa^{-1} = \sqrt{\left(\frac{\epsilon_0\epsilon_{ext}k_BT}{2 \times 10^3N_Ae_c^2} \right)} $
    """
    kappa_1 = math.sqrt(((Eps_0*k_B)/(2e3*N_A*e_c**2))*((Eps_ext*T) / (salt))) / mpAngs
    U = (1.0/2.0) * ((Q/e_c)**2) * ((Ib * kappa_1) / (R*(R+kappa_1)))
    return U, kappa_1

def elec_energy_Uo(Eps_0, salt=0, R=10.0, Q=5.0*e_c, Eps_ext=80.0, T=297.33):
    PI = math.pi
    Ib = (e_c**2) / (4 * PI * Eps_0 * Eps_ext * k_B * T * 1.0e-10)
    Uo = (1.0/2.0) * ((Q/e_c)**2) * ((Ib) / (R))
    return Uo

def prepare_and_run_delphi(dirname, salt, exdi, delphi_exe):
    tmpl_file = dirname + "param_charged_sphere.prm"
    template_delphi = Template(''.join(open(tmpl_file, 'r').readlines()))
    inp_parm = template_delphi.substitute(salt=salt, exdi=exdi)
    fout = open(dirname+"param_delphi.prm", "w")
    fout.write(inp_parm)
    fout.close()
    cmd="cd {2}; {0} {1} > {2}/delphi.log".format(delphi_exe, dirname+"param_delphi.prm", dirname)
    os.system(cmd)
    cmd2 = r"""grep "Energy> Total grid energy" {}/delphi.log""".format(dirname)
    total_grid_energy = 0.0
    try:
        result = subprocess.check_output(cmd2, shell=True)
        total_grid_energy = float(result.split()[5])
    except:
        pass
    return total_grid_energy

print("-"*80)
print('Analytical values for "saltation energy"')
analytic_data = {} 
for Eps_ext in [80, 60, 40]:
    Uo = elec_energy_Uo(Eps_0, Eps_ext=Eps_ext)
    analytic_data["{}".format(int(Eps_ext))] = []
    for i in (range(1, 11)):
        salt= round(i*0.02,3)
        U, kappa_1 = elec_energy(Eps_0, salt, Eps_ext=Eps_ext)
        print("For Eps_ext = {}, salt= {}M; Go = {}, Gs = {} kappa_1={}, Gs-Go={}".format(Eps_ext, salt, Uo, U, kappa_1, U-Uo))
        analytic_data["{}".format(int(Eps_ext))].append(U-Uo)
        #print(U-Uo)
print("="*80)   

dirname = "./" #"/home/user/Delphi_Tutorial_Examples/Example_3.1.2/"

# Absolute-path of the delphi executable file
delphi_exec = os.environ.get('DELPHI_EXE', "")
if not(delphi_exec and os.path.isfile(delphi_exec)):
    print(
          "Please set environment variable 'DELPHI_EXEC' to point to your DelPhi executable \n"
          "in your shell and try again!"
          )
    exit(0)

delphi_80 = [prepare_and_run_delphi(dirname, round(i*0.02, 3), 80, delphi_exec) for i in range(0, 11)]
delphi_60 = [prepare_and_run_delphi(dirname, round(i*0.02, 3), 60, delphi_exec) for i in range(0, 11)]
delphi_40 = [prepare_and_run_delphi(dirname, round(i*0.02, 3), 40, delphi_exec) for i in range(0, 11)]
    
saltation_delphi_80 = [v - delphi_80[0] for v in delphi_80[1:]]   
saltation_delphi_60 = [v - delphi_60[0] for v in delphi_60[1:]]
saltation_delphi_40 = [v - delphi_40[0] for v in delphi_40[1:]]

print(saltation_delphi_80)
print(saltation_delphi_60)
print(saltation_delphi_40)

data = {}
data['Salt'] = [round(v*0.01, 3) for v in range(1, 11, 1)]
data['A_80'] = analytic_data['80']
data['D_80'] = saltation_delphi_80
data['A_60'] = analytic_data['60']
data['D_60'] = saltation_delphi_60
data['A_40'] = analytic_data['40']
data['D_40'] = saltation_delphi_40
df = pnd.DataFrame.from_dict(data)
df.to_csv("saltation_charged_sphere.csv")

salt_log = [math.log(round(v*0.01, 3)) for v in range(1, 11, 1)]
l1, = plt.plot(salt_log, analytic_data['80'], 'bo-')
l2, = plt.plot(salt_log, analytic_data['60'], 'm>-')
l3, = plt.plot(salt_log, analytic_data['40'], 'rv-')

l4, = plt.plot(salt_log, saltation_delphi_80, 'p-')
l5, = plt.plot(salt_log, saltation_delphi_60, 'g^-')
l6, = plt.plot(salt_log, saltation_delphi_40, 'y<-')
lbls = [r"A, $\epsilon_{ext}=80$", r"A, $\epsilon_{ext}=60$", r"A, $\epsilon_{ext}=40$", 
        r"D, $\epsilon_{ext}=80$", r"D, $\epsilon_{ext}=60$", r"D, $\epsilon_{ext}=40$"]
plt.legend([l1, l2, l3, l4, l5, l6], lbls, title="Analytical=A, Delphi=D", loc='upper right', ncol=2)
plt.tick_params(labelsize=12)
plt.ylim([-12.5, 0])
plt.ylabel('"Saltation energy" of charged sphere in kT', fontsize=12)
plt.xlabel('Log(Salt concentration in M)', fontsize=12)
plt.title('"Saltation energy" profile for charged sphere', fontsize=15)
plt.tight_layout()
plt.savefig("plot-salt-ele-sphere.png", figsize=(3.0, 2.4), dpi=300)
plt.show()
