import matplotlib.pyplot as plt
import pandas as pd
import math
import scipy.stats

df_salt_m1 = pd.read_table("saltation_using_M1_for_biniding.dat", index_col=False, sep="\s+")
print(df_salt_m1)

salt_log = [math.log(s) for s in df_salt_m1['SALT'].values] 

l1 = plt.scatter(salt_log, df_salt_m1['dG_saltation(kT)'], c='b', marker='o')
sl1, intr1, rv1, pv1, _ = scipy.stats.linregress(salt_log, df_salt_m1['dG_saltation(kT)'])
l1, = plt.plot(salt_log, [sl1 * x + intr1 for x in salt_log], 'b-')
txt1 = "f(x) = {:.3f}x + {:.3f}\nR = {:.3f}".format(sl1,intr1, rv1)
plt.text(-3.7, 4.7, txt1, horizontalalignment='left', verticalalignment='center', color='blue')
print(sl1, intr1, rv1, pv1)

plt.tick_params(labelsize=12)
plt.ylabel('Saltation energy in kT', fontsize=12)
plt.xlabel('log(Salt concentration in M)', fontsize=12)
plt.title("Saltation energy profile of Barnase-barstar binding", fontsize=15)
plt.tight_layout()
plt.savefig("saltation-pp-binding.png", figsize=(3.0, 2.5), dpi=300)
plt.show()
