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
def IC_media_sigma_conocida_unilateral_izq(X_barra, sigma, n, z_alfa):
    lim_sup = X_barra + z_alfa * sigma / sqrt(n)
    return ('-inf', lim_sup)
def IC_media_sigma_conocida_unilateral_der(X_barra, sigma, n, z_alfa):
    lim_inf = X_barra - z_alfa * sigma / sqrt(n)
    return (lim_inf, 'inf')
def IC_media_sigma_desconocida_unilateral_izq(X_barra, S, n, t_alfa):
    lim_sup = X_barra + t_alfa * S / sqrt(n)
    return ('-inf', lim_sup)
def IC_media_sigma_desconocida_unilateral_der(X_barra, S, n, t_alfa):
    lim_inf = X_barra - t_alfa * S / sqrt(n)
    return (lim_inf, 'inf')
def IC_proporcion_unilateral_izq(p_hat, n, z_alfa):
    lim_sup = p_hat + z_alfa * sqrt( (p_hat * (1 - p_hat)) / n )
    return (0, lim_sup)
def IC_proporcion_unilateral_der(p_hat, n, z_alfa):
    lim_inf = p_hat - z_alfa * sqrt( (p_hat * (1 - p_hat)) / n )
    return (lim_inf, 1)
def n_media(z, sigma, E):
    return ( (z * sigma / E) ** 2 )
def n_proporcion(z, E):
    return ( (z * 0.5 / E) ** 2 )

# gl = n - 1
# 95% de confianza -> alpha = 1 - 95/100 = 1 - 0.95

# Bilat: t = # invT(1 - alfa/2, gl)
# Unilat: t = invT(1 - alfa, gl)
t = 1.761310111
z = 1.959963986 # invNorm(1 - alfa/2, 0, 1)

# == intervalo pa media cc sigma conocida ==
X_barra = 63
# sigma = 0.73
n = 15
alfa = 0.1
err = 0.002
# print("IC media sigma conocida:", IC_media_sigma_conocida(X_barra, sigma, n, z))

# == inter pa media cc sigma desconocida ==
S = 12.5
n2 = 15
alfa2 = 0.1
print("IC media sigma desconocida:", IC_media_sigma_desconocida(X_barra, S, n2, t))

# == inter pa proporcion ==
# n_p = 300 # Tamaño de la muestra
# p_hat = 300/150 # La proporcion de los datos (18 D => 18/n_p)
# alfa3 = 0.1
# print("IC proporcion:", IC_proporcion(p_hat, n_p, z))

# == tamaño muestra media ==
# print("n media:", n_media(z, sigma, err))

# Ejemplo 5: tamaño muestra proporcion
print("n proporcion:", n_proporcion(z, err))


# z_alpha != z de arriba
z_alfa = 1.9 # invNorm(alpha)
# IC_media_sigma_conocida_unilateral_izq(X_barra, sigma, n, z_alfa)
# IC_media_sigma_conocida_unilateral_der(X_barra, sigma, n, z_alfa)
# IC_media_sigma_desconocida_unilateral_izq(X_barra, S, n, t_alfa)
# IC_media_sigma_desconocida_unilateral_der(X_barra, S, n, t_alfa)
# IC_proporcion_unilateral_izq(p_hat, n, z_alfa)
# IC_proporcion_unilateral_der(p_hat, n, z_alfa)

