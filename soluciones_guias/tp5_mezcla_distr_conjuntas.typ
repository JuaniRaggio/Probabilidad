#set document(
  title: "Solucion guia 5",
  author: "Juan Ignacio Raggio",
)

#set page(
  paper: "a4",
  margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 2cm,
    right: 2cm,
  ),
  numbering: "1",
  number-align: bottom + right,

  header: [
    #set text(size: 9pt, fill: gray)
    #grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      [Juan Ignacio Raggio],
      [],
      [#datetime.today().display("[day]/[month]/[year]")]
    )
    #line(length: 100%, stroke: 0.5pt + gray)
  ],

  footer: context [
    #set text(size: 9pt, fill: gray)
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(0.2em)
    #align(center)[
      Pagina #counter(page).display() de #counter(page).final().first()
    ]
  ]
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "es",
  hyphenate: true,
)

#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 0em,
  spacing: 1.2em,
)

#set heading(numbering: "1.1")
#show heading.where(level: 1): set text(size: 16pt, weight: "bold")
#show heading.where(level: 2): set text(size: 14pt, weight: "bold")
#show heading.where(level: 3): set text(size: 12pt, weight: "bold")

#show heading: it => {
  v(0.5em)
  it
  v(0.3em)
}

#set list(indent: 1em, marker: ("•", "◦", "▪"))
#set enum(indent: 1em, numbering: "1.a.")

#show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  width: 100%,
)

#show link: underline

// ====================================
// FUNCIONES UTILES
// ====================================

// Funcion para crear una caja de nota/observacion
#let nota(contenido) = {
  block(
    fill: rgb("#E3F2FD"),
    stroke: rgb("#1976D2") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#1976D2"))[Nota:] #contenido
  ]
}

// Funcion para crear una caja de advertencia
#let importante(contenido) = {
  block(
    fill: rgb("#FFF3E0"),
    stroke: rgb("#F57C00") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#F57C00"))[Importante:] #contenido
  ]
}

// Funcion para crear una caja de error comun
#let error(contenido) = {
  block(
    fill: rgb("#FFEBEE"),
    stroke: rgb("#D32F2F") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#D32F2F"))[Error Comun:] #contenido
  ]
}

// Funcion para crear una caja de tip
#let tip(contenido) = {
  block(
    fill: rgb("#E8F5E9"),
    stroke: rgb("#388E3C") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#388E3C"))[Tip:] #contenido
  ]
}

// ====================================
// PORTADA
// ====================================

#align(center)[
  #v(1em)
  #text(size: 24pt, weight: "bold")[Probabilidad y Estadistica]
  #v(0.5em)
  #text(size: 18pt)[Soluciones]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Guia 5 - Mezcla de variables aleatorias \
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)


= TP 5

#tip[
  *Transformaciones afines*
  Sea $X$ una vad y $a, b in RR$. Si definimos $Y = a X + b$:
  $ E[Y] = a E[X] + b $
  $ "Var"[Y] = a^2 "Var"[X] $

  Si $X$ es va. Normal y $a != 0 => Y tilde "Normal"$
  $ Z tilde N(0, 1) => X = sigma_X Z + mu_X tilde N(mu_X, sigma_X) $
  $ X tilde N(mu_X, sigma_X) => Z = (X - mu_X)/sigma_X tilde N(0, 1) $
]

== Variables discretas

Sea $X$ vad., con recorrido y funcion de probabilidad:

#table(columns: 5)[x][-2][-1][1][2][$p_X(x)$][0.1][0.3][0.2][0.4]

Obtener la funcion de probabilidad, el valor esperado y varianza de $Y$:

a) $Y = 3 X$

#error[
  Cuando calculo la varianza, hay que tener cuidado de *usar la esperanza de 
  $X$* y no la de $Y$
]

  - $E[Y] = 3 E[X] = 3 (-2 times 0.1 - 1 times 0.3 + 1 times 0.2 + 2 times 0.4) = 1.5$
  - $"Var"[Y] = 9 "Var"[X] = 9 (E[X^2] - E^2[X]) = 9 times (2.5 - 0.5^2) = 20.25$
  - $F_Y(y) = P(Y <= y) = P(3X <= y) = P(X <= y/3) = F_X (y/3)$

  Luego:
  #align(center)[
    #table(columns: 5)[$y_i$][-6][-3][3][6][$p_i$][0.1][0.3][0.2][0.4]
  ]

