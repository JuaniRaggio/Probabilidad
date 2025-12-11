from math import sqrt
def z_test_media_sigma_conocida(X_barra, mu0, sigma, n):
    return (X_barra - mu0) / (sigma / sqrt(n))
def t_test_media_sigma_desconocida(X_barra, mu0, S, n):
    return (X_barra - mu0) / (S / sqrt(n))
def z_test_proporcion(p_hat, p0, n):
    # p_hat: proporcion muestral (exitos / n)
    # p0: valor de la proporcion bajo H0
    return (p_hat - p0) / sqrt((p0 * (1 - p0)) / n)
def z_test_proporcion_desde_exitos(x, p0, n):
    # x: numero de exitos
    p_hat = x / n
    return z_test_proporcion(p_hat, p0, n)
def region_critica_bilateral_z(alfa):
    return "Rechazar H0 si |Z| > Z_(1-alfa/2) = invNorm(" + str(1-alfa/2) + ", 0, 1)"
def region_critica_mayor_z(alfa):
    return "Rechazar H0 si Z > Z_(1-alfa) = invNorm(" + str(1-alfa) + ", 0, 1)"
def region_critica_menor_z(alfa):
    return "Rechazar H0 si Z < -Z_(1-alfa) = invNorm(" + str(alfa) + ", 0, 1)"
def region_critica_bilateral_t(alfa, gl):
    return "Rechazar H0 si |t| > t_(1-alfa/2, " + str(gl) + ") = invT(" + str(1-alfa/2) + ", " + str(gl) + ")"
def region_critica_mayor_t(alfa, gl):
    return "Rechazar H0 si t > t_(1-alfa, " + str(gl) + ") = invT(" + str(1-alfa) + ", " + str(gl) + ")"
def region_critica_menor_t(alfa, gl):
    return "Rechazar H0 si t < -t_(1-alfa, " + str(gl) + ") = invT(" + str(alfa) + ", " + str(gl) + ")"
def decision_z_bilateral(z_calc, z_critico):
    if abs(z_calc) > z_critico:
        return "Rechazamos H0 (|" + str(round(z_calc, 4)) + "| > " + str(z_critico) + ")"
    else:
        return "No rechazamos H0 (|" + str(round(z_calc, 4)) + "| <= " + str(z_critico) + ")"
def decision_z_mayor(z_calc, z_critico):
    if z_calc > z_critico:
        return "Rechazamos H0 (" + str(round(z_calc, 4)) + " > " + str(z_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(z_calc, 4)) + " <= " + str(z_critico) + ")"
def decision_z_menor(z_calc, z_critico):
    if z_calc < z_critico:
        return "Rechazamos H0 (" + str(round(z_calc, 4)) + " < " + str(z_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(z_calc, 4)) + " >= " + str(z_critico) + ")"
def decision_t_bilateral(t_calc, t_critico):
    if abs(t_calc) > t_critico:
        return "Rechazamos H0 (|" + str(round(t_calc, 4)) + "| > " + str(t_critico) + ")"
    else:
        return "No rechazamos H0 (|" + str(round(t_calc, 4)) + "| <= " + str(t_critico) + ")"
def decision_t_mayor(t_calc, t_critico):
    if t_calc > t_critico:
        return "Rechazamos H0 (" + str(round(t_calc, 4)) + " > " + str(t_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(t_calc, 4)) + " <= " + str(t_critico) + ")"
def decision_t_menor(t_calc, t_critico):
    if t_calc < t_critico:
        return "Rechazamos H0 (" + str(round(t_calc, 4)) + " < " + str(t_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(t_calc, 4)) + " >= " + str(t_critico) + ")"

# ============================================================
# TEST Z PARA MEDIA (sigma conocida)
# ============================================================

# Test Z BILATERAL para media
# H0: mu = 100
# H1: mu != 100
# X_barra = 103
# mu0 = ...
# sigma = 15
# n = 50
# alfa = 0.05
# z_critico = 1.96  # invNorm(1 - alpha/2, 0, 1)
# z_calc = z_test_media_sigma_conocida(X_barra, mu0, sigma, n)
# print("Z calculado:", z_calc)
# print(region_critica_bilateral_z(alfa))
# print(decision_z_bilateral(z_calc, z_critico))
# Valor P: 2 * normalcdf(-1E99, -|z_calc|, 0, 1)

# Test Z UNILATERAL IZQUIERDO para media
# H0: mu = 18
# H1: mu < 18
# X_barra = 17.5
# mu0 = ...
# sigma = 2  # sqrt(varianza) = sqrt(4)
# n = 16
# alfa = 0.05
# z_critico = -1.645  # invNorm(0.05, 0, 1) -> NEGATIVO
# z_calc = z_test_media_sigma_conocida(X_barra, mu0, sigma, n)
# print("Z calculado:", z_calc)  # -1.0
# print(region_critica_menor_z(alfa))
# print(decision_z_menor(z_calc, z_critico))
# Valor P: normalcdf(-1E99, z_calc, 0, 1)

