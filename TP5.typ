= TP 5

== Ejercicio 5
El radio *R* de una esfera se considera una variable aleatoria continua. Supongamos que *R* tiene una funcion de densidad de probabilidad $f_R (r) = 6 r (1 - r), 0 < r < 1$. Obtener la funcion de densidad de probabilidad del volumen *V* y del area *A*

- Sabemos que el _volumen de una esfera_ esta dado por:
$ V = 4/3 pi r^3 $

// $ P(V = v) = P (4/3 pi R^3 = v) = P(R^3 = 3/(4 pi) v) = P(R = (3/(4 pi) v)^(1/3)) $


- Sabemos que el _area_ esta dada por:
$ A = 4 pi r^2 $

- Muy importante usar el siguiente *teorema*

Sea R VAContinua y $f_R(r)$ su densidad, si definimos una nueva variable aleatoria a partir de la misma $V = g(R)$ entonces la densidad de $V$ se obtiene en lo que tendriamos que evaluar:


$ f_V(v) = f_R(g ^(-1)(r)).abs(((d g^(-1))/(d r))) $


Luego usamos el dato que nos dan en el enunciado: $f_R (r) = 6 r (1 - r)$


Derivando $(d R)/(d v) = d ((3/(4 pi) v)^(1/3))/(d v)$


Obtenemos lo siguiente: $ (d R) / (d v) = (1/(4 pi)) (3/(4 pi) v)^(-2/3) $


==== _En simples palabras..._
- Tenes dos variables aleatorias continuas, una depende de la otra, por lo que la otra depende de una
- Si conoces la densidad de una de las dos, podes conocer la densidad de la otra. Como?
1. Escribis la VAC(Densidad conocida) = g(VAC(Densidad *no* conocida)) - _Hallas la inversa_
2. Derivas esa funcion (VAC(Dc)) respecto de la VAC(Dnc)
3. Obtenes el parametro a usar para la funcion de densidad conocida
4. Evaluas con ese parametro a la densidad conocida y multplicas la funcion evaluada por la derivada encontrada
5. Para saber los limites, basta con hallar la _imagen_ de la VAC deseada (los puntos criticos y los extremos son siempre limites)

== Ejercicio 6
El beneficio total de una empresa esta dado por: $B = 10Q - 5 Q^2$ (en miles de pesos)

$Q = "cantidad vendida"$

$0 < Q < 2$

$
f_Q(q) = cases(
  q     & "si" 0 < q < 1,
  2 - q & "si" 1 < q < 2,
)
$

Entonces, suponiendo que $f_Q(q) = 0$, si q < 0 y $f_Q(q) = 1$, si q > 2:

- Para encontrar la acumulada de $Q$ simplemente necesitamos integrar la funcion de densidad

*KEY*:
Cuando se calcula la *acumulada* a partir de la de *densidad* es importante restarle a cada intervalo _la probabilidad acumulada hasta el limite inferior_ 

$
F_Q(q) = cases(
  0 & "si" q < 0,
  q^2/2 - 0 & "si" 0 <= q <= 1,
  2q - q^2/2 - 1 & "si" 1 < q < 2,
  1 & "si" 2 < q
)
$

1. Probabilidad de obtener un beneficio superior a los 3000 pesos

Nos estan pidiendo: $P(B >= 3)$

Esto quiere decir:
$ P(10Q - 5Q^2 >= 3) = P(5Q(2 - Q) >= 3) $

Resolvemos la inecuacion:
$ 10Q - 5Q^2 - 3 >= 0 => Q = cases( Q_1 = 0.3675444, Q_2 = 1.6324555 ) $

Nosotros queremos que la ecuacion sea mayor a cero, como la funcion es continua, por teorema sabemos que no cambia de signo entre raices ni hacia afuera. Evaluamos en 1:

$ 0 - 0 - 3 >=0 => "absurdo!" $

$ 10 - 5 - 3 = 2 >= 0 $

$ 20 - 20 - 3 > 0 => "absurdo!" $


Entonces tomamos el intervalo $(0.367544, 1.6324555)$

$ P(B >= 3) = P(Q in (0.3675444, 1.6324555)) = P(0.3645444 < Q < 1.6324555) $
$ P(B >= 3) = F_Q(1.6324555) - F_Q(0.3645444)  = 0.93224555 - 0.06644 = 0.866 $


2. Calcular el valor esperado de B.

$ mu _B = integral _(-infinity)^(infinity) b f_B(b) $

Entonces necesitamos saber la funcion de densidad de B para calcular la esperanza, la cual se puede deducir de lo anteriormente desarrollado

- Usamos el mismo procedimiento que en ejercicios anteriores:

1. Escribis la VAC(Densidad conocida) = g(VAC(Densidad *no* conocida)) - _Hallas la inversa_
En este caso la Densidad conocida es la de $Q$