b) $Y = X^2$

  - $F_Y (y) = P(Y <= y) = P(X^2 <= y) = P(X <= sqrt(y)) = cases(
    0.1 " si " sqrt(y) = -2,
    0.4 " si " sqrt(y) = -1,
    0.6 " si " sqrt(y) = 1,
    1 " si " sqrt(y) = 2
  )$
  - $E[Y] = E[X^2] = 2.5$
  - $"Var"[Y] = "Var"[X^2] = E[X^4] - E^2[X^2] = 8.5 - 6.25 = 2.25$

  Luego:
  #align(center)[
    #table(columns: 3)[$y_i$][1][4][$p_i$][0.5][0.5]
  ]

c) $Y = 2 X^3$

  - $F_Y (y) = P(Y <= y) = P(2 X^3 <= y)$
  - $E[Y] = 2 E[X^3] = 2 (-8 times 0.1 - 0.3 + 0.2 + 8 times  0.4) = 4.6$
  - $"Var"[Y] = 4 "Var"[X^3] = 4 (E[X^6] - E^2[X^3]) = 4 (32.5 - 5.29) = 108.84$

== Ejercicio 2

La variable aleatoria $Z$ tiene distribucion normal standard

1. Obtener la distribucion de probabilidades de la variable $X = m +s Z$
  donde $m$ y $s$ son constantes reales y $s > 0$

  $ X = sigma_X Z + mu_X tilde N(mu_X, sigma_X) $

2. Obtener la funcion densidad de probabilidad de $X = Z^2$

  $ X = Z^2 => F_X (x) = P(X <= x) = P(Z^2 <= x) = P(-sqrt(x) <= Z <= sqrt(x)) $

  $ => F_X (x) = "Normalcdf"(sqrt(n)) - "Normalcdf"(-sqrt(n)) $
  $ Phi(sqrt(n)) - (1 - Phi(sqrt(n))) = 2 Phi(sqrt(n)) - 1  $

#importante[
  Como la normal es simentrica (en caso de estar normalizada), podemos
  hacer:
  $ "Normalcdf"(-x) = Phi(-x) = 1 - Phi(x) $

  _Si lo pensamos graficamente, seria como pensar:_
  El area en la cola izquierda $P(X <= -x)$ es exactamente lo mismo que
  el area en la cola derecha $1 - P(X <= x)$
]

  $ f_X (x) = cases(
    2 Phi(sqrt(x)) - 1 " si " x in [0; +infinity)
    0 " si " x not in [0, + infinity)
  ) $

== Ejercicio 3

La variable aleatoria $U$ tiene distribucion uniforme en $(0, 1)$

Primero importante definir:
$ U tilde "Unif"(a, b) -> F_U (u) = cases(
  0 " if " u <= a,
  (u - a)/(b - a) " if " 0 <= u <= 1,
  1 " if " u >= 1
) $

1. Obtener la ditribucion de probabilidades de $W = U^2$

$ F_W (w) = P(W <= w) = P(U^2 <= w) = P(-sqrt(w) <= U <= sqrt(w)) $

$ P(-sqrt(w) <= U <= sqrt(w)) = P(U <= sqrt(w)) - P(-sqrt(w) <= U) = P(U<= sqrt(w)) - 0 $

$ F_W (w) = P(U <= sqrt(w)) $

2. Demostrar que $X = (-1)/lambda ln(1 - U), lambda > 0$, es una VA. con
  distribucion exponencial de parametro $lambda$. Realice una simulacion
  generando 10 valores de $X$ si $lambda = 5$ usando el generador de
  numeros aleatorios de su calculadora de mano

  Buscamos $ F_X (x) = P(X <= x) = P(-1/lambda ln(1 - U) <= x) = P(U <= 1 - e^(- lambda x)) = F_U (1 - e ^(- lambda x)) $

  $ F_X (x) = cases(
    1 - e ^(-lambda x) " si " x >= 0,
    0 " si " x < 0
  ) $

  #importante[
    De donde salen los limites?
    - Evaluas en la funcion $F_U (u)$
    - Evaluas en las desigualdades de los limites y despejas $x$
  ]

  $ 0 <= 1 - e ^(lambda x) <= 1 => e ^(-lambda x) <= 1 <= 1 + e ^(-lambda x) => $

  Por lo tanto, $X tilde "Exp"(lambda)$

== Ejercicio 4

La variable aleatoria $X$ tiene distribucion uniforme en $(1, 3)$

_Usando la definicion de uniforme, sabemos que..._

$ X tilde "Unif"(u) => F_X(x) = cases(
  0 " si " 0 <= x,
  (x - 1)/(3 - 1) " si " 1 <= x <= 3,
  1 " si " x > 3
) $

