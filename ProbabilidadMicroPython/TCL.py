from math import sqrt, erf
# === TCL ===

# Si X_1, ..., X_n son i.i.d. con media mu y varianza sigma^2:
# La suma Sn = X1 + X2 + ... + Xn
# Entonces: Sn ~ Aproximadamente Normal(N * mu, N * sigma^2)

# Se puede estandarizar:
# Z = (Sn - n*mu) / (sigma * sqrt(n)) ~ N(0,1)

# === 2) Funciones auxiliares ===

# Funcion de distribucion de la normal estandar (acumulada)
def phi(z):
    return 0.5 * (1 + erf(z / sqrt(2)))

# Probabilidad de que Sn <= k (usando TCL)
def P_Sn_leq_k(k, n, mu, sigma):
    z = (k - n*mu) / (sigma * sqrt(n))
    return phi(z)

# Probabilidad de intervalo (a <= Sn <= b)
def P_Sn_intervalo(a, b, n, mu, sigma):
    return P_Sn_leq_k(b, n, mu, sigma) - P_Sn_leq_k(a, n, mu, sigma)

# === 3) Codigo de uso ===

# Datos de ejemplo
mu = 10      # media de cada variable
sigma = 2    # desvio de cada variable
n = 30       # cantidad de variables

# Queremos P(Sn <= 320)
k = 320
print("P(Sn <=", k, ") =", round(P_Sn_leq_k(k, n, mu, sigma), 4))

# Queremos P(290 <= Sn <= 310)
a = 290
b = 310
print("P(", a, "<= Sn <=", b, ") =", round(P_Sn_intervalo(a, b, n, mu, sigma), 4))