$ P(B = b) = f_B(b) = P(10Q - 5 Q^2 = b) = P(10Q - 5 Q^2 - b = 0) $

$ Q = (-10 plus.minus sqrt(100 - 20b))/(-10) $

2. Derivas esa funcion (VAC(Dc)) respecto de la VAC(Dnc)

En este caso como tenemos dos Qs:

$Q_1$:

$ f_B(b) = ()/() $

3. Obtenes el parametro a usar para la funcion de densidad conocida
4. Evaluas con ese parametro a la densidad conocida y multplicas la funcion evaluada por la derivada encontrada




3. Obtener la funcion de distribucion de B


== Ejercicio 7

El costo $C$ para producir una cantidad $X$ de un producto viene dado por $C(X) = (X - 4)(X - 8) + 10$ (en miles de pesos). Suponga que $X$ es una VAC con distribucion Uniforme (4, 8)

_Calcular:_
- $P(C > 9)$

- $E[C]$

- $f_C(c)$

Notemos que es el mismo caso de siempre:

1. Tenemos una VAC con distribucion conocida
2. Tenemos la relacion entre esa VAC y una VAC que queremos conocer

Entonces vamos a proceder como siempre

1. Busco los limites de la variable desconocida

$(d C)/(d X) = (X^2 - 12X + 42)' = 0 => X = 6$

$ C(6) = 6 $
$ C(4) = 0 + 10 = 10 $
$ C(8) = 0 + 10 = 10 $

Entonces:

$ Im \(C\) = [6, 10] $

$P(C > 9) = P(X^2 - 12 X + 42 - 9 > 0) = P(X^2 - 12 X + 33 > 0)$

$ X = cases(
  x_1 = 6 + 2 sqrt(3)/2 = 6 + sqrt(3),
  x_2 = 6 - 2 sqrt(3)/2 = 6 - sqrt(3)
) $

- Queremos que $X$ sea mayor a 0 entonces queremos caer en un valor de la parabola en el que estemos en la parte positiva y esto pasa en el caso en el que estemos *hacia afuera* en la parabola pues es positiva

Basta con pedir:
$ X < x_2 or X > x_1 -> "pues esto nos hace caer en la parte positiva" $

$ P(C > 9) = P(X^2 - 12 X + 33 > 0) = underbrace(P(4 < X < x_2) + P(8 > X > x_1), "probabilidad del 'or' teniendo en cuenta los limites") $

$ P(C > 9) = P(X < x_2) - underbrace(P(X < 4), 0 "pues 4 es limite") + 1 - P(X <= x_1) $

$ P(C > 9) = "Unifcdf"(x_2) - "Unifcdf"(4) + 1 - "Unifcdf"(x_1) $

$ P(C > 9) = 0.06698729799999992 - 0.9330127020000001 + 1 = 0.133975 $

Luego para encontrar $E[C]$ necesitamos $f_C(c)$

Ya tenemos los *limites de la imagen* de C y faltaria *hallar las integrales para las zonas que es valido calcularlas*


$ C = X^2 - 12 X + 42 $

Queremos hallar:
$ f_C(c) = P(C = c) => X^2 - 12 X + 42 - c = 0 $

$ X = cases(
  x_1 = 6 - sqrt(c - 6),
  x_2 = 6 + sqrt(c - 6)
) $

Finalmente usamos el *teorema* que nos dice:

$ f_C(c) = f_X(x_1(c)) . abs((d)/(d c) x_1(c)) + f_X(x_2(c)) . abs((d)/(d c) x_2 (c)) $

$ f_C(c) = 1/4 abs(underbrace((-1)/(2 sqrt(c - 6)), "derivada de" x_1)) + 1/4 abs(underbrace(1/(2 sqrt(c - 6)), "derivada de" x_2)) $

$ f_C(c) = 1/4 1/sqrt(c - 6) $

Luego para hallar $E[C]$, usamos la definicion de media continua

$ E[C] = integral _(-infinity)^(infinity) c f_C(c) d c $
$ E[C] = integral _(-infinity)^(6) c underbrace(f_C(c), c < 6 => 0) d c + integral _6^10 c f_C(c) d c + integral _10^(infinity) c underbrace(f_C(c), c > 10 => 0) d c $
$ E[C] = integral _6^10 c f_C(c) d c = 1/8 integral _6^10 c/sqrt(c - 6) d c $
$ u = c - 6 => d u = d c $
$ E[C] = 1/4 integral _6^10 (u + 6)/sqrt(u) d u  $
$ E[C] = 1/4 (integral _6^10 sqrt(u) d u + 6 integral _6^10 1/sqrt(u) d u) $
$ E[C] = 1/4( (c - 6)^(3/2)|_6^10 + 6 (sqrt(c - 6))|_6^10 ) $
$ E[C] = 22/3 $