1. Obtener las funciones densidad de probabilidad de $Y = 3 X + 4$ y 
  $Z = e^X$

  $ F_Y (y) = P(Y <= y) = P(3 X + 4 <= y) = P(X <= (y - 4)/3) = F_X ((y - 4)/3) $

#tip[
  Pensar que vos cuando haces el pasaje de $x -> y$, queres que se sigan
  obteniendo los mismos "rangos", notemos que:

  $ "Caso2"(7) = (7 - 7)/6 = (1 - 1)/(3 - 1) = 0 $
  $ "Caso2"(13) = (13 - 7)/6 = (3 - 1)/(3 - 1) = 1 $
]

  $ F_Y (y) = cases(
    0 " si " y <= 7,
    (y - 7)/6 " si " 7 <= y <= 13,
    1 " si " 13 <= y
  ) $

  $ f_Y (y) = cases(
    0 " si " y not in (7, 13),
    1/6 " si " y in (7, 13)
  ) $

  Luego para $Z$:
  $ F_Z (z) = P(Z <= z) = P(e^X <= z) = P(X <= ln(z)) $

2. Calcular los valores esperados de $Y$ y $Z$

$ E[Y] =  $

== Ejercicio 5
El radio *R* de una esfera se considera una variable aleatoria continua.
Supongamos que *R* tiene una funcion de densidad de probabilidad 
$f_R (r) = 6 r (1 - r), 0 < r < 1$. Obtener la funcion de densidad de 
probabilidad del volumen *V* y del area *A*

- Sabemos que el _volumen de una esfera_ esta dado por:
$ V = 4/3 pi r^3 $

- Sabemos que el _area_ esta dada por:
$ A = 4 pi r^2 $

- Como el radio viene dado por la funcion de densidad de probabilidad, podemos
  poner el Area y el Volumen en funcion del radio. De esta forma se encuentra
  la funcion de densidad del mismo

_Hallamos el Radio en funcion del volumen y Area_

- $ R = root(3, ((3 pi)/4 v)) $
- $ R = sqrt(a/(4 pi)) $

Para encontrar la densidad de $V$:

$ F_V (v) = P(V <= v) = P(4/3 pi . R^3) = P(R <= root(3, (3 v)/(4 pi))) = F_R (root(3, (3 v)/(4 pi))) $

_Notemos que_ encontramos la distribucion de $V$ en funcion de la distribucion de $R$.
Como nos piden la densidad de $V$, podemos derivar la expresion obtenida para encontrar la densidad

$ f_V (v) = (d F_V (v))/(d v) = (d F_R (root(3, (3 v)/(4 pi))))/(d v) underbrace(=, "x composicion") 
f_R (root(3, (3 v)/(4 pi))) . d/(d v) (root(3, (3 v)/(4 pi))) $

#importante[*Teorema*:
  Sea R VAContinua y $f_R (r)$ su densidad, si definimos una nueva variable 
  aleatoria a partir de la misma $V = g(R)$ entonces la densidad de $V$
  se obtiene en lo que tendriamos que evaluar:
  $ f_V(v) = f_R(g ^(-1)(r)).abs(((d g^(-1))/(d r))) $
]

#tip[
  Muchas veces los rangos de los limites los da la propia funcion partida, no
  es necesario encontrarlos de una forma rara
]

Luego usamos el dato que nos dan en el enunciado: $f_R (r) = 6 r (1 - r)$


Derivando $(d R)/(d v) = d ((3/(4 pi) v)^(1/3))/(d v)$

Obtenemos lo siguiente: $ (d R) / (d v) = (1/(4 pi)) (3/(4 pi) v)^(-2/3) $

#tip[_En simples palabras..._
  - Tenes dos variables aleatorias continuas, una depende de la otra, por lo que la otra depende de una
  - Si conoces la densidad de una de las dos, podes conocer la densidad de la otra. Como?
  1. Escribis la VAC(Densidad conocida) = g(VAC(Densidad *no* conocida)) - _Hallas la inversa_
  2. Derivas esa funcion (VAC(Dc)) respecto de la VAC(Dnc)
  3. Obtenes el parametro a usar para la funcion de densidad conocida
  4. Evaluas con ese parametro a la densidad conocida y multplicas la funcion evaluada por la derivada encontrada
  5. Para saber los limites, basta con hallar la _imagen_ de la VAC deseada (los puntos criticos y los extremos son siempre limites)
]

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
$ f_Y(y) = (2 - 2 sqrt(y))/(2 sqrt(y)) = (1/sqrt(y) - 1) II_(\(0, 1\))(y) $


