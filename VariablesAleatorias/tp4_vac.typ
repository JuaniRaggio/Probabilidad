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

$ E[X] = integral_0^1 2 x - 2 x^2 $

$ E[X] = [x^2 - 2/3 x^3]_0^1 $

#align(center)[#table()[$ E[X] = 1 - 2/3 = 1/3 $]]

$ "Var"[X] = E[X^2] - E^2[X] $

#align(center)[#table()[$ "Var"[X] = [2/3 x^3 - 1/2 x^4]_0^1 - 1/9 = 1/18 $]]

2. Calcular la mediana $m$ de $X$ definida por $P(X < m) = 0.5$

$ P(X < m) = 0.5 $

$ [2 x - x^2]_0^m = 0.5 $

$ 2 m - m^2 - 1/2 = 0 $

#align(center)[#table()[$ m = 0.2928 $]]

\

= Ejercicio 6

$ f_X (x) = cases(
  100/x^2 &" si" x > 100,
  0 &" si" x <= 100
) $

$ F_X (x) = cases(
  1 - 100/x &" si" x > 100,
  0 &" si" x <= 100
) $

1. Cual es la probabilidad de que un dispositivo dure menos de 200 hs si se sabe que el dispositivo aun funciona despues de 150 hs de servicio?

$ P(X < 200|X >= 150) = P(150 <= X < 200)/P(X >= 150) = ((1 - 1/2) - (1 - 10/15))/(100/150) = 0.25 $

2. Cual es la probabilidad de que si se instalan 3 de tales dispositivos en un sistema 2 fallen antes de las 150 horas de servicio y el restante despues de las 150 hs

*Si supongo lo mismo que en ejercicio 1*:

$ F_3 = {"Cantidad de fallos de 3 instalaciones de dispositivos dentro de 150 hs"} $

$ P(F_3 = 2) = "Binompdf"("trials" = 3, p = P(X < 150)) = 0.2222 $

3. Cual es el numero maximo de dispositivos que se pueden poner en un sistema para que la probabilidad de que despues de 150 horas de servicio todos ellos funcionen sea 0.4?

$ P(F_"max") = "Binompdf"("trials" = "max", p = P(X < 150)) = 0.4 $

$ P(F_2 = 0) = 0.4444 $

$ P(F_3 = 0) = 0.2962 $

$ => "La cantidad de dispositivos maxima es" 2 $

\

= Ejercicio 7


\

= Ejercicio 10

El tiempo de duracion hasta la falla de un dispositivo mecanico se supone que tiene distribucion exponencial con una media de 400hs

1. Este dispositivo ha funcionado sin fallas durante 400 horas. Cual es la probabilidad de que falle en las proximas 100 horas?

Como tenemos una variable aleatoria *exponencial*, podemos usar la *propiedad de falta de memoria*, esto quiere decir que "no me interesa lo que paso antes" entonces podemos decir que la probabilidad de que falle en las proximas 100 horas despues de haber funcionado durante 400 horas solo importa la probabilidad de que funcione por 100 horas. *Nuestro punto inicial seria 400 horas*

$ X = {"Horas del dispositivo funcionando sin fallas"} $

$ X tilde "exp"(400) $

$ P(X < 500|X > 400) = "expcdf"(x = 100, lambda = 1/400) = 1 - e^(-lambda x) = 0.2212 $

2. Si se ponen a funcionar 10 de estos dispositivos, cual es la probabilidad de que falle al menos uno de ellos antes de 100 horas?. Fallan de forma independiente

$ D = {"Cantidad de disp. que fallan de 10 antes de 100 horas"} $

$ D tilde "Binomial"("trials" = 10, p = P(X < 100)) $

$ P(D >= 1) = 1 - P(D < 1) = 1 - P(D = 0) = 0.91791 $

\

= Ejercicio 12

La duracion de ciertos dispositivos es una variable aleatoria con distribucion exponencial de parametro $lambda (1/"hora")$. La probabilidad de que en una muestra de 5 disp. haya por lo menos uno que dure mas de 1200 hs. es 0.75

$ X = {"Duracion de dispositivo en horas"} $

$ X tilde "expo"(lambda) $

$ Y = {"Cantidad de dispositivos que duran mas de 1200 hs de la muestra de 5"} $

$ Y tilde "Binomial"("trials" = 5, p = 1 - P(X < 1200)) $

1. Hallar $lambda$

*Se despeja de la binomial*

2. Suponga que estos dispositivos se conectan en serie de manera tal que al fallar por lo menos uno de ellos falla todo el sistema. Calcular la probabilidad de que el sistema funcione mas de 1500 horas.

$ S = {"Cantidad de dispositivos de 5 que fallan antes de 1500 hs"} $

$ P(S = 0) = "Binomcdf"("trials" = 5, p = P(X < 1500)) $

\

= Ejercicio 14
Se sabe que la duracion $X$ de una pieza responde a la distribucion de _Weibull_ cuya funcion de distribucion es: $F_X (x) = 1 - e^(-(lambda x)^b), x > 0$ con $b " y " lambda$ constantes reales positivas.
Si $x$ se mide en miles de horas, $b = 2 " y " lambda = 0.01$


1. Obtener la funcion de densidad de probabilidad de la duracion de la pieza

$ f_X (x) = F_X' (x) $

$ f_X (x) = e^(-(0.01 x)^2) . 0.0002 x, x > 0 $

2. Calcular la duracion garantizada $G_90$ con un $90%$ de confiabilidad. _Nota:_ se cumple $P(X > G_90) = 0.9$

$ x \/ P(X > x) = 0.9 => 1 - P(X < x) = 0.9 => e^(-(0.01 x)^2) = 0.9 $
$ -(0.01 x)^2 = ln(0.9) $
$ 0.0001 x^2 = 0.1053605 $
$ x = 32.4592 $

3. Se realizo una prueba con un lote muy grande de piezas y se separaron 1000 con duracion superior a 10_000 horas; cuantas unidades espera ud. haya en este lote de 1_000 cyas duraciones totales sean superiores a 20_000 horas?


\

= Ejercicio 21

El diametro de contacto de la rosca de una union se distribuye normalmente con media $10.02 m m$. Las especificaciones dadas para esa rosca son: $10.00 plus.minus 0.025 m m$ (la especificacion es un intervalo de valores dentro del cual debera estar el diametro para que sea considerado aceptable)

1. Cual es la probabilidad de que la rosca este fuera de la especificacion dada?

2. Suponiendo que el diametro de contacto este centrado en el valor nominal de la especificacion ($10 m m$), cual es la maxima desviacion estandar del diametro aceptable que permitira no mas de una defectuosa entre mil producidas?











