#set document(
  title: "Tips - Suma de Variables Aleatorias",
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
  #text(size: 24pt, weight: "bold")[Suma de Variables Aleatorias]
  #v(0.5em)
  #text(size: 18pt)[Desigualdades y Leyes]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadistica\
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

= Para que sirven las desigualdades?

#importante[
- Sirven siempre, para *cualquier tipo de variable aleatoria*
- Sirven para cuando *no sabes la distribucion de la variable*
]

== Desigualdad de Markov

$X$ una variable aleatoria, $forall epsilon > 0$ con $P(X>=0) =1$

$ P(X >= epsilon) <= (E(X))/epsilon $

== Desigualdad de Chebychev

$X$ una va., $forall epsilon > 0$

$ P(|X - E(X)| >= epsilon) <= (V(X))/(epsilon^2) $

=== Cuando usar cada una?

#tip[
- Si solo nos interesa un lado de las cotas $=>$ *Markov*
- Ambas sos sirven para poner una cota y no necesitamos obtener el valor exacto
]

#nota[
A veces nos da $> 1$ la cota, lo cual es raro pero tiene sentido porque no deja de ser una cota.
]

#importante[
$ "V.A.I.I.D" -> "Variables aleatorias independientes e identicamente distribuidas" $
]

= Suma de VAIID

$ X_1, ..., X_n, "vaiid" $
$ -> mu = E(X_1) = E(X_i), forall i $
$ -> sigma = sigma(X_1) = sigma(X_i), forall i $

== Suma $S_n$

$S_n = sum_(i = 1)^n X_i$

- $E(S_n) = E(sum_(i = 1)^n X_i) = sum_(i = 1)^n E(X_i) = n m$

- $V(S_n) = V(sum_(i = 1)^n X_i) underbrace(=, "ind") sum_(i = 1)^n V(X_i) = n m$

== Promedio $overline(X)_n$

$overline(X)_n = (sum_(i = 1)^n X_i)/n = (S_n)/n$

- $E(overline(X)_n) = E(S_n / n) = 1/n E(S_n) = mu_x$

- $V(overline(X)_n) = V(S_n / n) = 1/(n^2) V(S_n) = (n sigma^2)/(n^2) = sigma^2 /n => sigma(overline(X)_n) = sigma/sqrt(n)$

#importante[
$ P(|overline(X)_n - E(overline(X)_n)| >= epsilon) <= (V(overline(X)_n))/(epsilon) $

A medida de que se promedian mas variables, la probabilidad de que ese promedio, este lejos del valor esperado, se achica.
]

== Suma de variables aleatorias con distribucion conocida

#nota[
Si no sabemos que da, siempre se puede chequear calculando cual deberia ser la media.
]

#tip[
*Suma de binomiales* $->$ binomial

$X tilde "Bi"(n, p); Y tilde "Bi"(m, p), "ind" => X + Y tilde "Bi"(n + m, p)$
]

#tip[
*Suma de Poisson* $->$ Poisson

$X tilde P_0 (lambda_1); Y tilde P_0 (lambda_2) "ind" => X + Y tilde P_0(lambda_1 + lambda_2)$
]

= Ley de los grandes numeros

$ X_i, "v.a.i.i.d. con" E(X_i) $
$ P(|overline(X)_n - mu| >= epsilon) -> 0 $
$ (overline(X)_n overbrace(->, P) mu) $

#importante[
La probabilidad de que el promedio se aleje del valor esperado tiende a cero a mayor tamaño muestral. *Sentido comun*.
]
