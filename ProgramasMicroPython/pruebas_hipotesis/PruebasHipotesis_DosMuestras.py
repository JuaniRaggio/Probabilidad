from math import sqrt

def z_test_diferencia_medias_varianzas_conocidas(X1_barra, X2_barra, mu1_mu2, sigma1, sigma2, n1, n2):
    diferencia_observada = X1_barra - X2_barra
    error_estandar = sqrt((sigma1**2 / n1) + (sigma2**2 / n2))
    return (diferencia_observada - mu1_mu2) / error_estandar

def t_test_diferencia_medias_varianzas_iguales(X1_barra, X2_barra, mu1_mu2, S1, S2, n1, n2):
    diferencia_observada = X1_barra - X2_barra
    gl = n1 + n2 - 2
    S2_pooled = ((n1 - 1) * S1**2 + (n2 - 1) * S2**2) / gl
    S_pooled = sqrt(S2_pooled)
    error_estandar = S_pooled * sqrt(1/n1 + 1/n2)
    return (diferencia_observada - mu1_mu2) / error_estandar

def t_test_diferencia_medias_varianzas_distintas(X1_barra, X2_barra, mu1_mu2, S1, S2, n1, n2):
    diferencia_observada = X1_barra - X2_barra
    error_estandar = sqrt((S1**2 / n1) + (S2**2 / n2))
    return (diferencia_observada - mu1_mu2) / error_estandar

def gl_welch(S1, S2, n1, n2):
    numerador = ((S1**2 / n1) + (S2**2 / n2)) ** 2
    denominador = ((S1**2 / n1)**2 / (n1 - 1)) + ((S2**2 / n2)**2 / (n2 - 1))
    return int(numerador / denominador)

def t_test_pareado(diferencias, mu_D):
    n = len(diferencias)
    D_barra = sum(diferencias) / n
    S_D = sqrt(sum((d - D_barra)**2 for d in diferencias) / (n - 1))
    return (D_barra - mu_D) / (S_D / sqrt(n))

def z_test_diferencia_proporciones(p1_hat, p2_hat, p1_p2, n1, n2):
    diferencia_observada = p1_hat - p2_hat
    # Si p1_p2 = 0, usar proporcion combinada (pooled)
    if p1_p2 == 0:
        p_pooled = (p1_hat * n1 + p2_hat * n2) / (n1 + n2)
        error_estandar = sqrt(p_pooled * (1 - p_pooled) * (1/n1 + 1/n2))
    else:
        # Si p1_p2 != 0, usar proporciones separadas
        error_estandar = sqrt((p1_hat * (1 - p1_hat) / n1) + (p2_hat * (1 - p2_hat) / n2))
    return (diferencia_observada - p1_p2) / error_estandar

def z_test_diferencia_proporciones_desde_exitos(x1, x2, p1_p2, n1, n2):
    p1_hat = x1 / n1
    p2_hat = x2 / n2
    return z_test_diferencia_proporciones(p1_hat, p2_hat, p1_p2, n1, n2)

def f_test_varianzas(S1, S2):
    # Siempre poner la mayor varianza en el numerador
    if S1 >= S2:
        return (S1**2) / (S2**2)
    else:
        return (S2**2) / (S1**2)

def decision_bilateral(estadistico, valor_critico, nombre_est):
    if abs(estadistico) > valor_critico:
        return "Rechazamos H0 (|" + str(round(estadistico, 4)) + "| > " + str(valor_critico) + ")"
    else:
        return "No rechazamos H0 (|" + str(round(estadistico, 4)) + "| <= " + str(valor_critico) + ")"

def decision_mayor(estadistico, valor_critico, nombre_est):
    if estadistico > valor_critico:
        return "Rechazamos H0 (" + str(round(estadistico, 4)) + " > " + str(valor_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(estadistico, 4)) + " <= " + str(valor_critico) + ")"

def decision_menor(estadistico, valor_critico, nombre_est):
    if estadistico < valor_critico:
        return "Rechazamos H0 (" + str(round(estadistico, 4)) + " < " + str(valor_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(estadistico, 4)) + " >= " + str(valor_critico) + ")"

# Ejemplo 1: Test Z para diferencia de medias (varianzas conocidas)
# H0: mu1 - mu2 = 0
# H1: mu1 - mu2 != 0
# X1_barra = 42.1
# X2_barra = 40.5
# sigma1 = 5.8
# sigma2 = 5.2
# n1 = 35
# n2 = 40
# alfa = 0.05
# z_critico = 1.96  # invNorm(0.975, 0, 1)
# z_calc = z_test_diferencia_medias_varianzas_conocidas(X1_barra, X2_barra, 0, sigma1, sigma2, n1, n2)
# print("Z calculado:", z_calc)
# print(decision_bilateral(z_calc, z_critico, "Z"))

# Ejemplo 2: Test t para diferencia de medias (varianzas iguales)
# H0: mu1 - mu2 = 0
# H1: mu1 - mu2 > 0
# X1_barra = 28.5
# X2_barra = 25.3
# S1 = 4.2
# S2 = 3.8
# n1 = 15
# n2 = 12
# gl = n1 + n2 - 2  # gl = 25
# alfa = 0.05
# t_critico = 1.708  # invT(0.95, 25)
# t_calc = t_test_diferencia_medias_varianzas_iguales(X1_barra, X2_barra, 0, S1, S2, n1, n2)
# print("t calculado:", t_calc)
# print(decision_mayor(t_calc, t_critico, "t"))

# Ejemplo 3: Test t para datos pareados
# H0: mu_D = 0
# H1: mu_D != 0
# diferencias = [2.1, -0.5, 1.8, 3.2, 0.9, 2.5, 1.1]
# n = len(diferencias)
# gl = n - 1  # gl = 6
# alfa = 0.05
# t_critico = 2.447  # invT(0.975, 6)
# t_calc = t_test_pareado(diferencias, 0)
# print("t calculado:", t_calc)
# print(decision_bilateral(t_calc, t_critico, "t"))

# Ejemplo 4: Test Z para diferencia de proporciones
# H0: p1 - p2 = 0
# H1: p1 - p2 != 0
# x1 = 45
# x2 = 38
# n1 = 200
# n2 = 180
# alfa = 0.05
# z_critico = 1.96  # invNorm(0.975, 0, 1)
# z_calc = z_test_diferencia_proporciones_desde_exitos(x1, x2, 0, n1, n2)
# print("Z calculado:", z_calc)
# print(decision_bilateral(z_calc, z_critico, "Z"))

# Ejemplo 5: Test F para comparacion de varianzas
# H0: sigma1^2 = sigma2^2
# H1: sigma1^2 != sigma2^2
# S1 = 12.5
# S2 = 8.3
# n1 = 20
# n2 = 15
# gl1 = n1 - 1  # gl = 19
# gl2 = n2 - 1  # gl = 14
# alfa = 0.05
# F_critico = 2.86  # invF(0.975, 19, 14) - bilateral, usar 1-alfa/2
# F_calc = f_test_varianzas(S1, S2)
# print("F calculado:", F_calc)
# print(decision_bilateral(F_calc, F_critico, "F"))
