# Requisitos si se quiere usar este programa y que los resultados sean
# correctos:
# Z_i -> i.i.d. -> Independientes e identicamente distribuidos
# NO tiene en cuenta tiempo de Absorcion, para eso se necesitan matrices



# Cubre Suma de variables aleatorias combinado con Random Walk
# si solo se desea random walk y X_n no depende de una suma
# basta poner que se desea 1 sola Z

# Este codigo sirve para calcular:
# P(X_n = k) -> Toda su distribucion
# Siendo X_n = Z_1 + Z_2 + ... + Z_n
# Con Z_i conocidas, i.i.d.

# Posibles pasos de la caminata
Z_vals = [-2, -1, 0, 1, 2]

# Probabilidades
Z_probs = [0.1, 0.25, 0.3, 0.25, 0.1]

if len(Z_vals) != len(Z_probs):
    print("Error: la cantidad de valores con coincide con la cantidad de probabilidades, dale gordo que haces? Concentrate")
    raise SystemError

suma_Z_probs = sum(Z_probs)
if abs(suma_Z_probs - 1.0) > 0.00001:
    print("Error: las probabilidades no suman 1 (suman:", round(suma_Z_probs, 4), "), dale gordo que haces?")
    raise SystemError

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

n = int(input("Ingresa n: "))

Xn = calcular_Xn(Z_dist, n)

def mostrar(dist, nombre):
    print("Distribución de", nombre)
    for k in sorted(dist.keys()):
        print("X =", k, "-> P =", round(dist[k], 4))
        if not k % 7:
            input("Presione enter para seguir")
    print("")

mostrar(Xn, "X{n}")
