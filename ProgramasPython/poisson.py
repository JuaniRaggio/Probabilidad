from scipy.stats import poisson

k = int(input("Insert k: "))
lam = int(input("Insert lam: "))

print("Poissoncdf: ", poisson.cdf(k, lam))
print("Poissonpdf: ", poisson.pmf(k, lam))
