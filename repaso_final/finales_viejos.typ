#set document(
  title: "Finales Viejos",
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
// PORTADA
// ====================================

#align(center)[
  #v(1em)
  #text(size: 24pt, weight: "bold")[Probabilidad y Estadistica]
  #v(0.5em)
  #text(size: 18pt)[Resolucion de Finales Viejos]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Ejercicios \
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


= Final 05/12/2025 - Tema A

== Estadistica descriptiva y Estimadores de Parametros

Josefina está enferma. Los tiempos entre las veces que tose son exponenciales 
independientes de parámetro $lambda$ desconocido. Para estimar el parámetro, 
decide monitorear los tiempos en minutos entre las próximas 10 toses


=== (1 punto)

#doubt[
  Lo de estimadores no me lo acuerdo, para hoy 13/12 lo tengo que tener 
  clarisimo
][
  - Calcular el estimador de maxima verosimilitud de $lambda$
  - Luego del monitoreo se obtienen los siguientes datos:
]

#table(columns: 10)[1.11][0.29][5.9][6.59][9.38][21.22][14.73][6.56][18.79][24.33]

Que resultado da el estimador de maxima verosimilitud?

=== Para los datos obtenidos (1 punto)

- Calcular la simetria
- Graficar el histograma con intervalos de 5 minutos, empezando desde 0
Tienen coherencia ambos resultados?

#error[
  Si te dan los datos *NO Agrupados*, los calculos tienen que ser como
  datos no agrupados a pesar de que te pidan que los agrupes en un
  histograma.
]

$ gamma = "Coeficiente de simetria" = ((sum_(i = 1)^n (x_i - overline(x))^3)/(n * s^3)) $
$ overline(x) = 10.89 $
$ s^3 = (8.4125)^3 $

#align(center)[#table()[$ gamma = ((sum_(i = 1)^10 (x_i - 10.89)^3)/(10 * 8.4125^3)) = 0.2796 $]]


#error[
  Tuve un error de interpretacion el dia del examen y entendi que cada
  muestra era "tiempo de espera respecto del anterior", entonces me
  quedaban intervalos de 5 mintuos con las marcas de clase correctas
  pero no tenia sentido porque me quedaban muchisimos intervalos con 0
  y todos muy separados, si pasa esto, hay que darse cuenta que hay
  algo mal.

  En el caso de que pasen estos problemas, habria que preguntarle a un
  profesor
]

```py
# Datos Agrupados en intervalos de longitud 5 mintuos empezando en 0:
data = {2.5: 2, 7.5: 4, 12.5: 1, 17.5: 1, 22.5: 2}

# El grafico quedaria algo asi, pensando en los siguientes ejes:
# x: tiempo
# y: frecuencias

# 4 |    |####|    |    |    |
# 3 |    |####|    |    |    |
# 2 |####|####|    |    |####|
# 1 |####|####|####|####|####|
# --+----+----+----+----+----+
#   |2.50|7.50|12.5|17.5|22.5|

```

== Procesos de Poisson

Como considera que el size muestral anterior fue insuficiente, decide hacer un
analisis mas extensivo y concluye que el valor del parametro de la exponencial
es de $lambda = 1/12 . 1/"min"$ y vuelve a monitorear sus toses

=== (1 punto)
- Sabiendo que en los primeros 40 minutos tosio 4 veces, calcular la 
  probabilidad de que haya tosido 1 vez en los primeros 20 minutos
- Calcular la probabilidad de que la quinta tos sea antes de los 45 minutos


=== (1 punto)
Cuantos minutos debera monitorear para que la probabilidad de toser por lo 
menos 50 veces sea mayor que 0.9?

_Solucion:_

Sabemos que como los tiempos de espera son exponenciales de parametro $lambda$,
entonces la cantidad de eventos en un intervalo de longitud $i$ sera definido
de la siguiente forma:
$ lambda = 1/12 => X_i = "Toses en un intervalo de longitud i (en minutos)" $

$ X_i tilde "Poisson"(lambda) $

$ P(X_20 = 1 | X_40 = 4) = P(X_20 = 1 and X_40 = 4)/P(X_40 = 4) =
 P(X_20 = 1 and X_40 - X_20 = 4 - 1)/P(X_40 = 4) $
$ (P(X_20 = 1) P(X_20 = 3))/P(X_40 = 4) = ("poisPDF"(20/12, 1) "poisPDF"(20/12, 3))/"poisPDF"(40/12, 4) = 1/4 $

Luego para que la quinta tos sea antes de los 45 minutos, quiere decir que en
45 minutos va a haber mas de 5 toses

$ P(X_45 > 5) = 1 - P(X_45 <= 5) = 1 - "poisCDF"(45/12, 5) = 0.3224 $


Para el segundo item, piden cantidad de minutos a monitorear para que la
probabilidad de toser por lo menos 50 veces sea mayor que 0.9, eso quiere
decir que me piden el tiempo $t$ tal que:

