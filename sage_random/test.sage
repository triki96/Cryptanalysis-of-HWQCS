

reset()
from random import sample
import numpy as np
import matplotlib.pyplot as plt

k = 12539
n = 2 * k
wf = 145
wu = 33
we = 141
wc = 31

def c(n,wu,wv,l):
    return binomial(n,l) * binomial(n-l,wv-l) * binomial(n-wv,wu-l)

def probSomma(n,wu,wv):
	den = binomial(n,wv) * binomial(n,wu)
	myMin = min(wu,wv)
	res = 0
	for l in range(1,myMin,2):
		res += c(n,wu,wv,l)
	res = (1 / den) * res * 1.
	return res

def computeBinomProb(n,k,p):
	return binomial(n,k) * p^k * (1-p)^(n-k) * 1.


p = 0.38348673
for i in range(30):
	print(i)
	prob = computeBinomProb(31,i,p)
	valoreAtteso = prob * (k - we)
	print("Prob caso 0: ", prob)
	print("Valore atteso: ", valoreAtteso)
	prob = computeBinomProb(31,i,1-p)
	valoreAtteso = prob * (we)
	print("Prob caso 0: ", prob)
	print("Valore atteso: ", valoreAtteso)
	print("*"*50)