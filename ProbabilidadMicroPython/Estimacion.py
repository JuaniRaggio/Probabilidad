from math import sqrt

def IC_media_sigma_conocida(X_barra, sigma, n, z):
    margen = z * sigma / sqrt(n)
    return (X_barra - margen, X_barra + margen)

def IC_media_sigma_desconocida(X_barra, S, n, t):
    margen = t * S / sqrt(n)
    return (X_barra - margen, X_barra + margen)

def IC_proporcion(p_hat, n, z):
    margen = z * sqrt( (p_hat * (1 - p_hat)) / n )
    return (p_hat - margen, p_hat + margen)

# Sigma conocida:
def n_media(sigma, E):
    return ( (z * sigma / E) ** 2 )

def n_proporcion(E, z):
    return ( (z * 0.5 / E) ** 2 )

# gl son los grados de libertad y son:
# n - 1

# t = # invT(1 - alfa/2, gl)
z = 1.64485 # invNorm(1 - alfa/2, 0, 1)

# Ejemplo 1: intervalo media sigma conocida
# X_barra = 246
# sigma = 15
# n = 300
# alfa = 0.1
# print("IC media sigma conocida:", IC_media_sigma_conocida(X_barra, sigma, n, z))

# Ejemplo 2: intervalo media sigma desconocida
# S = 9
# n2 = 16
# alfa2 = 0.05
# print("IC media sigma desconocida:", IC_media_sigma_desconocida(X_barra, S, n2, t))

# Ejemplo 3: intervalo para proporcion
p_hat = 0.06 # La proporcion de los datos (18 D => 18/n_p)
n_p = 300 # Tamaño de la muestra
alfa3 = 0.1
print("IC proporcion:", IC_proporcion(p_hat, n_p, z))

# Ejemplo 4: tamaño muestra media
# print("n media:", n_media(sigma, 2))

# Ejemplo 5: tamaño muestra proporcion
# print("n proporcion:", n_proporcion(0.03, z))