$ P(X_t > 50) > 0.9 $

Como N es muy grande ($> 20$), vamos a poder usar TCL para aproximar:

#error[
  Probablemente en el examen me olvide de ponerle sqrt al $lambda$, lo cual
  cambia muchisimo el resultado
]

$ X_t tilde "Normal"(mu = lambda t, sigma = sqrt(lambda t)) $

$ => P(X_t >= 50) > 0.9 => 1 - P(X_t < 50) = 1 - P(X_t <= 49) > 0.9 $

#error[
  Cuando hacemos el pasaje de $X_t$, hay que tener *MUCHISIMO CUIDADO* con
  el $<=$, ya que al ser una *VADiscreta*, no podemos sacar o poner el $=$ 
  libremente como si nada, de hecho es muy probable que haya cometido ese 
  error en el parcial porque es algo de lo que me acabo de dar cuenta.
]

#importante[
  Es correcto entonces que al limite *superior se le suma* .5 y al limite 
  *inferior se le resta*. Esto tiene sentido porque queremos siempre *INCLUIR
  el valor discreto*, es decir si tenemos $X <= x$, queremos que $X$ pueda 
  tomar el valor $x$, entonces hacemos $x + .5$
]

Luego reemplazamos con $lambda = 1/12$:

$ 1 - Phi((49.5 - t/12)/sqrt(t/12)) > 0.9 $
$ Phi^(-1) (0.1) > (49.5 - t/12)/sqrt(t/12) $

Luego resolviendo la ecuacion, obtenemos:

$ t = 712.5 $

== Funciones de variables aleatorias

Para paliar los sintomas, cada 8 horas toma algun medicamente entre Paracetamol
e Ibuprofeno. En un cajon tiene 3 tabletas de 20 pastillas de Paracetamol y 2
tabletas de 10 pastillas de Ibuprofeno.

Como se siente mal, agarra una tableta al azar y toma una pastilla de la 
tableta. Luego, vuelve a meter la tableta en el cajon.

=== (1 punto)

- Calcular la probabilidad de que en 72 hs. tome por lo menos 6 pastillas de
  Paracetamol
- Calcular el valor esperado y el desvio del numero de pastillas de Paracetamol
que toma en 48 hs.

=== (1 punto)
Repetir el item anterior en el caso en el que las pastillas no estan en 
tabletas, sino que todas mezcladas en un pastillero

_Solucion:_

Si nos estan pidiendo la probabilidad de que en 72 hs. tome por lo menos 6 
pastillas de Paracetamol y toma pastillas cada 8 horas, tenemos la cantidad
de experimentos que se van a realizar

$ "cantidad de pastillas totales a tomar" = 72/8 = 9 $

#importante[
  #error[
    *mi error de interpretacion en el examen* fue NO ver que al hacer 9 
    extracciones, ninguna de las tabletas va a quedarse sin pastillas porque
    la que menos tiene es de 10, por lo tanto las probabilidades no van a 
    cambiar
  ]
  Entonces podemos decir que los experimentos son independientes
]

$ X_p = "Cantidad de pastillas de Paracetamol que se toman en " 72 h s $

$ X_p tilde "Binomial"("Probabilidad de tomar una de Paracetamol", 9) $

_Se dice que el cajon tiene:_

- 3 tabletas de 20 de Paracetamol 
- 2 tabletas de 10 de Ibuprofeno.

$ "Casos totales" = 5 $
$ "Casos de exito (tomar una tableta de Paracetamol)" = 3 $
$ "Probabilidad de tomar una de Paracetamol" = 3/5 $

Entonces...

$ X_p tilde "Binomial"(3/5, 9) $

$ "Prob de tomar por lo menos 6 pastillas de Paracetamol" = P(X_p >= 6) $

$ P(X_p >= 6) = 1 - P(X_p < 6) = 1 - P(X_p <= 5) $
$ 1 - P(X_p <= 5) = 1 - "Binomialcdf"(3/5, 9, 5) $

Luego piden calcular el valor esperado y el desvio del n-pastillas Paracetamol
que toma en 48 hs.

Como ya tenemos $X_p$, es facil calcular el valor esperado y el desvio

Redefinimos $X_p ' tilde "Binomial"(3/5, 48/8 = 6)$ y luego:

$ E[X_p '] = n . p = 18/5 = 3.6 $

$ sigma_X_p = sqrt(n . p . (1 - p)) = sqrt(3.6 2/5) = 1.2 $

#align(center)[#table()[
  $E[X_p '] = 3.6$\
  $sigma_X_p = 1.2$
]]

#error[
  No olvidarse de hacerle la raiz cuadrada a la varianza para obtener sigma
]

Luego en el otro item nos piden el mismo problema si las pastillas no estan en
tabletas, es decir todas en el cajon "aleatoriamente"

