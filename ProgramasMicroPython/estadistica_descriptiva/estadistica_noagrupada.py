import math

data = [1.11, 0.29, 5.9, 6.59, 9.38, 21.22, 14.73, 6.56, 18.79, 24.33]

def normalize(data):
    normalized = {}
    for d in data:
        normalized[d] = 1 if d not in normalized.keys() else normalized[d] + 1
    return normalized

def most_popular(data):
    normalized = normalize(data)
    views = list(normalized.keys())[0]
    for key in normalized.keys():
        views = key if normalized[key] > normalized[views] else views
    return views

def overline(data):
    sum = 0
    for d in data:
        sum += d
    sum /= len(data)
    return sum

# Varianza
def sigma_pow2(data):
    if len(data) == 1:
        return 0
    sg = 0
    overline_x = overline(data)
    for element in data:
        sg += (element - overline_x)**2
    return sg/(len(data) - 1)

# No es la varianza jajaja
# Es util porque no tiene las unidades al cuadrado
def sigma(data):
    return math.sqrt(sigma_pow2(data))

# esto es w
def media_del_desvio_absoluto(data):
    overline_da = 0
    overline_x = overline(data)
    for element in data:
        overline_da += math.fabs(element - overline_x)
    return overline_da/len(data)

def mediana(data):
    # TODO
    raise NotImplemented

def mediana_del_desvio_absoluto(data):
    raise NotImplemented

# simetria respecto de la media
def simetry_coeficient(data):
    s3 = sigma(data)**3
    sc = 0
    overline_x = overline(data)
    for element in data:
        sc += (element - overline_x)**3
    return sc/(len(data)*s3)

# concentracion en torno a la media
def kurtosis(data):
    s4 = sigma(data)**4
    kt = 0
    overline_x = overline(data)
    for element in data:
        kt += (element - overline_x)**4
    return kt/(len(data)*s4) - 3

print("Most popular: ", round(most_popular(data), 4))
print("mu_X: ", round(overline(data), 4))
print("Sigma: ", round(sigma(data), 4))
print("V[X] = sg**2: ", round(sigma_pow2(data), 4))
print("Coef sim: ", round(simetry_coeficient(data), 4))
print("Media del desvio abs: ", round(media_del_desvio_absoluto(data), 4))
print("Kurtosis: ", round(kurtosis(data), 4))