== Ejercicio 8

Una corriente electrica de variable $I$ se puede considerar como una variable aleatoria distribuida uniformemente en el intervalo $(9, 11)$. Si esta corriente pasa por una resistencia de $2 Omega$ entonces la potencia desipada $W$ viene dada por $W = 2 I^2$

1. Obtener la funcion densidad de probabilidad de $W$
2. Calcular $E[W], "VAR"[W]$
3. Calcular $P(W > E[W])$

Lo mismo de siempre, piden la funcion de densidad de probabilidad de una VAC que depende de otra la cual _si conocemos su densidad_

- Escribimos la VAC de densidad conocida en funcion de la desconocida:
$ I = sqrt(W/2) $

$ P(I = i) = "Unifpdf"(9, 11, i) = cases(
  0 & "si" i < 9,
  1/2 & "si" 9 < i < 11,
  0 & "si" 11 < i
) $

Proseguimos como siempre: _derivamos la funcion que depende de la desconocida_

$ (d I)/(d W) = g(w) = (1)/(4 sqrt(W/2)) $

Seguimos con lo mismo de siempre...

$ f_W(w) = f_I(i).|g(w)| = underbrace(1/2, "OJO, es" f_I(i)) 1/(4 sqrt(W/2)) = 1/(8 sqrt(W/2)) $

Ademas para los limites hariamos lo siguiente:

$ 9 < sqrt(W/2) < 11 => 162 < W < 242 $

Conclusion:

$ f_W(w) = 1/(8 sqrt(W/2)) II _(\(162, 242\)) 0 $


- Para el punto 2 basta con usar la definicion de media continua

$ E[W] = integral _(-infinity)^(infinity) f_W(w) w d w = integral _(162)^(242) f_W(w) w d w $

_Nota:_ Esta integral no es trivial(hay que hacer por partes y no me acuerdo) por lo que voy a optar por calcularla a partir de $I$

Planteamos lo siguiente y notamos que piden I^2

$ E[W] = E[2I^2] = 2E[I^2] $

Por la formula de la uniforme:

$ mu _I = (a + b)/2 = 10 $

Mientras que la varianza es:

$ V[I] = (b - a)^2 /12 = E[I^2] - E^2[I]  = -(mu _I)^2 + E[I^2] $

$ (2)^2 = -1200 + 12 E[I^2] $

$ 1204/12 = E[I^2] $

Retomando...

$ E[W] = 2E[I^2] = 2 times 1204/12 = 200.666 $

$ V[W] = E[W^2] - E^2[W] = E[W^2] - (200.666)^2 = 533.689 $

$ E[W^2] = 4E[I^4] = 4 integral _a^b i^4 f_I(i) d i = 2 integral _a^b i ^4 d i= 2/5 i^5|_9^11 = 2/5 (11^5 - 9 ^5) = 40800.8  $

- Para el punto 3 piden $P(W > E[W] = 200.666)$

$ P(W > 200.666) = P(2I^2 > 200.666) $
$ P(I > sqrt(100.333)) = 1 - P(I < sqrt(100.333)) = 1 - (sqrt(100.333) - 9)(2) = 0.491681 $


== Ejercicio 9

La variable aleatoria continua $X$ tiene una funcion densidad de probabilidad tal que:
$ f_X(x) = cases(
  x + 1 && x in (-1, 0),
  1 - x && x in (0, 1),
  0 & "elsewhere"
) $

1. Obtener las funciones de distribucion y probabilidad de: $Y = X^2$
2. Determinar $E[Y], "Var"[Y]$

En este caso la funcion $|X| = g(Y) = sqrt(Y)$ _no es monotona_ ya que es una *funcion par*

Su raiz esta en $Y = 0$, las ramas de la funcion seran:

$ x = plus.minus sqrt(y) $

Entonces vamos a usar el *teorema general* que acepta monotonia por partes:

Tenemos que usar
$ f_Y(y) = f_X(sqrt(y))/(2 sqrt(y)) + f_X(-sqrt(y))/(2 sqrt(y)) $
$ f_Y(y) = (1 - sqrt(y))/(2 sqrt(y)) + (1 + sqrt(y))/(2 sqrt(y)) $
$ f_Y(y) = ((1 - sqrt(y)) + (1 - sqrt(y))) /(2 sqrt(y)) $


_El siguiente renglon es INCORRECTO_. Pues cuando usamos el *teorema general* no hay que evaluar la densidad conocida en las raices sino que en las preimagenes, de esta forma siempre *quedara algebraico*
$ f_Y(y) = f_X(+0)/abs(g'(y)) + f_X(-0)/abs(-g'(y)) $


2. Si usamos la densidad que les da a ellos
$ f_Y(y) = (1/sqrt(y) - 1) II_(\(0, 1\)) (y) $

$ E[Y] = E[X^2] $











