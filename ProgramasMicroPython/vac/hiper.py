import math

size_poblacion = 80   # tamaño de la población
exitos_en_pob = 60    # número de éxitos en la población
extracciones = 9    # número de extracciones
exitos_deseados = 5    # número de éxitos a evaluar

def hypergeom_pdf(size_poblacion, exitos_en_pob, extracciones, k):
    if k < 0 or k > extracciones or k > exitos_en_pob or extracciones - k > size_poblacion - exitos_en_pob:
        return 0.0
    return (math.comb(exitos_en_pob, k) * math.comb(size_poblacion - exitos_en_pob, extracciones - k)) / math.comb(size_poblacion, extracciones)

def hypergeom_cdf(size_poblacion, exitos_en_pob, extracciones, exitos_deseados):
    total = 0.0
    k_min = max(0, extracciones - (size_poblacion - exitos_en_pob))
    k_max = min(exitos_deseados, exitos_en_pob, extracciones)
    for k in range(k_min, k_max + 1):
        total += hypergeom_pdf(size_poblacion, exitos_en_pob, extracciones, k)
    return total

print("pdf: ", hypergeom_pdf(size_poblacion, exitos_en_pob, extracciones, exitos_deseados))
print("cdf: ", hypergeom_cdf(size_poblacion, exitos_en_pob, extracciones, exitos_deseados))

import unittest
import math
from scipy.stats import hypergeom

class TestHipergeometrica(unittest.TestCase):
    
    def test_pmf_casos_basicos(self):
        # Valores conocidos de ejemplos estándar
        self.assertAlmostEqual(hypergeom_pdf(10, 5, 3, 2), 0.416666, places=4)
        self.assertAlmostEqual(hypergeom_pdf(10, 5, 3, 1), 0.416666, places=4)
        self.assertAlmostEqual(hypergeom_pdf(10, 5, 3, 0), 0.083333, places=4)
    
    def test_pmf_valores_limite(self):
        # Casos límite
        self.assertEqual(hypergeom_pdf(10, 5, 3, -1), 0)  # x negativo
        self.assertEqual(hypergeom_pdf(10, 5, 3, 4), 0)   # x mayor que n
        self.assertAlmostEqual(hypergeom_pdf(10, 5, 3, 3), 0.083333, places=4)  # x = n
    
    def test_cdf_casos_basicos(self):
        # Valores conocidos de ejemplos estándar
        self.assertAlmostEqual(hypergeom_cdf(10, 5, 3, 2), 0.916666, places=4)
        self.assertAlmostEqual(hypergeom_cdf(10, 5, 3, 1), 0.5, places=4)
        self.assertAlmostEqual(hypergeom_cdf(10, 5, 3, 0), 0.083333, places=4)
    
    def test_cdf_valores_limite(self):
        # Casos límite
        self.assertEqual(hypergeom_cdf(10, 5, 3, -1), 0)  # x negativo
        self.assertEqual(hypergeom_cdf(10, 5, 3, 5), 1)   # x mayor que n
        self.assertEqual(hypergeom_cdf(10, 5, 3, 3), 1)   # x = n
    
    def test_consistencia_pmf_cdf(self):
        # Verificar que la CDF es la suma de las PMF
        N, K, n = 20, 8, 5
        suma_pmf = 0
        for x in range(0, n + 1):
            suma_pmf += hypergeom_pdf(N, K, n, x)
            self.assertAlmostEqual(suma_pmf, hypergeom_cdf(N, K, n, x), places=10)
    
    def test_comparacion_con_scipy(self):
        # Comparación con la implementación de scipy para validación
        N, K, n = 50, 20, 10
        for x in range(0, n + 1):
            pmf_custom = hypergeom_pdf(N, K, n, x)
            pmf_scipy = hypergeom.pmf(x, N, K, n)
            self.assertAlmostEqual(pmf_custom, pmf_scipy, places=10)
            
            cdf_custom = hypergeom_cdf(N, K, n, x)
            cdf_scipy = hypergeom.cdf(x, N, K, n)
            self.assertAlmostEqual(cdf_custom, cdf_scipy, places=10)
    
    def test_casos_especiales(self):
        # Casos especiales
        self.assertEqual(hypergeom_pdf(0, 0, 0, 0), 1)  # Población vacía
        self.assertEqual(hypergeom_cdf(0, 0, 0, 0), 1)
        
        # Cuando n = 0
        self.assertEqual(hypergeom_pdf(10, 5, 0, 0), 1)
        self.assertEqual(hypergeom_cdf(10, 5, 0, 0), 1)

if __name__ == '__main__':
    unittest.main()
