from math import sqrt

def IC_diferencia_proporciones(p1_hat, p2_hat, n1, n2, z):
    """
    IC para p1 - p2 (diferencia de proporciones poblacionales)

    Parametros:
    p1_hat: proporcion muestral del grupo 1 (exitos1 / n1)
    p2_hat: proporcion muestral del grupo 2 (exitos2 / n2)
    n1, n2: tamaños muestrales
    z: fractil de la normal estandar (invNorm(1 - alfa/2, 0, 1))

    Retorna: tupla (limite_inferior, limite_superior) para p1 - p2
    """
    diferencia = p1_hat - p2_hat
    error_estandar = sqrt((p1_hat * (1 - p1_hat) / n1) + (p2_hat * (1 - p2_hat) / n2))
    margen = z * error_estandar
    return (diferencia - margen, diferencia + margen)

def IC_diferencia_proporciones_desde_exitos(x1, x2, n1, n2, z):
    """
    IC para p1 - p2 cuando tenemos el numero de exitos directamente

    Parametros:
    x1, x2: numero de exitos en cada muestra
    n1, n2: tamaños muestrales
    z: fractil de la normal estandar (invNorm(1 - alfa/2, 0, 1))

    Retorna: tupla (limite_inferior, limite_superior) para p1 - p2
    """
    p1_hat = x1 / n1
    p2_hat = x2 / n2
    return IC_diferencia_proporciones(p1_hat, p2_hat, n1, n2, z)

# Ejemplo 1: Con proporciones directas (TP8 - Ej 25)
# Grupo 1: 45 exitos de 200 => p1_hat = 0.225
# Grupo 2: 38 exitos de 180 => p2_hat = 0.211
# p1_hat = 0.225
# p2_hat = 0.211
# n1 = 200
# n2 = 180
# z = 1.96  # invNorm(0.975, 0, 1) para alfa = 0.05
# print("IC diferencia proporciones:", IC_diferencia_proporciones(p1_hat, p2_hat, n1, n2, z))

# Ejemplo 2: Con numero de exitos
# x1 = 45
# x2 = 38
# n1 = 200
# n2 = 180
# z = 1.96
# print("IC desde exitos:", IC_diferencia_proporciones_desde_exitos(x1, x2, n1, n2, z))
