#set document(
  title: "Tips - Procesos Estocasticos",
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
  #text(size: 24pt, weight: "bold")[Procesos Estocasticos]
  #v(0.5em)
  #text(size: 18pt)[Tips y Conceptos Clave]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadistica\
    #datetime.today().display("[day]/[month]/[year]")
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

= Proceso Estocastico

#importante[
Coleccion de variables aleatorias indexadas por un parametro (en general tiempo)
$ \{X(t)\}_(t in T) $
]

Donde:
- $T:$ Tiempo discreto o continuo
- $E:$ Espacio de estados (valores posibles de $X(t)$)

== Simplificaciones utiles

=== Procesos estacionarios

#nota[
Las probabilidades son independientes del tiempo. Las reglas del juego no dependen del momento en que empezamos.
$ f(x_1, t_1 + Delta t, x_2, t_2 + Delta t, ...) = f(x_1, t_1, x_2, t_2, ...) $
]

=== Incrementos independientes

#nota[
Los cambios en intervalos de tiempo NO solapados son independientes.
]

=== Incrementos estacionarios

#nota[
Las distribuciones de los incrementos solo dependen del tamaño del intervalo, no del momento.
]

= Procesos de Markov

#importante[
El futuro depende solo del presente, no de todo el pasado. Se ignora el pasado, solo te importa el lugar final.
$ P(X(t_n) = x_n|X(t_(n - 1)) = x_(n - 1), ..., X(t_1) = x_1) = P(X(t_n) = x_n|X(t_(n - 1)) = x_(n - 1)) $
]

#tip[
En tiempos discretos:
$ p(x_3, t_3|x_1, t_1) = sum _x_2 p(x_3, t_3|x_2, t_2) . p(x_2, t_2|x_1, t_1) $
]

== Cadenas de Markov

#nota[
Son procesos de Markov con espacio de estados discreto.
]

Se definen por:
1. Distribucion inicial $p_j(0)$
2. Matriz de transicion $P$, donde cada elemento $p_(i j)$ es:
$ p_(i j) = P(X_(n + 1) = s_j|X_n = s_i) $

=== Evolucion y paso

- Evolucion:
$ arrow(p)(n + 1) = arrow(p)(n).P $

- Si es homogenea (transiciones no dependen de $n$):
$ arrow(p)(n) = arrow(p)(0) . P^n $

=== Estado estacionario

#importante[
Existe un estado estacionario si:
$ pi = pi P $
]

#tip[
Se resuelve el sistema con la condicion inicial:
$ sum pi_i = 1 $
]

#nota[
A $pi$ se lo llama "autovector a izquierda" porque multiplica a la matriz desde la izquierda y "a 1" porque en ese calculo $lambda = 1$ (deberia estar multiplicando a $pi$).
]

=== Estados de una cadena de Markov <estados>

#tip[
Hacer grafo de estados para este ejercicio.
]

- *Accesible*: Existe camino de un estado al otro
- *Irreducible*: Todos se comunican (comunicar: Si puedo llegar de A a B entonces puedo llegar de B a A)
- *Recurrente*: Vuelve seguro
- *Transitorio*: Puede que no vuelva al estado inicial
- *Periodico/Aperiodico*
- *Regular*: Algun $P^n$ tiene todas sus entradas positivas

= Random Walk (Caminata aleatoria)

Definicion:
- $X_n = sum_(k=1)^n Z_k$
- Los $Z_k$ son variables aleatorias i.i.d.

== Caso simple

#nota[
Si $Z_k in {-1, 1}$:
- $E[Z_k] = 0, V[Z_k] = 1$
- $E[X_n] = 0, V[X_n] = n$
]

== Caso generalizado

#tip[
Si $Z_k$ generalizado, calcular $E[Z_k], V[Z_k]$, y luego:
- $E[X_n] = n E[Z_k]$
- $V[X_n] = n V[Z_k]$
]

== Posibles recorridos

#importante[
Tener en cuenta que cuando la caminata es binaria no puedo moverme 0 pasos, si o si +1 o -1.
]

- Binaria ($plus.minus 1$): $R_(X_n) = \{ -n, -n + 2, -n + 4, ..., n - 2, n \}$
- Multivaluada (los pasos pueden ser de mayor modulo que 1): Todas las sumas posibles de n incrementos

== Random walk continua

#nota[
Gaussiana: $X_n tilde.op N(n mu, n sigma^2)$ (su recorrido es $RR$)
]

= Procesos de Poisson

#importante[
Proceso estocastico usado para: arribos, fallas, particulas

$ lambda: "Eventos por unidad de tiempo" => "Tiempo entre eventos sucesivos" T_i tilde.op "Exponencial"(lambda) $
]

== Propiedades

Cumple con:
+ Incrementos independientes
+ Incrementos estacionarios
+ La probabilidad de 1 evento en $Delta t approx lambda Delta t$
+ La probabilidad de 2 o mas eventos en $Delta t$ es despreciable

== Distribucion

#importante[
$ P(N(t) = k) = (lambda t)^k/k! e^(- lambda t) $
$ N(t) tilde.op "Pois"(lambda t) $
]

#nota[
Los tiempos entre eventos son exponenciales con parametro $lambda$.
]

= Tiempo hasta absorcion

#nota[
Si algunos estados son absorbentes, se trabaja con una particion de la matriz:
]

$ P = mat(
  I, 0;
  F, Q;
) $

$ M = (I - Q)^(-1) $

#importante[
Probabilidades de absorcion: $G = M F$
]
