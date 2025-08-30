from math import sqrt

def calcular_z(valor, n, mu, sigma, tipo):
    if tipo == 'suma':
        z = (valor - n*mu) / (sigma * sqrt(n))
    elif tipo == 'promedio':
        z = (valor - mu) / (sigma / sqrt(n))
    else:
        raise ValueError("Tipo inválido. Use 'suma' o 'promedio'.")
    return z

# Para intervalos
def calcular_z_intervalo(a, b, n, mu, sigma, tipo):
    z_a = calcular_z(a, n, mu, sigma, tipo)
    z_b = calcular_z(b, n, mu, sigma, tipo)
    return z_a, z_b

# === Ejemplos de uso ===

# Necesitamos siempre:
mu = 1000
sigma = 0.006
n = 2000

# Para sumas:
# Ejemplo : suma Sn <= 320
k = 320
z_suma = calcular_z(k, n, mu, sigma, 'suma')
print("P(Sn <=", k, ") --> Z =", round(z_suma, 4))

# Ejemplo : intervalo para suma
a = 290
b = 310
z_a, z_b = calcular_z_intervalo(a, b, n, mu, sigma, 'suma')
print("Intervalo suma: Zs =", round(z_a, 4), "a", round(z_b, 4))

# Para promedios:
# Ejemplo : promedio <= 10.4
x = 10.4
z_promedio = calcular_z(x, n, mu, sigma, 'promedio')
print("P(promedio <=", x, ") --> Z =", round(z_promedio, 4))

# Ejemplo : intervalo para promedio
a = 9.8
b = 10.3
z_a, z_b = calcular_z_intervalo(a, b, n, mu, sigma, 'promedio')
print("Intervalo promedio: Zs =", round(z_a, 4), "a", round(z_b, 4))
