import math

def exp_pdf(x: float, lam: float):
    if x < 0:
        return 0
    return lam * math.exp(-lam * x)

def exp_cdf(x, lam):
    if x < 0:
        return 0
    return 1 - math.exp(-lam * x)

x = float(input("Ingrese x: "))
lam = float(input("Ingrese lambda: "))
print("pdf: ", exp_pdf(x, lam))
print("cdf: ", exp_cdf(x, lam))
