import math

def fact(n):
    res = 1
    while n > 0:
        res *= n
        n -= 1
    return res

def gamma_pdf(x, n, lam):
    if x < 0:
        return 0
    if n <= 0 or lam <= 0:
        return 0

    # PDF: (lambda^n * x^(n-1) * e^(-lambda*x)) / (n-1)!
    factorial_n_minus_1 = fact(n - 1)
    return (lam**n * x**(n - 1) * math.exp(-lam * x)) / factorial_n_minus_1

def gamma_cdf(x, n, lam):
    if x < 0:
        return 0
    if n <= 0 or lam <= 0:
        return 0

    # CDF: 1 - sum_{k=0}^{n-1} [(lambda*x)^k * e^(-lambda*x)] / k!
    # Compute e^(-lambda*x) once outside the loop
    exp_term = math.exp(-lam * x)
    suma = 0.0
    lam_x = lam * x

    # Use iterative calculation to avoid repeated factorial computations
    term = exp_term  # k=0: (lam*x)^0 / 0! * exp(-lam*x) = exp(-lam*x)
    suma = term

    for k in range(1, n):
        term = term * lam_x / k  # (lam*x)^k / k! * exp(-lam*x)
        suma += term

    return 1 - suma

x = float(input("Ingrese x: "))
n = int(input("Ingrese n: "))
lam = float(input("Ingrese lambda: "))
print("pdf: ", gamma_pdf(x, n, lam))
print("cdf: ", gamma_cdf(x, n, lam))
