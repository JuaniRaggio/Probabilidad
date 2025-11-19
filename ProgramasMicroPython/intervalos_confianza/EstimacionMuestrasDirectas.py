from math import sqrt

# Este es el programa adaptado para datos muestrales (no agrupados)

# Datos del ejercicio:
datos = [9.8, 10.2, 10.4, 9.8, 10.0, 10.2, 9.6]
n = len(datos)
gl = n - 1
alfa = 0.05
# t es tInv(1 - alfa/2, gl = n - 1)
t = 2.447

def media(datos):
    return sum(datos) / len(datos)

def varianza(datos, media):
    n = len(datos)
    return sum((x - media)**2 for x in datos) / (n - 1)

def IC_media(datos, t):
    n = len(datos)
    x_barra = media(datos)
    S = sqrt(varianza(datos, x_barra))
    margen = t * S / sqrt(n)
    return (x_barra - margen, x_barra + margen)

print(IC_media(datos, t))

