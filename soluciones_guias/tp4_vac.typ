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

= Ejercicio 4
La variable aleatoria continua $X$ tiene por funcion densidad de probabilidad
$f_X (x) = x/2, 0 < x < 2$ y $0$ fuera de ese intervalo. Si se hacen:

1. Dos determinaciones independientes de $X$, cual es la probabilidad de que ambas sean mayores que 1

$ P(X_1 > 1 inter X_2 > 1) = P(X_1 > 1).P(X_2 > 1) $

$ P(X > 1) = 1 - P(X <= 1) => "Tenemos que hallar la funcion acumulada" $
$ F_X (x) = x^2 / 4, 0 < x < 2 $

$ P(X > 1) = 1 - 1/4 = 3/4 $

$ P(X_1 > 1).P(X_2 > 1) = 9/16 = 0.5625 $

#align(center)[#table()[$P(X > 1) = 9/16$]]

2. Tres determinaciones independientes, cual es la probabilidad de que exactamente dos sean mayores que 1?

$ D = {"Cantidad de determinaciones que dan mayor a 1 dentro de 3"} $

$ D tilde "Binomial"(p = 3/4, t = 3) $

#align(center)[#table()[$P(D = 2) = 0.4218 = $]]

\

= Ejercicio 5

El porcentaje de alcohol ($100 X$) en cierto compuesto se puede considerar 
una variable aleatoria continua, en donde $X$ verifica $0 < X < 1$ y tiene la
funcion de densidad $f_X (x) = 20 x^3 (1 - x), 0 < x < 1$ y $0$ fuera del 
intervalo

1. Determinar la funcion de distribucion $F_X$ y representarla graficamente

$ F_X (x) = integral _(-infinity)^(infinity) f_X (x) d x  $
$ F_X (x) = 20 integral x^3 - x^4 d x $
$ F_X (x) = 20 (integral x^3 d x - integral x^4 d x) $
#align(center)[#table()[$F_X (x) = 20 [x^4 / 4 - x^5 / 5]$]]


2. Calcular $P[(X < 1/2)/(1/3 < X < 2/3)]$


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

El colectivo de cierta linea va a un horario estricto con intervalos de 5
minutos. Calcular la probabilidad de que un pasajero que se acerque a la
parada en un instante al azar tenga que esperar el colectivo menos de tres
minutos. Suponga que el instante de llegada del pasajero a la parada es una
variable aleatoria continua con distribucion uniforme en (0, 5)

$ L = {"Llegada de un pasajero a la parada"} $
$ L tilde "Unif"(0, 5) $

- Estaria mal modelar la llegada de los colectivos como una variable aleatoria porque dice que tiene un horario estricto, entonces buscamos:

$ W = {"Tiempo de espera del pasajero"} $
$ W = 5 - L $
$ W tilde "Unif"(0, 5) $
$ P(W < 3) = 0.6 $

\

= Ejercicio 8

La duracion en horas de un sistema puede considerarse una variable aleatoria
continua con distribucion exponencial de parametro caracteristico
$0.001 "hora"^(-1)$

a. Una empresa que produce este sistema desea garantizarlo durante cierto 
tiempo. Cuantas horas lo debe amparar la garantia de buen funcionamiento
para asegurar, con probabilidad $0.95$, que el sistema funcionara como minimo
el numero de horas garantizadas.



b. Un dispositivo utiliza cinco de estos sistemas y funciona si todos ellos
lo hacen. Los sistemas funcionan (y fallan) en forma independiente. Cual es
la probabilidad de que el dispositivo opere, por lo menos, 100 horas? Y 1000
horas?



c. Otro dispositivo tambien utiliza cinco de estos sistemas y funciona
mientras lo hagan por lo menos tres de ellos (no suponga ninguna conexion en
especial). Los sistemas funcionan (y tambien fallan) en forma independiente.
Cual es la probabilidad de que el dispositivo funcione aun al cabo de 1000
horas?

\

= Ejercicio 9

Un sistema esta integrado por dos componentes A y B que fallan al azar en 
promedio 1 vez cada 500 y 800 horas respectivamente. El sistema falla cuando 
cualquiera de dichos componentes falla. Se supone que estos componentes
fallan en forma independiente y que el tiempo entre fallas es una variable
aleatoria con distribucion exponencial. Cual es la probabilidad de que el
sistema falle despues de transcurridas las primeras 1000 horas?

$ A tilde "expo"(lambda = 1/500 "hrs") $
$ B tilde "expo"(lambda = 1/800 "hrs") $
$ D = {"Tiempo hasta que el sistema falla"} $

- Me piden la probabilidad de que el sistema falle *despues* de transcurridas las primeras 1000 horas

$ P(D > 1000) = P(A > 1000 inter B > 1000) = P(A > 1000) times P(B > 1000) $
$ P(A > 1000) = 1 - P(A < 1000) = 1 - 1 + e^(-1/500 1000) = 1 - 0.8647 $
$ P(B > 1000) = 1 - P(B < 1000) = 1 - 1 + e^(-1/800 1000) = 1 - 0.7135 $

#align(center)[#table()[$P(D > 1000) = 0.0388$]]

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

= Ejercicio 11

Un sistema consta de $n$ componentes identicos conectados en serie. Cuando
falla por lo menos un componente, falla todo el sistema. Suponga que la
duracion de cada componente es una variable aleatoria con distribucion
exponencial de parametro $lambda = 0.01 1/"hora"$, y que los componentes
fallan independientemente uno de otro. Defina los sucesos independientes
$A_i = "i-esimo componente dura por lo menos t horas"$, $i = 1, ..., n$. Sea
$T$ el tiempo en el que falla el sistema, esto es, la duracion minima de
funcionamiento entre los $n$ componentes. Considerando la independecia de los
sucesos $A_i$, obtenga $F_T (t) = P(T < t)$ y la funcion densidad de 
probabilidad de $T$.
1. Que tipo de distribucion de probabilidades tiene $T$?
2. Cual es el valor esperado de $T$?

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











