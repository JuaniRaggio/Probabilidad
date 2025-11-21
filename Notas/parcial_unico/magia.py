import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# Generate random matrix R (10x2000)
R = np.random.rand(10, 2000)

# Compute S
S = (np.sum(R, axis=0) - 5) / np.sqrt(10/12)

# Histogram
plt.figure()
plt.hist(S, bins=50, density=True, alpha=0.7, edgecolor='black')
plt.title('Histogram of S')
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.grid(True, alpha=0.3)
plt.savefig('histogram.png')

# Sort S and compute empirical CDF
SS = np.sort(S)
F = np.arange(1, 2001) / 2000

# Compute theoretical normal CDF
normcdf_vals = norm.cdf(SS)

# Plot CDFs
plt.figure()
plt.plot(SS, F, label='Empirical CDF', linewidth=2)
plt.plot(SS, normcdf_vals, label='Normal CDF', linewidth=2)
plt.legend()
plt.title('CDF Comparison')
plt.xlabel('Value')
plt.ylabel('Cumulative Probability')
plt.grid(True, alpha=0.3)
plt.savefig('cdf_comparison.png')

# Compute Kolmogorov-Smirnov statistic
D = np.max(np.abs(F - normcdf_vals))

print(f"D = {D}")

plt.show()
