#set document(
  title: "Tips - Funciones de variables aleatorias",
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
  #text(size: 24pt, weight: "bold")[Funciones de variables aleatorias]
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
  *Uniforme*
  $ U tilde "Unif"(a, b) -> F_U (u) = cases(
    0 " if " u <= a,
    (u - a)/(b - a) " if " 0 <= u <= 1,
    1 " if " u >= 1
  ) $

  $ mu_X = (a + b)/2 $
  $ V[X] = ((b - a)^2)/12 $

]

#importante[
  *Exponencial*
  $ F_X (x) = cases(
    1 - e ^(-lambda x) " si " x >= 0,
    0 " si " x < 0
  ) $

  $ mu_X = 1/lambda $
  $ V[X] = 1/(lambda^2) $

]

#importante[
  *Poisson*
  $ F_X (x) = e^(-lambda) . sum_0^k (lambda^i)/(i!) $

  $ mu_X = lambda $
  $ V[X] = lambda $
]

#importante[
  *Binomial*:
  - $n = "Trials"$
  - $k = x$
  - $p = "Probabilidad de exito"$

  $ F_X (n, x) = sum_(i = 0)^x binom(n, i) p^i . (1 - p)^(n - i) $

  $ mu_X = p times n $
  $ V[X] = p n (1 - p) $
]

#importante[
  *Geometrica*
  - $p$: probabilidad de éxito en cada intento  
  - $x$: número de intentos hasta el primer éxito (variable discreta)

  $ P(X = x) = (1 - p)^{x - 1} p, x = 1, 2, 3, ...$

  $ F_X (x) = 1 - (1 - p)^x $

  $ mu_X = 1/p $  
  $ V[X] = (1 - p)/p^2 $
]

#importante[
  *Hipergeometrica*
  - $N$: tamaño total de la población  
  - $K$: cantidad total de éxitos en la población  
  - $n$: tamaño de la muestra (sin reemplazo)  
  - $x$: número de éxitos en la muestra

  $ P(X = x) = (binom(K, x) binom(N - K, n - x))/binom(N,n) $

  $ mu_X = n (K / N) $  
  $ V[X] = n (K / N) (1 - K / N) ((N - n) / (N - 1)) $
]

#tip[
  *Comparación entre Geométrica, Binomial e Hipergeométrica*

  - La Geometrica cuenta cuando aparece el primer exito (exactamente igual a 
    hacer una binomial con x = 1).

  - La Binomial cuenta cuantos exitos hay en $n$ intentos independientes.

  - La Hipergeometrica cuenta cuantos exitos hay en una muestra sin reemplazo,
    donde los ensayos no son independientes.

]

