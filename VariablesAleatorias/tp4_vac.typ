= Ejercicio 1

Una variable aleatoria $X$ tiene densidad de probabilidad:

$ f_X (x) = cases(
  c/sqrt(A^2 - x^2) " si" x in (-A, A),
  0 " si" x not in (-A, A),
) $

1. Determine el valor de la constante c para que sean funciones densidad de probabilidad de variables aleatorias continuas (vac) $X$

$ integral_(-infinity)^(infinity) f_X (x) d x = 1 $

$ integral_(-A)^(A) c/sqrt(A^2 - x^2) d x = 1 $

$ c integral_(-A)^(A) 1/sqrt(A^2 - x^2) d x = 1 $

$ c [arcsin(x/A)]_(-A)^(A) = 1 $

$ c pi = 1 => c = 1/pi $

2. Encontrar la funcion de distribucion $F_X (x) = P(X <= x)$

$ F_X (x) = integral_(-A)^x 1/pi 1/sqrt(A^2 - x^2) = 1/pi (arcsin(x/A) - arcsin(-1)) = 1/pi (arcsin(x/A) + pi/2) $

3. Calcule el valor esperado $E[X]$ y la varianza $"Var"[X]$

$ E[X] = integral_(-A)^(A) f_X (x) x d x $

$ E[X] = integral_(-A)^(A) (pi x)/(sqrt(A^2 - x^2)) d x $

$ integral_(-A)^(A) (pi x)/(sqrt(A^2 - x^2)) d x underbrace(=, u = A^2 - x^2\
d u = -2x d x) 1/2 integral pi/sqrt(u) d u $

$ -pi/2 integral 1/sqrt(u) d u = -pi/2 [2 sqrt(A^2 - x^2)]_(-A)^(A) = 0 $

$ E[X] = 0 $

$ "Var"[X] = E[X^2] - E^2[X] $

$ E[X^2] - 0^2 = E[X^2] $

$ E[X^2] = 1/pi integral_(-A)^(A) x^2/sqrt(A^2 - x^2) d x $

\

= Ejercicio 2


Sea $X$ una con dist. unif. en (0, 8). Calcular:

1. $P(2 < X < 5) = 0.625 - 0.25 = 0.375$

2. $P(0 < X < 3 | 0 < X < 5) = P(0 < X < 3)/P(0 < X < 5) = 0.375/0.625 = 0.6$

\

= Ejercicio 3

La funcion densidad de probabilidad $f_X (x)$ de la variable aleatoria continua $X$ es:

$ f_X (x) = cases(
  2 (1 - x) &" si" x in (0, 1),
  0 &" si" x not in (0, 1)
) $

1. Calcular $E[X]$ y $"Var"[X]$

$ E[X] = integral_(- infinity)^(infinity) f_X (x) x d x $

$ E[X] = integral_0^1 2 x - x^2 $

$ E[X] = [x^2 - 1/3 x^3]_0^1 $

#table()[$ E[X] = 1 - 1/3 = 2/3 $]

$ "Var"[X] = E[X^2] - E^2[X] $

#table()[$ "Var"[X] = [1/3 x^3 - 1/4 x^4]_0^1 - 4/9 = -0.361 $]

2. Calcular la mediana $m$ de $X$ definida por $P(X < m) = 0.5$

$ P(X < m) = 0.5 $









