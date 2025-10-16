#set document(
  title: "Tips - Variables Aleatorias Bidimensionales",
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
      [ITBA - Probabilidad y Estadística],
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
  #text(size: 24pt, weight: "bold")[Variables Aleatorias Bidimensionales]
  #v(0.5em)
  #text(size: 18pt)[Procedimientos y Tips]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadística\
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

= Teorema de transformación general

#nota[
Este método solo se aplica si la función $g(X)$ es monótona por partes.
]

- Sea $Y, X$ variables aleatorias continuas, donde conocemos la densidad de $X$
- Sea $Y = g(X)$, no estrictamente monótona (no inyectiva)

Para hallar la densidad de Y:

$ f_Y(y) = sum _(x_i in g^(-1)(y)) (f_X(x_i))/abs(g'(x_i)) $

#importante[
Los $x_i$ son las preimágenes de las ramas, NO las raíces.
- $g'(x_i) != 0 =>$ Los puntos donde la función es localmente invertible
- La sumatoria recorre todas las partes en donde la función es monótona (localmente invertible)
]

== Procedimiento paso a paso

#tip[
1. Escribís la ecuación $y = g(x)$ y resolvés para $x$: hallás todas las soluciones $x_i$ que cumplen $g(x_i) = y$

2. En cada solución $x_i$:
   - Verificás que esté en el dominio de $X$
   - Calculás $f_X(x_i)$
   - Derivás $g(x)$ y evaluás $|g'(x_i)|$

3. Sumás los términos $f_X(x_i)/abs(g'(x_i))$ correspondientes a cada solución válida
]

= Teorema de transformación caso monótono

#nota[
Este método solo se aplica si la función $g(X)$ es monótona (inyectiva).
]

$ f_Y(y) = f_X(g ^(-1)(y)) . abs((d)/(d y) g ^(-1)(y)) $

Notemos que en este caso hay varias cosas que cambian:

- Se usa $g ^(-1)(y)$ en la evaluación de $f_X$
- Se multiplica en vez de dividir
- Restricción mayor: Monotonía estricta

= Variables aleatorias bidimensionales

#nota[
Antes de leer todo sobre discretas y continuas, tener en cuenta que la diferencia entre ambas es mínima:
- En discretas vamos a tener la suma de probabilidades puntuales
- En continuas vamos a tener integrales de densidades de probabilidad
]

#tip[
Equivalencias entre caso discreto vs continuo:
- $P(X = x) -> f_X(x)$
- $sum -> integral$
]

== Correlación

La correlación es común para ambos casos. Nos dice cómo se relacionan linealmente dos variables:

$ rho_(X, Y) = "Cov"(X, Y)/(sigma_X sigma_Y) $
$ -1 <= rho_(X, Y) <= 1 $

#importante[
- $rho_(X, Y) = -1 ->$ Correlación negativa perfecta: aumentan y disminuyen al mismo ritmo pero en sentido opuesto
- $rho_(X, Y) = 0 ->$ No existe correlación lineal
- $rho_(X, Y) = 1 ->$ Correlación positiva perfecta: aumentan y disminuyen al mismo ritmo y en mismo sentido
]

= Caso discreto

== Probabilidades marginales

Las probabilidades marginales de cierta $X$ son: Fijar una x y hacer la suma de todas las probabilidades conjuntas (intersección) con todas las probabilidades $x, y_i$

$ P(X = x) = sum _y P(X = x, Y = y) $

#importante[
Teorema fundamental:
$ P(Y = y|X = x) = P(X = x, Y = y)/P(X = x) $
]

#nota[
La probabilidad marginal representa la probabilidad total de que ocurra un determinado valor de X, sin importar Y, sabiendo que X e Y están relacionados.
]

== Esperanza, varianza y covarianza

- Esperanza:
$ E[X] = sum x P(X) $

- Varianza:
$ V(X) = sum (x - E[X])^2 P(X) $

- Covarianza:
$ "Cov"[X, Y] = sum (x - E[X])(y - E[Y])P(X, Y) = E[X Y] - E[X]E[Y] $

== Independencia

#importante[
Dos variables son independientes si y solo si:
$ p_(X, Y)(x_i, y_i) = p_X(x_i) . p_Y(y_i) $
]
