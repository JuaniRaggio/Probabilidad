from scipy.stats import poisson

loop = True

while loop:
    k = int(input("Insert k: "))
    lam = int(input("Insert lam: "))

    print("Poissoncdf: ", poisson.cdf(k, lam))
    print("Poissonpdf: ", poisson.pmf(k, lam))
    loop = True if input("Q+Enter to exit, Enter to continue: ") != "Q" else False

