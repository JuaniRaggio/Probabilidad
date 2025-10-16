#set document(
  title: "Tips - Inferencia Estadistica",
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
  #text(size: 24pt, weight: "bold")[Inferencia Estadistica]
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

= Estimacion puntual

#importante[
Estimadores para parametros poblacionales:
]

#align(center)[#table(columns: 2)[Parametro][Estimador][Media][$hat(mu) = overline(X) = 1/n sum X_i$][Proporcion][$hat(p) = (n^0 "de exitos")/n$][Varianza][$S^2 = 1/(n - 1) sum (X_i - overline(X))^2$]]

= Estimacion por intervalos

#importante[
  Para que son los intervalos de confianza?
  - Estimar datos como la media $mu$ *poblacional* (de toda la poblacion) a 
    partir de una muestra mas chica $mu$ *muestral*
]

= Pre muestra
- Buscamos a y b *dependientes de la muestra* de forma que:

$ P(a <= mu <= b) = "Porcentaje de confiabilidad" != "Probabilidad" $

$ X_n = 1/n sum_(i = 1)^(n) X_i tilde "Norm"(mu, sigma/sqrt(n)) $

$ overline(X)_n tilde N(mu; sigma/sqrt(n)) $

#nota[
  Recordar la normalizacion de variables aleatorias normales (_muy comun
  tener que utilizarlo_):
  $ (overline(X)_n - mu)/(sigma/sqrt(n)) tilde N(0, 1) $
]

#tip[
  Es util para que sean normales, *usar Teorema Central del Limite*, ejemplo:
  $ X tilde "Bi"(1000; p) $
  $ X underbrace(tilde, "TCL") N(1000 p; sqrt(1000 p (1 - p))) $
  $ hat(p) = X_(1000)/1000 tilde N(p; sqrt(p (1 - p))/sqrt(1000)) $
  $ (hat(p) - p)/sqrt(p (1 - p)/1000) tilde underbrace(N(0, 1), "Distribucion
  pivote") $
]

#importante[
  En el ejemplo anterior *notemos que* $p$ no depende de la muestra pero 
  $hat(p)$ si, por lo que cuando querramos calcular $a$, tenemos que usar 
  $hat(p)$
]


#nota[
Ver codigo para implementacion computacional.
]

#importante[
Formulas segun situacion:
#align(center)[#table(columns: 2)[Situacion][Intervalo][Media, $sigma$ conocida][$overline(X) plus.minus z sigma/sqrt(n)$][Media, $sigma$ desconocida][$overline(X) plus.minus t SS/sqrt(n)$][Proporcion][$hat(p) plus.minus z sqrt((hat(p)(1 - hat(p)))/n)$]]

]

#nota[
Margen de error: lo que se suma o resta en la estimacion de intervalos.
]

= Tamaño muestral

#tip[
Formulas para determinar n necesario:
#align(center)[#table(columns: 2)[Caso][Formula][Media, $sigma$ conocida][$n = ((z sigma)/E)^2$][Proporcion][$n = ((z 0.5)/E)^2$]]
]

= Metodo de los momentos

#importante[
Igualar momentos teoricos y muestrales:
$ E[X] = overline(X) $
]
