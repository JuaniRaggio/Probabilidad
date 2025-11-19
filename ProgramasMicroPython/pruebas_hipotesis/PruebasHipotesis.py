from math import sqrt

# Pruebas de hipotesis para una muestra

# ========================================
# TESTS PARA MEDIA (sigma conocida)
# ========================================

def z_test_media_sigma_conocida(X_barra, mu0, sigma, n):
    """
    Calcula el estadistico Z para test de media con sigma conocida

    Parametros:
    X_barra: media muestral
    mu0: valor de la media bajo H0
    sigma: desviacion estandar poblacional (conocida)
    n: tamaño de la muestra

    Retorna: estadistico Z
    """
    return (X_barra - mu0) / (sigma / sqrt(n))

# ========================================
# TESTS PARA MEDIA (sigma desconocida)
# ========================================

def t_test_media_sigma_desconocida(X_barra, mu0, S, n):
    """
    Calcula el estadistico t para test de media con sigma desconocida

    Parametros:
    X_barra: media muestral
    mu0: valor de la media bajo H0
    S: desviacion estandar muestral
    n: tamaño de la muestra

    Retorna: estadistico t
    Grados de libertad: n - 1
    """
    return (X_barra - mu0) / (S / sqrt(n))

# ========================================
# TESTS PARA PROPORCION
# ========================================

def z_test_proporcion(p_hat, p0, n):
    """
    Calcula el estadistico Z para test de proporcion

    Parametros:
    p_hat: proporcion muestral (exitos / n)
    p0: valor de la proporcion bajo H0
    n: tamaño de la muestra

    Retorna: estadistico Z
    """
    return (p_hat - p0) / sqrt((p0 * (1 - p0)) / n)

def z_test_proporcion_desde_exitos(x, p0, n):
    """
    Calcula el estadistico Z para test de proporcion desde numero de exitos

    Parametros:
    x: numero de exitos
    p0: valor de la proporcion bajo H0
    n: tamaño de la muestra

    Retorna: estadistico Z
    """
    p_hat = x / n
    return z_test_proporcion(p_hat, p0, n)

# ========================================
# REGIONES CRITICAS
# ========================================

def region_critica_bilateral_z(alfa):
    """
    Describe la region critica bilateral para test Z

    Parametros:
    alfa: nivel de significancia

    Retorna: string describiendo la region critica
    """
    return "Rechazar H0 si |Z| > Z_(1-alfa/2) = invNorm(" + str(1-alfa/2) + ", 0, 1)"

def region_critica_mayor_z(alfa):
    """
    Describe la region critica para test Z unilateral derecho (H1: mu > mu0)

    Parametros:
    alfa: nivel de significancia

    Retorna: string describiendo la region critica
    """
    return "Rechazar H0 si Z > Z_(1-alfa) = invNorm(" + str(1-alfa) + ", 0, 1)"

def region_critica_menor_z(alfa):
    """
    Describe la region critica para test Z unilateral izquierdo (H1: mu < mu0)

    Parametros:
    alfa: nivel de significancia

    Retorna: string describiendo la region critica
    """
    return "Rechazar H0 si Z < -Z_(1-alfa) = invNorm(" + str(alfa) + ", 0, 1)"

def region_critica_bilateral_t(alfa, gl):
    """
    Describe la region critica bilateral para test t

    Parametros:
    alfa: nivel de significancia
    gl: grados de libertad

    Retorna: string describiendo la region critica
    """
    return "Rechazar H0 si |t| > t_(1-alfa/2, " + str(gl) + ") = invT(" + str(1-alfa/2) + ", " + str(gl) + ")"

def region_critica_mayor_t(alfa, gl):
    """
    Describe la region critica para test t unilateral derecho (H1: mu > mu0)

    Parametros:
    alfa: nivel de significancia
    gl: grados de libertad

    Retorna: string describiendo la region critica
    """
    return "Rechazar H0 si t > t_(1-alfa, " + str(gl) + ") = invT(" + str(1-alfa) + ", " + str(gl) + ")"

def region_critica_menor_t(alfa, gl):
    """
    Describe la region critica para test t unilateral izquierdo (H1: mu < mu0)

    Parametros:
    alfa: nivel de significancia
    gl: grados de libertad

    Retorna: string describiendo la region critica
    """
    return "Rechazar H0 si t < -t_(1-alfa, " + str(gl) + ") = invT(" + str(alfa) + ", " + str(gl) + ")"

# ========================================
# FUNCIONES DE DECISION
# ========================================

