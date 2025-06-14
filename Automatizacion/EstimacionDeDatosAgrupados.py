from math import sqrt

# Programa especifico para resolver IC de media con datos agrupados

# INPUT: 
# clases = lista de tuplas con los intervalos [(a1, b1), (a2, b2), ...]
# frecuencias = lista de frecuencias [f1, f2, ...]
# alfa = nivel de significancia (por ejemplo: 0.05 para 95%)
# t = fractil de t-Student ya calculado para n-1 grados de libertad

# NOTA: este programa asume que vos le pasas el t correcto (lo podes calcular en la TI)

def marcas_de_clase(clases):
    return [(a + b)/2 for a, b in clases]

def media(marcas, frecuencias, n):
    suma = sum(m * f for m, f in zip(marcas, frecuencias))
    return suma / n

def varianza(marcas, frecuencias, media, n):
    suma = sum(f * (m - media)**2 for m, f in zip(marcas, frecuencias))
    return suma / (n-1)

def IC_media_agrupada(clases, frecuencias, t):
    n = sum(frecuencias)
    marcas = marcas_de_clase(clases)
    media_muestral = media(marcas, frecuencias, n)
    var_muestral = varianza(marcas, frecuencias, media_muestral, n)
    S = sqrt(var_muestral)
    margen = t * S / sqrt(n)
    return (media_muestral - margen, media_muestral + margen)

# Ejemplo con tu ejercicio:
clases = [(0.333, 0.433), (0.433, 0.533), (0.533, 0.633), (0.633, 0.733), (0.733, 0.833), (0.833, 0.933), (0.933, 1.033)]
frecuencias = [4, 12, 19, 28, 48, 25, 14]

n = 0
for frec in frecuencias:
    n += frec

gl = n - 1
alfa = 0.05
# Supongamos que calculaste en la TI: t = invT(1 - alfa/2, gl)

# OJO ACA

t = 1.976 # (poner aca el valor exacto que te da la TI)

print(IC_media_agrupada(clases, frecuencias, t))
