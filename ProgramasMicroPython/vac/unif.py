def unif_pdf(x, a, b):
    if a <= x <= b:
        return 1 / (b - a)
    return 0

def unif_cdf(x, a, b):
    if x < a:
        return 0
    elif x <= b:
        return (x - a) / (b - a)
    else:
        return 1

x = float(input("x: "))
a = float(input("a: "))
b = float(input("b: "))
print("cdf: ", unif_cdf(x, a, b))
print("pdf: ", unif_pdf(x, a, b))
