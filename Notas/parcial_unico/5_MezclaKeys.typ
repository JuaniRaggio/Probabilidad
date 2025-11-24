#set document(
  title: "Tips - Mezcla de variables aleatorias",
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
      [ITBA - Probabilidad y Estadistica],
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
  #text(size: 24pt, weight: "bold")[TP 5]
  #v(0.5em)
  #text(size: 18pt)[Tips y Formulas Clave]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadistica\
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

#importante[
  *Probabilidad total*

  $ P(X = x) = sum_(y in R_Y) P(x | y).P(y) $
]

#importante[
  Como la normal es simentrica (en caso de estar normalizada), podemos
  hacer:
  $ "Normalcdf"(-x) = Phi(-x) = 1 - Phi(x) $

  _Si lo pensamos graficamente, seria como pensar:_
  El area en la cola izquierda $P(X <= -x)$ es exactamente lo mismo que
  el area en la cola derecha $1 - P(X <= x)$
]

= Distribucion de probabilidades

Que hacer si te piden distribucion de probabilidades de una variable
la cual viene descripta por una funcion que incluye otras variables?

#importante[
  Dado $X, Y$ variables aleatorias y tenemos $X = g(Y)$, se procede:
  1. Encontramos la *acumulada de la desconocida* despejando $F_X (x)$ (en caso
    de que $X$ sea la conocida e $Y$ la conocida)
  2. Derivamos para poder encontrar la funcion de densidad
  3. Para encontrar los limites, es util reemplazar con lo que se evalua en la 
    funcion
]

= Mezcla de variables aleatorias

Una *mezcla* ocurre cuando la distribución de una variable aleatoria depende de otra variable aleatoria. 

Ejemplo típico: elegir al azar una distribución y luego generar un valor de ella.

*Definición general:*
Si $X | Y = y$ tiene densidad $f_(X\|Y) lr((x bar.v y))$ y $Y$ tiene densidad/distribución $f_Y(y)$, entonces la densidad marginal de $X$ es:

$ f_X(x) = integral f_(X\|Y) lr((x bar.v y)) f_Y(y) thin d y $

Para el caso discreto:

$ P(X = x) = sum_y P(X = x | Y = y) P(Y = y) $

== Teorema de la probabilidad total (formas)

*Discreto:*
$ P(X=x) = sum_i P(X=x|Y=y_i)P(Y=y_i) $

*Continuo:*
$ f_X(x) = integral f_(X\|Y) lr((x bar.v y)) f_Y(y) thin d y $

*Mixto:*
Usa suma sobre las partes discretas y integral sobre las partes continuas.

== Esperanza condicional

La *esperanza condicional* cuantifica el valor esperado de $X$ cuando sabemos el valor de otra variable $Y=y$.

*Definición (discreta):*
$ E[X|Y=y] = sum_x x dot P(X=x | Y=y) $

*Definición (continua):*
$ E[X|Y=y] = integral x thin f_(X\|Y) lr((x bar.v y)) thin d x $

*Variable aleatoria condicional:*
$E[X|Y]$ es en sí misma una variable aleatoria.

== Ley de la esperanza total

$ E[X] = E(E[X|Y]) $

Interpretación: "primero condiciono, después promedio".

== Ley de varianza total

$ op("Var")(X) = E(op("Var")(X|Y)) + op("Var")(E[X|Y]) $

== Independencia y condicionales

Si $X$ y $Y$ son independientes:

- $f_(X\|Y) lr((x bar.v y)) = f_X(x)$
- $E[X|Y] = E[X]$
- $P(X=x|Y=y) = P(X=x)$

== Cómo resolver ejercicios típicos

=== 1. Te dan una mezcla con parámetros aleatorios
Usar probabilidad total (discreto o continuo según corresponda).

=== 2. Te dan densidades condicionales y una distribución para Y
Aplicar:
$ f_X(x) = integral f_(X\|Y) lr((x bar.v y))f_Y(y) d y $

=== 3. Te piden esperanza condicional
Usar fórmula según discreto/continuo.

=== 4. Te piden esperanza total
Calcular primero $E[X|Y]$ y luego promediar:
$ E[X] = E(E[X|Y]) $

== Notas útiles

#nota[
Recordá que *las mezclas suavizan distribuciones*: si las condicionales son simples pero la distribución de $Y$ es amplia, la marginal puede ser más compleja.
]

== Ejemplo general

Supongamos:
- $Y tilde "Bernoulli"(p)$
- Condicionalmente, $X | Y=0 tilde N(0,1)$
- $X | Y=1 tilde N(3,1)$

Entonces:
$ f_X(x) = (1-p) phi(x) + p phi(x-3) $

Y la esperanza condicional:
- $E[X|Y=0]=0$
- $E[X|Y=1]=3$

Esperanza total:
$ E[X] = (1-p) dot 0 + p dot 3 = 3p $


