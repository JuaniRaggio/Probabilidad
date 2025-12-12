#set document(
  title: "Repaso Teorico - Final Proab",
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
      Pagina #counter(page).display() / #counter(page).final().first()
    ]
  ]
)

#set text(
  font: "New Computer Modern Math",
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
// PORTADA
// ====================================

#align(center)[
  #v(1em)
  #text(size: 24pt, weight: "bold")[Probabilidad y Estadistica]
  #v(0.5em)
  #text(size: 18pt)[Repaso]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Teoria \
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

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

// Funcion para crear una caja de duda con pregunta y respuesta
#let doubt(pregunta, respuesta) = {
  block(
    fill: rgb("#F3E5F5"),
    stroke: rgb("#7B1FA2") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#7B1FA2"), size: 11pt)[Pregunta:]
    #v(0.3em)
    #pregunta
    #v(0.5em)
    #line(length: 100%, stroke: 0.5pt + rgb("#7B1FA2"))
    #v(0.5em)
    #text(weight: "bold", fill: rgb("#7B1FA2"), size: 11pt)[Respuesta:]
    #v(0.3em)
    #respuesta
  ]
}

= Estadistica Descriptiva

== Medidas de tendencia central - Media vs Mediana vs Moda
La *Media* puede verse afectada por *outliers*,
si hay un dato muy grande afecta mucho al resultado obtenido, 
corrompiendo su supuesta "centralidad". La *Mediana* por otro lado, se salva de 
ese problema ya que es justo el dato \"central\", el tema es que no tiene en 
cuenta el peso de los datos en absoluto, solamente le interesa su \"indice\".
Finalmente la *Moda* es el dato mas frecuente, puede haber distribuciones 
multimodales, quiere decir que hay varios datos que aparecen esa X cantidad 
maxima de veces

#importante[
  Si tenemos datos reales (un continuo de datos), ademas de que se toman 
  intervalos para describir la frecuencia de datos, la *moda* pasa a calcularse
  de la siguiente forma:

  - Se divide el rango en intervalos de igual longitud (como mencionamos 
    intervalos)
  - Se cuenta cuantos valores hay en cada uno de los intervalos
  - La moda va a ser el valor medio (centro) del intervalo mas frecuente
  _Notemos que aca la moda va a depender de la cantidad de intervalos_
]

#importante[
  Si $"Mediana" = mu_X$, quiere decir que los datos son simetricos
]

== Medidas de Dispersion

- Varianza muestral

$ s^2 = 1/(n - 1) sum_(i = 1)^n (x_i - overline(x))^2 $

- Desvio muestral

$ s = sqrt(s^2) $

- Media del desvio absoluto

$ w = 1/n sum_(i = 1)^n |x_i - overline(x)| $

- Mediana del desvio absoluto

$ M A D = "mediana"{|x_i - overline(x)|} $

- *Coeficiente de simetria* (Si me piden calcular la simetria, es esto)

_Es la simetria de los datos respecto de la media_

$ gamma = 1/(n s^3) sum_(i = 1)^n (x_i - overline(x))^3 $

- *Kurtosis*

_Es la concentracion en torno a la media (concentracion alta $=>$ positiva)_

$ kappa = 1/(n s^4) sum_(i = 1)^n (x_i - overline(x))^4 - 3 $

== Datos Agrupados

#nota[
  Es todo lo mismo pero usando marcas de clase
]



= Funciones de Variables Aleatorias - Notables

#tip[
  Es importante recordar las funciones y por lo menos saberse las 
  formulas, tanto de la $F_X$ como $mu_X$ y $sigma_X$
]

#importante[
  *Binomial*

  - $x = "Exitos deseados"$
  - $p = "Probabilidad de exito"$
  - $n = "Intentos"$

  $ X tilde "Binomial"(p = "probabilidad de exito", n = "trials") $
  $ P(X <= x) = F_X (x) = sum_(k = 0)^n binom(n, k) p^k (1 - p)^(n - k) $

  $ mu_X = E[X] = n p $
  $ sigma_X^2 = V[X] = n p (1 - p) $
]

#importante[
  *Exponencial*
  - $lambda = "Eventos por unidad de tiempo"$
  - $x = "Tiempo de espera entre x eventos"$

  $ X tilde "Exponencial"(lambda) $
  $ P(X <= x) = F_X (x) = cases(
    0                 &"if" x < 0,
    1 - e^(-lambda x) &"if" x >= 0,
  ) $

  $ mu_X = E[X] = 1/lambda $
  $ sigma_X^2 = V[X] = 1/lambda^2 $
]

#importante[
  *Poisson*
  - $lambda = "Eventos por unidad de tiempo"$
  - $x = "Tiempo hasta que ocurran x cant de eventos"$

  $ X tilde "Poisson"(lambda) $
  $ P(X <= x) = F_X (x) = e^(-lambda) sum_(k = 0)^x (lambda^x)/(k!) $

  $ mu_X = E[X] = sigma_X^2 = V[X] = lambda $
]

#importante[
  *Uniforme*

  - $a = "Lower Limit"$
  - $b = "Upper limit"$

  $ X tilde "Uniforme"(a, b) $

  $ P(X <= x) = F_X (x) = cases(
    0               &"if" x < a,
    (x - a)/(b - a) &"if" a <= x <= b,
    1               &"if" x > b,
  ) $

  $ mu_X = E[X] = (a + b)/2 $
  $ sigma_X^2 = V[X] = (b - a)^2/12 $
]

#importante[
  *Hipergeometrica*

  - $N = "Population size"$
  - $K = "Successes on population"$
  - $n = "Extraction size"$
  - $x = "Successes desired on extraction"$

  $ X tilde "Hipergeometrica"(N, K, n) $
  $ P(X <= x) = F_X (x) = (binom(K, x) binom(N - K, n - x))/binom(N, n) $

  $ mu_X = E[X] = n K/N $
  $ sigma_X^2 = V[X] = mu_X (1 - K/N) (N - n)/(N - 1) $
]