# Test Z UNILATERAL DERECHO para media
# Ejemplo: verificar si peso medio es SUPERIOR al especificado
# H0: mu = 50
# H1: mu > 50
# X_barra = 53
# mu0 = ...
# sigma = 10
# n = 36
# alfa = 0.05
# z_critico = 1.645  # invNorm(0.95, 0, 1) -> POSITIVO
# z_calc = z_test_media_sigma_conocida(X_barra, mu0, sigma, n)
# print("Z calculado:", z_calc)  # 1.8
# print(region_critica_mayor_z(alfa))
# print(decision_z_mayor(z_calc, z_critico))
# Valor P: normalcdf(z_calc, 1E99, 0, 1)

# ============================================================
# TEST t PARA MEDIA (sigma desconocida)
# ============================================================

# Test t BILATERAL para media
# H0: mu = 100
# H1: mu != 100
X_barra = 274.4
mu0 = 250
S = 11.2  # desviacion estandar MUESTRAL
n = 35
gl = n - 1
alfa = 0.05
t_critico = 2.032244455  # invT(1 - alpha/2, gl)
t_calc = t_test_media_sigma_desconocida(X_barra, mu0, S, n)
print("t calculado:", t_calc)
print(region_critica_bilateral_t(alfa, gl))
print(decision_t_bilateral(t_calc, t_critico))
# Valor P: 2 * tcdf(-1E99, -|t_calc|, gl)

# Test t UNILATERAL IZQUIERDO para media
# Ejemplo: verificar si rendimiento es INFERIOR al esperado
# H0: mu = 80
# H1: mu < 80
# X_barra = 76
# mu0 = ...
# S = 10
# n = 25
# gl = n - 1  # 24
# alfa = 0.05
# t_critico = -1.711  # invT(0.05, 24) -> NEGATIVO
# t_calc = t_test_media_sigma_desconocida(X_barra, mu0, S, n)
# print("t calculado:", t_calc)  # -2.0
# print(region_critica_menor_t(alfa, gl))
# print(decision_t_menor(t_calc, t_critico))
# Valor P: tcdf(-1E99, t_calc, gl)

# Test t UNILATERAL DERECHO para media
# Ejemplo: verificar si rendimiento es SUPERIOR al esperado
# H0: mu = 50
# H1: mu > 50
# X_barra = 52.5
# mu0 = ...
# S = 8
# n = 25
# gl = n - 1  # 24
# alfa = 0.05
# t_critico = 1.711  # invT(1 - alpha, 24) -> POSITIVO
# t_calc = t_test_media_sigma_desconocida(X_barra, mu0, S, n)
# print("t calculado:", t_calc)  # 1.5625
# print(region_critica_mayor_t(alfa, gl))
# print(decision_t_mayor(t_calc, t_critico))
# Valor P: tcdf(t_calc, 1E99, gl)

# ============================================================
# TEST Z PARA PROPORCION
# ============================================================

# Test Z BILATERAL para proporcion
# H0: p = 0.5
# H1: p != 0.5
# x = 60  # exitos
# n = 100
# alfa = 0.05
# p_0 = 0.5
# z_critico = 1.96  # invNorm(0.975, 0, 1)
# z_calc = z_test_proporcion_desde_exitos(x, p_0, n)
# print("Z calculado:", z_calc)  # 2.0
# print(region_critica_bilateral_z(alfa))
# print(decision_z_bilateral(z_calc, z_critico))
# Valor P: 2 * normalcdf(-1E99, -|z_calc|, 0, 1)

# Test Z UNILATERAL IZQUIERDO para proporcion
# Ejemplo: verificar si proporcion de defectos es MENOR al limite
# H0: p = 0.3
# H1: p < 0.3
# x = 25  # exitos
# n = 100
# alfa = 0.05
# p_0 = 0.3
# z_critico = -1.645  # invNorm(0.05, 0, 1) -> NEGATIVO
# z_calc = z_test_proporcion_desde_exitos(x, p_0, n)
# print("Z calculado:", z_calc)  # -1.09
# print(region_critica_menor_z(alfa))
# print(decision_z_menor(z_calc, z_critico))
# Valor P: normalcdf(-1E99, z_calc, 0, 1)

# Test Z UNILATERAL DERECHO para proporcion
# Ejemplo: verificar si proporcion de aprobados es MAYOR al esperado
# H0: p = 0.6
# H1: p > 0.6
# x = 70  # exitos
# n = 100
# alfa = 0.05
# p_0 = 0.6
# z_critico = 1.645  # invNorm(0.95, 0, 1) -> POSITIVO
# z_calc = z_test_proporcion_desde_exitos(x, p_0, n)
# print("Z calculado:", z_calc)  # 2.04
# print(region_critica_mayor_z(alfa))
# print(decision_z_mayor(z_calc, z_critico))
# Valor P: normalcdf(z_calc, 1E99, 0, 1)
