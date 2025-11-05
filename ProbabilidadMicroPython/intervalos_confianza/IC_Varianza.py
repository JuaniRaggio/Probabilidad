from math import sqrt

# Intervalos de confianza para varianza y desviacion estandar

# NOTA: Los valores de chi-cuadrado deben calcularse en la TI
# Para un IC del (1-alfa)% con n observaciones:
# gl = n - 1
# chi_inf = invChi2(alfa/2, gl)
# chi_sup = invChi2(1 - alfa/2, gl)

def IC_varianza(S2, n, chi_inf, chi_sup):
    """
    Intervalo de confianza para la varianza poblacional

    Parametros:
    S2: varianza muestral (con n-1 en el denominador)
    n: tamaño de la muestra
    chi_inf: fractil inferior de chi-cuadrado con n-1 gl
    chi_sup: fractil superior de chi-cuadrado con n-1 gl

    Retorna: tupla (limite_inferior, limite_superior) para sigma^2
    """
    gl = n - 1
    limite_inf = (gl * S2) / chi_sup
    limite_sup = (gl * S2) / chi_inf
    return (limite_inf, limite_sup)

def IC_desviacion_estandar(S, n, chi_inf, chi_sup):
    """
    Intervalo de confianza para la desviacion estandar poblacional

    Parametros:
    S: desviacion estandar muestral (con n-1 en el denominador)
    n: tamaño de la muestra
    chi_inf: fractil inferior de chi-cuadrado con n-1 gl
    chi_sup: fractil superior de chi-cuadrado con n-1 gl

    Retorna: tupla (limite_inferior, limite_superior) para sigma
    """
    S2 = S ** 2
    ic_var = IC_varianza(S2, n, chi_inf, chi_sup)
    return (sqrt(ic_var[0]), sqrt(ic_var[1]))

# === Ejemplo de uso ===

# Ejercicio: IC del 95% para la varianza
# Datos: S = 2.5, n = 20, alfa = 0.05

# S = 2.5
# n = 20
# gl = n - 1  # gl = 19
# alfa = 0.05

# En la TI calcular:
# chi_inf = invChi2(0.025, 19) = 8.907
# chi_sup = invChi2(0.975, 19) = 32.852

# chi_inf = 8.907
# chi_sup = 32.852

# print("IC para varianza:", IC_varianza(S**2, n, chi_inf, chi_sup))
# print("IC para desviacion estandar:", IC_desviacion_estandar(S, n, chi_inf, chi_sup))