_El siguiente renglon es INCORRECTO_. Pues cuando usamos el *teorema general* no hay que evaluar la densidad conocida en las raices sino que en las preimagenes, de esta forma siempre *quedara algebraico*

MAL: $f_Y(y) = f_X(+0)/abs(g'(y)) + f_X(-0)/abs(-g'(y))$


2. Determinar $mu_y, sigma^2_y$
$ f_Y(y) = (1/sqrt(y) - 1) II_(\(0, 1\)) (y) $

$ E[Y] = mu_y = integral_(-infinity)^(infinity) y f_Y(y) d y $
$ mu_y = integral_0^1 y f_Y(y) d y $
$ mu_y = integral_0^1 y/sqrt(y) - y d y = integral_0^1 sqrt(y) d y - integral_0^1 y d y = 0.1667 $

Por otro lado:
$ sigma_y^2 = underbrace(E[Y^2], "simil" E[Y]) - underbrace(E^2[Y], mu_y^2 = 0.1667^2) = E[Y^2] - 0.0277 $
$ E[Y^2] = integral _0^1 y^2f_Y(y) d y = integral _0^1 y^2/sqrt(y) - y^2 d y = 0.0666 $
En conclusion:
- $f_Y(y) = (1/sqrt(y) - 1) II_(\(0, 1\))(y)$
- $mu_y = 0.16667$
- $V[Y] = 0.03896$


== Ejercicio 10
Sean $X tilde.op "Unif"(0, 1)$ y $Y = w(X)$, donde $w :[0,1] -> RR$ 

$ w(x) = cases(
  -1 & x <= 0.3,
  +0 & 0.3 < x <= 0.7,
  +1 & x > 0.7
) $

1. $Y$, es una variable aleatoria discreta o continua?

El recorrido es discreto: $R_Y = \{-1, +0, +1\}$, por lo tanto entiendo que es una discreta

A pesar de que $X$ es continua, $w$ la "discretiza", aunque la "imagen" que en realidad no es la imagen, es la *preimagen* sean $RR$, no quiere decir que la imagen sea $RR$, de hecho los unicos posibles valores son los mencionados anteriormente

2. Determine la funcion de masa de probabilidad o la funcion de densidad de probabilidad de $Y$, segun corresponda

$ P(Y = -1) = P(X <= 0.3) = "Unifcdf"(0, 1, x = 0.3) = 0.3 $
$ P(Y = 0+) = P(0.3 < X <= 0.7) = P(X <= 0.7) - P(X < 0.3) = 0.4 $
$ P(Y = 1) = P(0.7 < X) = 1 - P(X <= 0.7) = 1 - "Unifcdf"(0, 1, x = 0.7) = 0.3 $

3. Calcular $E[Y], V[Y]$
$ E[Y] = -0.3 + 0.3 = 0 $
$ V[Y] = E[Y^2] - E^2[Y] = E[Y^2] = 0.3 + 0.3 = 0.6 $

== Ejercicio 11

Sea $X tilde.op "Uniforme(0, 1)"$, encontrar una funcion $w:[0,1] -> RR slash.big Y = w(X) tilde.op "Binomial"(3, 0.5)$

En este caso el recorrido de $R_Y = \{ 0, 1, 2, 3 \}$ pues se pide que sea una Binomial de 3 trials

$P(Y = 0) = "Bipdf"(0) = 0.125$
$P(Y = 1) = "Bipdf"(1) = 0.375$
$P(Y = 2) = "Bipdf"(2) = 0.375$
$P(Y = 3) = "Bipdf"(3) = 0.125$


Entonces para formar la funcion, sabiendo que depende de una uniforme(0, 1):
La acumulada de la $"uniforme"(0, 1) = x$, por lo tanto setear los limites deberia ser trivial:

*ATENTO*: A los limites en funciones partidas. Me habia olvidado en este caso de _sumarle lo acumulado hasta el anterior_


$w(X) = cases(
  0 "  " 0 <= x <= 0.125,
  1 "  " 0.125 < x <= 0.5,
  2 "  " 0.5 < x <= 0.875,
  3 "  " 0.875 < x <= 1
  &
)$


== Ejercicio 12

Sean $X tilde.op "Unif"(0, 1)$ e $Y = w(X)$, donde $w:[0, 1] -> RR$ viene dada por:

