from math import sqrt

# Intervalos de confianza para diferencia de medias

# Caso 1: Varianzas poblacionales conocidas
def IC_diferencia_medias_varianzas_conocidas(X1_barra, X2_barra, sigma1, sigma2, n1, n2, z):
    """
    IC para mu1 - mu2 cuando las varianzas poblacionales son conocidas

    Parametros:
    X1_barra, X2_barra: medias muestrales
    sigma1, sigma2: desviaciones estandar poblacionales (conocidas)
    n1, n2: tamaños muestrales
    z: fractil de la normal estandar (invNorm(1 - alfa/2, 0, 1))

    Retorna: tupla (limite_inferior, limite_superior) para mu1 - mu2
    """
    diferencia = X1_barra - X2_barra
    error_estandar = sqrt((sigma1**2 / n1) + (sigma2**2 / n2))
    margen = z * error_estandar
    return (diferencia - margen, diferencia + margen)

# Caso 2: Varianzas poblacionales desconocidas pero iguales
def IC_diferencia_medias_varianzas_iguales(X1_barra, X2_barra, S1, S2, n1, n2, t):
    """
    IC para mu1 - mu2 cuando las varianzas son desconocidas pero iguales
    Usa la varianza pooled (combinada)

    Parametros:
    X1_barra, X2_barra: medias muestrales
    S1, S2: desviaciones estandar muestrales
    n1, n2: tamaños muestrales
    t: fractil de t-Student con (n1 + n2 - 2) grados de libertad
       t = invT(1 - alfa/2, n1 + n2 - 2)

    Retorna: tupla (limite_inferior, limite_superior) para mu1 - mu2
    """
    diferencia = X1_barra - X2_barra

    # Varianza pooled (combinada)
    gl = n1 + n2 - 2
    S2_pooled = ((n1 - 1) * S1**2 + (n2 - 1) * S2**2) / gl
    S_pooled = sqrt(S2_pooled)

    # Error estandar
    error_estandar = S_pooled * sqrt(1/n1 + 1/n2)
    margen = t * error_estandar
    return (diferencia - margen, diferencia + margen)

# Caso 3: Varianzas poblacionales desconocidas y distintas (Aproximacion de Welch)
def IC_diferencia_medias_varianzas_distintas(X1_barra, X2_barra, S1, S2, n1, n2, t):
    """
    IC para mu1 - mu2 cuando las varianzas son desconocidas y distintas
    Usa la aproximacion de Welch

    Parametros:
    X1_barra, X2_barra: medias muestrales
    S1, S2: desviaciones estandar muestrales
    n1, n2: tamaños muestrales
    t: fractil de t-Student con grados de libertad aproximados
       gl = piso( (S1^2/n1 + S2^2/n2)^2 / ((S1^2/n1)^2/(n1-1) + (S2^2/n2)^2/(n2-1)) )
       t = invT(1 - alfa/2, gl)

    Retorna: tupla (limite_inferior, limite_superior) para mu1 - mu2
    """
    diferencia = X1_barra - X2_barra
    error_estandar = sqrt((S1**2 / n1) + (S2**2 / n2))
    margen = t * error_estandar
    return (diferencia - margen, diferencia + margen)

# Funcion auxiliar para calcular grados de libertad de Welch
def gl_welch(S1, S2, n1, n2):
    """
    Calcula los grados de libertad para la aproximacion de Welch

    Retorna: grados de libertad (valor entero)
    """
    numerador = ((S1**2 / n1) + (S2**2 / n2)) ** 2
    denominador = ((S1**2 / n1)**2 / (n1 - 1)) + ((S2**2 / n2)**2 / (n2 - 1))
    return int(numerador / denominador)

# Caso 4: Datos pareados (muestras dependientes)
def IC_diferencia_pareada(diferencias, t):
    """
    IC para mu_D (media de las diferencias) en datos pareados

    Parametros:
    diferencias: lista de diferencias (D_i = X1_i - X2_i)
    t: fractil de t-Student con (n - 1) grados de libertad
       t = invT(1 - alfa/2, n - 1)

    Retorna: tupla (limite_inferior, limite_superior) para mu_D
    """
    n = len(diferencias)
    D_barra = sum(diferencias) / n
    S_D = sqrt(sum((d - D_barra)**2 for d in diferencias) / (n - 1))
    margen = t * S_D / sqrt(n)
    return (D_barra - margen, D_barra + margen)

# Ejemplo 1: Varianzas conocidas (TP8 - Ej 22)
# X1_barra = 42.1
# X2_barra = 40.5
# sigma1 = 5.8
# sigma2 = 5.2
# n1 = 35
# n2 = 40
# z = 1.96  # invNorm(0.975, 0, 1) para alfa = 0.05
# print("IC varianzas conocidas:", IC_diferencia_medias_varianzas_conocidas(X1_barra, X2_barra, sigma1, sigma2, n1, n2, z))

# Ejemplo 2: Varianzas iguales (TP8 - Ej 23)
# X1_barra = 28.5
# X2_barra = 32.1
# S1 = 4.2
# S2 = 3.8
# n1 = 15
# n2 = 12
# gl = n1 + n2 - 2  # gl = 25
# t = 2.060  # invT(0.975, 25) para alfa = 0.05
# print("IC varianzas iguales:", IC_diferencia_medias_varianzas_iguales(X1_barra, X2_barra, S1, S2, n1, n2, t))

# Ejemplo 3: Varianzas distintas (TP8 - Ej 24)
# X1_barra = 18.7
# X2_barra = 20.3
# S1 = 6.5
# S2 = 3.2
# n1 = 20
# n2 = 25
# gl = gl_welch(S1, S2, n1, n2)  # Calcular gl primero
# print("Grados de libertad Welch:", gl)
# t = 2.021  # invT(0.975, gl) para alfa = 0.05
# print("IC varianzas distintas:", IC_diferencia_medias_varianzas_distintas(X1_barra, X2_barra, S1, S2, n1, n2, t))

# Ejemplo 4: Datos pareados
# diferencias = [2.1, -0.5, 1.8, 3.2, 0.9, 2.5, 1.1]
# n = len(diferencias)
# gl = n - 1  # gl = 6
# t = 2.447  # invT(0.975, 6) para alfa = 0.05
# print("IC datos pareados:", IC_diferencia_pareada(diferencias, t))
