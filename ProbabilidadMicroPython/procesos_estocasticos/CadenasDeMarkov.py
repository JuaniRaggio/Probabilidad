P = [
    [0.3, 0.4, 0.3],
    [1, 0, 0],
    [0, 0.3, 0.7]
]

# Evolucion / Paso
p0 = [1/3, 1/3, 1/3]

DIGITS = 4

def matmul(A, B):
    filas = len(A)
    cols = len(B[0])
    comun = len(B)
    resultado = []
    for i in range(filas):
        fila = []
        for j in range(cols):
            suma = 0
            for k in range(comun):
                suma += round(A[i][k] * B[k][j], DIGITS)
            fila.append(suma)
        resultado.append(fila)
    return resultado

def matpow(P, n):
    res = [[1 if i==j else 0 for j in range(len(P))] for i in range(len(P))]
    for _ in range(n):
        res = matmul(res, P)
    return res

def vect_matmul(v, M):
    resultado = []
    for j in range(len(M[0])):
        suma = 0
        for i in range(len(v)):
            suma += round(v[i] * M[i][j], DIGITS)
        resultado.append(suma)
    return resultado

def estacionario_manual(P, iteraciones=100):
    n = len(P)
    pi = [1.0/n] * n
    for _ in range(iteraciones):
        pi = vect_matmul(pi, P)
    return pi

def comunicabilidad(P, max_pasos=10):
    n = len(P)
    C = [[0]*n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if P[i][j] > 0:
                C[i][j] = 1
    for paso in range(2, max_pasos+1):
        Pn = matpow(P, paso)
        for i in range(n):
            for j in range(n):
                if Pn[i][j] > 0:
                    C[i][j] = 1
    return C

def es_irreducible(C):
    for fila in C:
        if sum(fila) < len(C):
            return False
    return True

def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a

def gcd_lista(lista):
    res = lista[0]
    for num in lista[1:]:
        res = gcd(res, num)
    return res

def calcular_periodo(P, estado, max_pasos=20):
    indices = []
    for paso in range(1, max_pasos+1):
        Pn = matpow(P, paso)
        if Pn[estado][estado] > 0:
            indices.append(paso)
    if indices:
        return gcd_lista(indices)
    else:
        return None

suma = 0

for fila in P:
    suma = 0
    for col in fila:
        suma += col
    if suma != 1:
        print("Ojo gordo, la suma de la fila", fila, "no es 1, es", suma, "modificala desde el codigo")

n = int(input("Ingrese la cantidad de pasos (n): "))

Pn = matpow(P, n)
print("La potencia", n, "-esima de la matriz dada:")
for fila in Pn:
    print(fila)
input("Enter continuar...")

p_n = vect_matmul(p0, Pn)
print("Distribucion al paso", n, ":", p_n)
input("Enter continuar...")

pi = estacionario_manual(P)
print("Estado estacionario:", pi)
input("Enter continuar...")

C = comunicabilidad(P)
print("Matriz de comunicabilidad:")
for fila in C:
    print(fila)
input("Enter continuar...")

if es_irreducible(C):
    print("La cadena es irreducible")
else:
    print("La cadena NO es irreducible")

for i in range(len(P)):
    d = calcular_periodo(P, i)
    print("Periodo del estado", i, ":", d)
input("Enter continuar...")
