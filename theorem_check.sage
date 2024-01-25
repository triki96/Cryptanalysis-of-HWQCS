reset()
from random import sample
import numpy as np
import matplotlib.pyplot as plt

def vectorSum(c,k):
	res = [0] * len(c)
	for i in range(len(c)):
		res[i] = c[i] + k
	return res


def sparse_mul(a, b, n):
	c = [0] * n
	for i in a:
		new_pos = [0] * (len(b))
		for j in range(len(b)):
			new_pos[j] = (b[j] + i) % n
			c[new_pos[j]] = (c[new_pos[j]] + 1) % 2
	return c

k = 12539
n = 2 * k
w_u = 33
w_f = 145
w_c = 31
w_e = 141

# Ogni entrata z-esima di x codifica P((d_i(x)_j=z) | (e_i)_j = 0)
xx = [0,0,0,0,0,0.005,0.013,0.029,0.054,0.086,0.118,0.141,0.146,0.132,0.105,0.074,0.046,0.025,0.012,0.005,0.001,0,0,0,0,0,0,0]
# Ogni entrata z-esima di y codifica P((d_i(x)_j=z) | (e_i)_j = 1)
yy = [0,0,0,0,0,0,0,0,0,0,0,0.002,0.005,0.0123,0.025,0.0464,0.0746,0.105,0.132,0.145,0.140,0.118,0.086,0.054,0.029,0.013,0.005,0.001]

xxx = [(idx, x) for idx, x in enumerate(xx)]
yyy = [(idy, y) for idy, y in enumerate(yy)]

#Stampo 
p1 = list_plot(list(xxx),color='red')
p2 = list_plot(list(yyy),color='blue')

p = p1+p2
p.show()

#Stimo le probabilità in modo sperimentale
# calcolo d_i(x)
u = sample(range(k), w_u)  # sample u poly
f = sample(range(k), w_f)  # sample f poly
c = sample(range(k), w_c)  # sample c polynomial
e = sample(range(k), w_e)  # sample e polynomial

##compute s = u f + c e
uf = sparse_mul(u, f, k)
ce = sparse_mul(c, e, k)
s = np.mod([i+j for i,j in zip(uf,ce)],2)

# creo i vettori che tengono conto del numero di occorrenze z per cui d_i(x)_j=z, distinguendo e_ij = 0 ed e_ij=1
pos_0 = []
corr_values_0 = []
pos_1 = []
corr_values_1 = []

for i in range(k):
	shifted_c_support = np.mod(vectorSum(c,i),k); # shift of c by 0,1,2,3,...
	corr_val = 0
	for j in range(len(shifted_c_support)):
		corr_val = corr_val + s[shifted_c_support[j]]
	if (i not in e): #if e_i == 0
		pos_0.append(i) # take note of i s.t. e_i==0
		corr_values_0.append(corr_val) # take note of corr_values
	else:
		pos_1.append(i)
		corr_values_1.append(corr_val)
	
	# calcolo la probabilità di aver osservato questo fenomeno
number_of_tries_1 = w_e
number_of_tries_0 = k-w_e
d_values_for_0 = zero_vector(w_c+1)
d_values_for_1 = zero_vector(w_c+1)
prob_0 = []
prob_1 = []

for i in range(k-w_e):
	d_values_for_0[corr_values_0[i]] += 1
for i in range(len(d_values_for_0)):
	prob_0.append(d_values_for_0[i] / number_of_tries_0 * 1.)

for i in range(w_e):
	d_values_for_1[corr_values_1[i]] += 1
for i in range(len(d_values_for_1)):
	prob_1.append(d_values_for_1[i] / number_of_tries_1 * 1.)

#Stampo tutto su file
fileName00 = "theory_0.dat"
with open(fileName00, "w") as f:
	f.write("x y\n")
	for i in range(len(xx)):
		f.write(str(i) + " " + str(xx[i]) + "\n")
f.close()

fileName01 = "exp_0.dat"
with open(fileName01, "w") as f:
	f.write("x y\n")
	for i in range(len(prob_0)):
		f.write(str(i) + " " + str(prob_0[i]) + "\n")
f.close()

fileName10 = "theory_1.dat"
with open(fileName10, "w") as f:
	f.write("x y\n")
	for i in range(len(yy)):
		f.write(str(i) + " " + str(yy[i]) + "\n")
f.close()

fileName11 = "exp_1.dat"
with open(fileName11, "w") as f:
	f.write("x y\n")
	for i in range(len(prob_1)):
		f.write(str(i) + " " + str(prob_1[i]) + "\n")
f.close()