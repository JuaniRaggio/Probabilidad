import math

# {marca de clase (centro del intervalo) : frecuencia}
# Ojo porque el size de los intervalos tiene que ser el mismo
data = {2.5: 2, 7.5: 4, 12.5: 1, 17.5: 1, 22.5: 2}

def total_elements(data):
    total = 0
    for class_mark in data.keys():
        total += data[class_mark]
    return total

def most_popular(data):
    most_popular = list(data.keys())[0]
    for class_mark in data.keys():
        most_popular = class_mark if data[class_mark] > data[most_popular] else most_popular
    return most_popular

def overline(data, n):
    if not n:
        return 0
    sum = 0
    for class_mark in data.keys():
        sum += class_mark * data[class_mark]
    return sum / n

# Varianza
def sigma_pow2(data, n):
    if not n:
        return 0
    sg = 0
    overline_x = overline(data, n)
    for class_mark in data.keys():
        sg += data[class_mark] * ((class_mark - overline_x)**2)
    return sg / (n - 1)

# No es la varianza jajaja
# Es util porque no tiene las unidades al cuadrado
def sigma(data, n):
    return math.sqrt(sigma_pow2(data, n))

def mediana(data):
    # TODO
    raise NotImplemented

# simetria respecto de la media
def simetry_coeficient(data, n):
    s3 = sigma(data, n)**3
    sc = 0
    overline_x = overline(data, n)
    for class_mark in data.keys():
        sc += data[class_mark] * ((class_mark - overline_x)**3)
    return sc/(n * s3)

# concentracion en torno a la media
def kurtosis(data, n):
    s4 = sigma(data, n)**4
    kt = 0
    overline_x = overline(data, n)
    for class_mark in data.keys():
        kt += data[class_mark] * ((class_mark - overline_x)**4)
    return kt/(n * s4) - 3

n = total_elements(data)

print("Most popular: ", round(most_popular(data), 4))
print("mu_X: ", round(overline(data, n), 4))
print("Sigma: ", round(sigma(data, n), 4))
print("V[X] = sg**2: ", round(sigma_pow2(data, n), 4))
print("Coef sim: ", round(simetry_coeficient(data, n), 4))
print("Kurtosis: ", round(kurtosis(data, n), 4))