En este caso los calculos son exactamente los mismos pero en vez de tener una
Binomial, tenemos una Hipergeometrica y tenemos que contar los casos en la
poblacion de una forma considerablemente distinta, tenemos:

- $N = "Population size" = 80$
- $K = "Successes in population" = 60$
- $n = "Extraction size" = 9$
- $x = "Desired successes (Paracetamol) on extraction"$

$ X tilde "Hiper"(80, 60, 9) $

$ P(X >= 6) = 1 - P(X <= 5) = 1 - "Hipercdf"(80, 60, 9, 5) = 1 - 0.1530 $

#align(center)[#table()[$P(X >= 6) = 0.8470$]]

#importante[
  Recordar la forma de la esperanza y varianza de la Hipergeometrica
]

Redefinimos $ X tilde "Hiper"(80, 60, 6) $

$ E[X] = n K/N = 6 60/80 = 4.5 $
$ sigma = sqrt(V[X]) = m_X (1 - K/N)(N - n)/(N - 1) = sqrt(4.5(1 - 60/80) 74/79)
= sqrt(1.0538) $

#align(center)[#table()[
  $E[X] = 4.5$\
  $sigma = 1.0265$
]]


== Tests de Hipotesis

Josefina va a la guardia y Amalia, la medica que la atiende dice que esta 
engripada. Tambien le comenta que historicamente, el 25% de las personas que
acuden a la guardia, estan engripadas, y el resto solo tiene un resfrio 
alergico.

Por lo tanto, Amalia quiere saber si se mantiene ese porcentaje o ha cambiado.
Con tal fin, decide guardar los datos sobre los proximos $n = 400$ pacientes y
calcula la proporcion de personas engripadas en el grupo que le toco atender.
Decide considerar un nivel de significacion del 6%.

=== (1 punto)
Calcular la probabilidad de error tipo II, si el porcentaje real de personas
engripadas es 18%

=== (1 punto)
Si observa un porcentaje de 29% de personas engripadas, calcular el p-valor,
que concluye?

_Solucion_

#importante[
  Los puntos criticos me dicen donde esta la region critica, que seria donde
  rechazamos y donde aceptamos la Hipotesis, por lo que es *FUNDAMENTAL*
  recordar esas formulas y son muy similares entre media y proporcion, asique
  no hay excusa
]

$ H_0: p = p_0 = 0.25 $
$ H_1: p != 0.25 $

Para el calculo de los valores criticos para la proporcion, hacemos:

$ "Nivel de significacion" = 0.06 = alpha $
$ Phi^(-1) (1 - alpha/2) = 1.8808 $

$ p_c_1 = p_0 - Phi^(-1) (1-alpha/2) sqrt((p_0 * (1 - p_0))/n) = 0.25 - 1.8808 
sqrt(0.25 0.75 / 400) = 0.2093 $
$ p_c_2 = 0.25 + 1.8808 sqrt((p_0 * (1 - p_0))/n) = 0.25 + 1.8808 
sqrt(0.25 0.75 / 400) = 0.2907 $

$ P("error tipo II") = P(p_c_1 <= p <= p_c_2 | p = 0.18) =
Phi((p_c_2 - 0.18)/sqrt(0.18 0.82/400)) - Phi((p_c_1 - 0.18)/sqrt(0.18 0.82/400)) $

#align(center)[#table()[$P("error tipo II") = Phi((0.2907 - 0.18)/sqrt(0.18 0.82/400)) - Phi((0.2093 - 0.18)/sqrt(0.18 0.82/400))$]]

Si se observa un 29% de las personas engripadas, calcular el p-valor

$ Z "calculado" = 1.8475 $
$ "Rechazamos" H_0 "si" 1.8475 > 1.8808 => "No hay suficiente evidencia para rechazar" $

#align(center)[#table()[
  $ "p-valor" = 2 times Phi(-1.8475) = 0.0646 $
]]


== Variables Aleatorias Bidimensionales

El tiempo T que Josefina pasa en la guardia en horas, ya que se expone tambien
a las otras personas infectadas, tiene un impacto en la carga viral de la 
infeccion.

La carga viral se vincula con la cantidad de virus circulante en el cuerpo y 
por ende, en la gravedad de la enfermedad. En general puede tomar numeros muy
altos y por eso, se mide en general de forma logaritmica. Es decir, si llamamos
C a la carga viral de Josefina, se suele analizar $X = log(10, C)$

Supongamos que $T$ y $X$ se vinculan mediante la siguiente densidad conjunta:

$ f_(T X) (t, x) = cases(
  3/160 t x &"si" 0 <= t <= 4 and 1 <= x <= t + 1,
  0         &"elsewhere",
) $

=== (1.5 Puntos)
Calcular $P(X <= 3)$ y $P(X <= 3 | T > 2)$


=== (0.5 Puntos)
Calcular $P(C > 1000)$

