k,wf,wu,we,wc,ws,wt = 12539,145,33,141,31,5390,5484
lam = 128
F = GF(2)
R1.<y> = F[]
R.<x> = R1.quo(y^(2*k) - 1)

def weight(v):
	return sum(1 for i in v if i==1)

def keygen():
	f = []
	for i in range(2):
		inv = False
		while not inv:
			P = Permutations(k)
			p = P.random_element()
			meta_pol = [1 for i in range(wf)] + [0 for i in range(k-wf)]
			meta_pol = [meta_pol[p[i]-1] for i in range(k)]
			fi = R(meta_pol)
			inv = fi.is_unit()
		f += [fi]

	return f[0].inverse_of_unit()*f[1], f
	

def sign(pk,sk):
	while True:
		e = []
		u = []
		P = Permutations(k)
		for i in range(2):
			p = P.random_element()
			ei = [1 for i in range(we)] + [0 for i in range(k-we)]
			ei = [ei[p[i]-1] for i in range(k)]	
			e += [ei]
		for i in range(2):
			p = P.random_element()
			ui = [1 for i in range(wu)] + [0 for i in range(k-wu)]
			ui = [ui[p[i]-1] for i in range(k)]	
			u += [ui]
		print('AAA')
		b = [R(e[0])*pk, R(e[1])*pk.inverse_of_unit()]
		print('BBBB')
		p = P.random_element()
		c = [1 for i in range(wc)] + [0 for i in range(k-wc)]
		c = [c[p[i]-1] for i in range(k)]	
		s = [R(u[i])*sk[i]+ R(c)*R(e[i]) for i in range(2)]
		if weight(s[1]) <= ws and weight(s[0]) <= ws and weight(R(u[0])*sk[1] + R(u[1])*sk[0]) <= wt:
			return s
	
		
		
		
pk,sk = keygen()
sign(pk,sk)
		
		
		
			
		
		
		
		
		
		
		
		