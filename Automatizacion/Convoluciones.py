# Este codigo sirve para calcular:
# P(X_n = k)
# Siendo X_n = Z_1 + Z_2 + ... + Z_n
# Con Z_i conocidas

# Posibles pasos de la caminata
Z_vals = [-2, -1, 0, 1, 2]

# Probabilidades
Z_probs = [0.1, 0.25, 0.3, 0.25, 0.1]

def inicializar_Z():
    dist = {}
    for i in range(len(Z_vals)):
        dist[Z_vals[i]] = Z_probs[i]
    return dist

def convolve(dist1, dist2):
    result = {}
    for val1 in dist1:
        for val2 in dist2:
            suma = val1 + val2
            prob = dist1[val1] * dist2[val2]
            if suma in result:
                result[suma] += prob
            else:
                result[suma] = prob
    return result

def calcular_Xn(Z_dist, n):
    dist = Z_dist
    for _ in range(n-1):
        dist = convolve(dist, Z_dist)
    return dist

Z_dist = inicializar_Z()

n = int(input("Ingrese n: "))

Xn = calcular_Xn(Z_dist, n)

def mostrar(dist, nombre):
    print("Distribución de", nombre)
    for k in sorted(dist.keys()):
        print("X =", k, "-> P =", round(dist[k], 4))
    print("")

mostrar(Xn, f"X{n}")