def decision_z_bilateral(z_calc, z_critico):
    """
    Toma decision para test Z bilateral

    Parametros:
    z_calc: estadistico Z calculado
    z_critico: valor critico (positivo)

    Retorna: string con la decision
    """
    if abs(z_calc) > z_critico:
        return "Rechazamos H0 (|" + str(round(z_calc, 4)) + "| > " + str(z_critico) + ")"
    else:
        return "No rechazamos H0 (|" + str(round(z_calc, 4)) + "| <= " + str(z_critico) + ")"

def decision_z_mayor(z_calc, z_critico):
    """
    Toma decision para test Z unilateral derecho

    Parametros:
    z_calc: estadistico Z calculado
    z_critico: valor critico

    Retorna: string con la decision
    """
    if z_calc > z_critico:
        return "Rechazamos H0 (" + str(round(z_calc, 4)) + " > " + str(z_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(z_calc, 4)) + " <= " + str(z_critico) + ")"

def decision_z_menor(z_calc, z_critico):
    """
    Toma decision para test Z unilateral izquierdo

    Parametros:
    z_calc: estadistico Z calculado
    z_critico: valor critico (negativo)

    Retorna: string con la decision
    """
    if z_calc < z_critico:
        return "Rechazamos H0 (" + str(round(z_calc, 4)) + " < " + str(z_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(z_calc, 4)) + " >= " + str(z_critico) + ")"

def decision_t_bilateral(t_calc, t_critico):
    """
    Toma decision para test t bilateral

    Parametros:
    t_calc: estadistico t calculado
    t_critico: valor critico (positivo)

    Retorna: string con la decision
    """
    if abs(t_calc) > t_critico:
        return "Rechazamos H0 (|" + str(round(t_calc, 4)) + "| > " + str(t_critico) + ")"
    else:
        return "No rechazamos H0 (|" + str(round(t_calc, 4)) + "| <= " + str(t_critico) + ")"

def decision_t_mayor(t_calc, t_critico):
    """
    Toma decision para test t unilateral derecho

    Parametros:
    t_calc: estadistico t calculado
    t_critico: valor critico

    Retorna: string con la decision
    """
    if t_calc > t_critico:
        return "Rechazamos H0 (" + str(round(t_calc, 4)) + " > " + str(t_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(t_calc, 4)) + " <= " + str(t_critico) + ")"

def decision_t_menor(t_calc, t_critico):
    """
    Toma decision para test t unilateral izquierdo

    Parametros:
    t_calc: estadistico t calculado
    t_critico: valor critico (negativo)

    Retorna: string con la decision
    """
    if t_calc < t_critico:
        return "Rechazamos H0 (" + str(round(t_calc, 4)) + " < " + str(t_critico) + ")"
    else:
        return "No rechazamos H0 (" + str(round(t_calc, 4)) + " >= " + str(t_critico) + ")"

# ========================================
# EJEMPLOS DE USO
# ========================================

# Ejemplo 1: Test Z bilateral para media (sigma conocida)
# H0: mu = 100
# H1: mu != 100
# X_barra = 103
# sigma = 15
# n = 50
# alfa = 0.05
# z_critico = 1.96  # invNorm(0.975, 0, 1)
# z_calc = z_test_media_sigma_conocida(X_barra, 100, sigma, n)
# print("Z calculado:", z_calc)
# print(region_critica_bilateral_z(alfa))
# print(decision_z_bilateral(z_calc, z_critico))

# Ejemplo 2: Test t unilateral derecho para media (sigma desconocida)
# H0: mu = 50
# H1: mu > 50
# X_barra = 52.5
# S = 8
# n = 25
# gl = n - 1
# alfa = 0.05
# t_critico = 1.711  # invT(0.95, 24)
# t_calc = t_test_media_sigma_desconocida(X_barra, 50, S, n)
# print("t calculado:", t_calc)
# print(region_critica_mayor_t(alfa, gl))
# print(decision_t_mayor(t_calc, t_critico))

# Ejemplo 3: Test Z unilateral izquierdo para proporcion
# H0: p = 0.3
# H1: p < 0.3
# x = 25  # exitos
# n = 100
# alfa = 0.05
# z_critico = -1.645  # invNorm(0.05, 0, 1)
# z_calc = z_test_proporcion_desde_exitos(x, 0.3, n)
# print("Z calculado:", z_calc)
# print(region_critica_menor_z(alfa))
# print(decision_z_menor(z_calc, z_critico))
