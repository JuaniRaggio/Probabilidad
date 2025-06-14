from math import sqrt

# Programa especifico para resolver IC de media con datos agrupados

# INPUT: 
# clases = lista de tuplas con los intervalos [(a1, b1), (a2, b2), ...]
# frecuencias = lista de frecuencias [f1, f2, ...]
# alfa = nivel de significancia (por ejemplo: 0.05 para 95%)
# t = fractil de t-Student ya calculado para n-1 grados de libertad

# NOTA: este programa asume que vos le pasas el t correcto (lo podes calcular en la TI)

clases = [(0.96, 0.96), (0.98, 0.98), (10.0, 10.0), (10.2, 10.2), (10.4, 10.4)]
frecuencias = [1, 2, 1, 2, 1]

n = 0
for frec in frecuencias:
    n += frec

gl = n - 1
alfa = 0.05

# OJO ACA
# t = invT(1 - alfa/2, gl)
t = 2.36466242

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


print(IC_media_agrupada(clases, frecuencias, t))