$ w(x) = cases(
  0 & x <= 0.5,
  x - 0.5 & x > 0.5
) $

1. $Y$ es una variable aleatoria discreta o continua?
En este caso si es continua porque cuando $x > 0.5$, la funcion $w$ es una recta en $RR$ por lo que en este caso si. Aunque la preimagen sigue siendo distenta de la imagen

2. Calcular $E[Y], V[Y]$

En esta ocacion como $Y$ es continua, es mas complicado
Tenemos que encontrar su funcion de densidad con la misma estrategia que veniamos usando antes, el *teorema de la transformacion*


== Ejercicio 13

Se representa la distribucion de probabilidades conjunta $p_(X,Y)(x,y)$. Calcule todas las distribuciones *marginales* y *condicionales*


#table(columns: 7)[$y slash.big x$][1][2][3][4][5][Probabilidades marginales de Y][1][0.10][0.10][0.05][0.15][0.10][$P(Y = 1) = 0.5$][2][0.05][0.05][0.05][0.15][0.00][$P(Y = 2) = 0.3$][3][0.05][0.05][0.00][0.10][0.00][$P(Y = 3) = 0.2$][PMs de X][0.2][0.2][0.1][0.4][0.1][$sum_x sum_y P(X = x, Y = y) = 1$]

_Nota_: Las probabilidades marginales de cierta $X$ son: Fijar una x y hacer la suma de todas las probabilidades *conjuntas* (interseccion) con todas las probabilidades $x, y_i$
Entonces tiene sentido que para el caso continuo vayan a ser integrales dobles las que tengamos que calcular ya que serian densidades de area

- Probabilidades marginales de variables aleatorias bidimensionales:
En el caso discreto son:
$ P(X = x) = sum _y P(X = x, Y = y) $

Donde necesitamos usar la *formula fundamentel*:

$ P(Y = y|X = x) = P(X = x, Y = y)/P(X = x) $

_Notemos que combinando fundamental con Bayes_:

$ P(X = x, Y = y) = P(X = x inter Y = y) $

En terminos practicos...
La *probabilidad marginal* representa *la probabilidad total de que ocurra un determinado valor de X, sin importar Y*, sabiendo que X e Y estan relacionados obviamente
Ejemplo corto:
$X = "cantidad de cafes vendidos"$
$Y = "clima"$
$ P(X = 2) = "La probabilidad de vender 2 cafes" $

_Notemos que_ estan relacionadas las variables pues si llueve podria entenderse que la gente sale menos a la calle. entonces:

Si tenemos los siguientes datos:

$ P(X = 2, Y = "sol") = 0.1 $
$ P(X = 2, Y = "nube") = 0.2 $
$ P(X = 2, Y = "lluvia") = 0.1 $

Para hallar $P(X = 2)$:

$ P(X = 2) = 0.1 + 0.2 + 0.1 = 0.4 $

_Nos sirve para extraer informacion mas concreta de los datos que ya tenemos_


- Probabilidades condicionales de variables aleatorias bidimensionales:

Es hacer:
$P(X = x_i|Y = y_j) = P(X = x_i, Y = y_j)/P(Y = y_j) -> "Todas las condicionales"$

== Ejercicio 14


1. Las distribuciones de probabilidad marginales

#table()[]

2. La distribucion de probabilidades de $X + Y, X Y$

3. El valor esperado y la varianza de $X + Y, X Y$

4. La covarianza $"Cov"[X, Y]$


== Ejercicio 19

Cierto supermercado tiene una caja de atención común y otra caja rápida. Supongamos que X es el número de clientes que están en espera en la caja común en un momento particular del día, y que Y es el número de clientes que están en espera en la caja rápida al mismo tiempo. La distribución de probabilidades conjunta de (X,Y) se resume en la
siguente tabla:

#table(columns: 5)[$x slash.big y$][0][1][2][3][0][0.08][0.07][0.04][0.00][1][0.06][0.15][0.05][0.04][2][0.05][0.04][0.1][0.06][3][0.00][0.03][0.04][0.07][4][0.00][0.01][0.05][0.06]

1. La probab de que haya 1 cliente en cada linea (exactamente)
2. Prob de que la cantidad de clientes en cada cola sea la misma
3. Prob de que haya por lo menos dos clientes mas en una cola de espera que en la otra
4. Prob de que la cantidad de clientes en ambas colas sea exactamente 4
5. Valor esperado del numero de clientes en cada caja
6. Son $X, Y$ independientes?


== Ejercicio 23


== Ejercicio 25


== Ejercicio 31




