#set document(
  title: "Errores Comunes",
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

#set heading(numbering: "1.")
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
  #text(size: 24pt, weight: "bold")[Errores Comunes]
  #v(0.5em)
  #text(size: 18pt)[Resolucion de ejercicios]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadistica\
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

= Generales

== Negar probabilidades discretas

#error[
Hay que tener cuidado cuando las probabilidades son discretas, no es lo mismo menor igual que el menor.
]

#importante[
Cuando das vuelta probabilidades hay que tener mucho cuidado, si negas un $>=$, te queda $<$ y en tal caso tendrias que usar el valor que tenias *menos uno*, para transformarlo en $<=$
]

#nota[
Ojo porque en este parcial hay tiempos que son discretos, esos son los que pueden llegar a hacer que metas la pata.
]

= Cadenas de Markov

#error[
ATENTO a poner bien filas y columnas.
- Ser concistente, si lo hacer al revez del enunciado (siempre y cuando sea cuadrada la matriz), ser concistente para el resultado
- Intentar hacerlo como dice en el enunciado porque sino puede llegar a causar confusion
]

#importante[
Los subindices de X son el numero de estado, si entre los subindices hay una diferencia de $k$ pasos, se puede calcular la matriz de transicion con las probabilidades usando $PP^k$ y se ve la celda que interesa.
]

= Procesos estocasticos

== Cadenas de Markov

#error[
Ojo cuando tengo una probabilidad condicional, que me dice *tengo info del futuro* pero queres la probabilidad del *pasado respecto de ese futuro*.
]

=== Ejemplo

$ X_n = {"El resultado maximo observado luego de " n "tiradas del dado"} $
$ P(X_1 = 1 | X_3 = 3) => "Probabilidad de lo que paso en el primer caso, sabiendo lo que paso en el tercero" $

#tip[
Luego se puede descomponer en las probabilidades de lo que paso en el primer paso. Acordarse de usar que pasar de un estado mayor a uno menor, es probabilidad 0 (me ahorra notacion).
]

== Sacarse casos que no nos interesan

#tip[
Es interesante para sacarse los casos que no nos interesan, usar la resta de funciones de probabilidad acumulada:
$ P(X_n = 5) = underbrace(P(X_n <= 5), "Incluye que sean todos 4 (no obtuve 5)") - underbrace(P(X_n <= 4), "Me saco los casos que no me interesan (ningun 5)") $
]

= Intervalos de confianza

#importante[
Cuando me piden un $n$ tal que el error sea un numero entero $k$, si no se puede obtener ese valor, vamos a querer obtener el menor error posible. Entonces:
$ "El " n " siempre se redondea para arriba" $
]

#tip[
La forma de maximizar $hat(p)(1-hat(p)) <=> hat(p) = 0.5$, nos sirve cuando queremos limitar un error en base a la cantidad de muestras, en tal caso tenemos que tener en cuenta que esa $hat(p)$ puede ser maxima.
]
