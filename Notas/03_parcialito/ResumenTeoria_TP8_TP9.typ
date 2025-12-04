#set document(
  title: "Resumen Teoria - TP8 y TP9",
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
      [2025]
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

#set list(indent: 1em, marker: ("*", "-", "."))
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

// Funciones de cajas
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

#let definicion(titulo, contenido) = {
  block(
    fill: rgb("#F3E5F5"),
    stroke: rgb("#7B1FA2") + 1pt,
    inset: 10pt,
    radius: 4pt,
    width: 100%,
  )[
    #text(weight: "bold", fill: rgb("#7B1FA2"))[#titulo:] #contenido
  ]
}

// PORTADA
#align(center)[
  #v(1em)
  #text(size: 24pt, weight: "bold")[Resumen Teorico]
  #v(0.5em)
  #text(size: 18pt)[TP8: Estimacion | TP9: Pruebas de Hipotesis]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadistica 93.24\
    2025
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

= TP8 - Estimacion de Parametros

== Generalidades de Estimacion

#definicion("Estimador")[
  Sean $X_1, X_2, ..., X_n$ v.a. cuya distribucion depende de un parametro $theta$ desconocido. Un *estimador* $hat(theta)$ es una funcion de las v.a. que aproxima $theta$.
]

#definicion("Estimacion")[
  Si se obtienen valores $x_1, ..., x_n$ de la muestra, la *estimacion* es el valor numerico $hat(theta)(x_1, ..., x_n)$.
]

=== Error Cuadratico Medio (ECM)

$ "ECM"(hat(theta)) = E[(hat(theta) - theta)^2] = "sesgo"^2(hat(theta)) + "Var"(hat(theta)) $

donde:
$ "sesgo"(hat(theta)) = E[hat(theta)] - theta $

#importante[
  - *Insesgado:* $E[hat(theta)] = theta$ (sesgo = 0)
  - *Asintoticamente insesgado:* $lim_(n -> infinity) E[hat(theta)] - theta = 0$
  - *Consistente:* $lim_(n -> infinity) hat(theta) = theta$
]

== Metodos de Estimacion

=== Maximum Likelihood Estimation (MLE)

#definicion("Verosimilitud")[
  La funcion de verosimilitud es $f(x_1, ..., x_n; theta)$, la densidad conjunta vista como funcion de $theta$.
]

$ hat(Theta) = arg max_theta f(X_1, ..., X_n; theta) $

#tip[
  Conviene trabajar con la *log-verosimilitud*:
  $ cal(L)(theta) = ln f(X_1, ..., X_n; theta) $
  Derivar, igualar a cero y despejar $theta$.
]

*Ejemplo:* $X_i tilde cal(N)(mu, 1)$ i.i.d.

$ f(X_1, ..., X_n; mu) = product_(i=1)^n 1/sqrt(2 pi) e^(-(X_i - mu)^2 / 2) $

$ cal(L)(mu) = -n/2 ln(2 pi) - sum_(i=1)^n (X_i - mu)^2 / 2 $

$ (partial cal(L))/(partial mu) = 0 ==> hat(mu) = 1/n sum_(i=1)^n X_i = overline(X) $

#nota[
  Los estimadores MLE son *asintoticamente consistentes*.
]

=== Metodo de los Momentos

Igualar momentos poblacionales con momentos muestrales:

$ mu_k = E[X^k] = w_k(theta) $

$ hat(Theta) = w_k^(-1)(hat(mu)_k) $

*Ejemplo:* $X_i tilde "Exp"(theta)$

$ E[X] = 1/theta ==> hat(mu) = 1/n sum X_i = 1/hat(Theta) ==> hat(Theta) = n / (sum X_i) $

=== Maximo a Posteriori (MAP)

#definicion("Enfoque Bayesiano")[
  Se considera $Theta$ como v.a. con distribucion *a priori* $f_Theta(theta)$.
]

Usando Bayes:
$ f(theta | X_1, ..., X_n) = (f(X_1, ..., X_n | theta) f_Theta(theta)) / (integral f(X_1, ..., X_n | zeta) f_Theta(zeta) d zeta) $

$ hat(theta) = arg max_theta f(theta | X_1, ..., X_n) $

#importante[
  A medida que $n -> infinity$, la informacion *a priori* pierde importancia y el estimador MAP converge al MLE.
]

#pagebreak()

== Estimadores Puntuales

=== Estimador de la Media

$ hat(mu) = overline(X) = 1/n sum_(k=1)^n X_k $

#align(center)[#table(
  columns: 2,
  align: (left, left),
  [*Propiedad*], [*Resultado*],
  [Insesgado], [Si, $E[overline(X)] = mu$],
  [Consistente], [Si (Ley de Grandes Numeros)],
  [ECM], [$"Var"(overline(X)) = sigma^2 / n$],
  [Si $X_1 tilde cal(N)(mu, sigma)$], [$hat(mu) tilde cal(N)(mu, sigma/sqrt(n))$],
  [TCL (n grande)], [$hat(mu)$ es asintoticamente normal],
)]

=== Estimador de la Varianza

$ hat(sigma)^2 = S^2 = 1/(n-1) sum_(k=1)^n (X_k - overline(X))^2 $

#align(center)[#table(
  columns: 2,
  align: (left, left),
  [*Propiedad*], [*Resultado*],
  [Insesgado], [Si (gracias al $n-1$)],
  [Varianza], [$"Var"(S^2) = sigma^4/n (kappa + 2 + 2/(n-1))$],
  [Si $X_1 tilde cal(N)(mu, sigma)$], [$(n-1)S^2/sigma^2 tilde chi^2_(n-1)$],
)]

donde $kappa = "curtosis" = E[(X_1 - E[X_1])^4]/sigma^4 - 3$

=== Estimador de una Proporcion

Sean $X_i tilde "Bernoulli"(p)$ i.i.d.

$ hat(p) = F = 1/n sum_(k=1)^n X_k $

#align(center)[#table(
  columns: 2,
  align: (left, left),
  [*Propiedad*], [*Resultado*],
  [Insesgado], [Si],
  [ECM], [$"Var"(hat(p)) = p(1-p)/n$],
  [Distribucion exacta], [$n hat(p) tilde "Binomial"(n, p)$],
  [TCL (n grande)], [$hat(p) approx cal(N)(p, sqrt(p(1-p)/n))$],
)]

#pagebreak()

== Estimacion por Intervalos

#definicion("Intervalo de Confianza")[
  Intervalo $(hat(theta)_l^alpha, hat(theta)_u^alpha)$ tal que:
  $ P(hat(theta)_l^alpha < theta < hat(theta)_u^alpha) = 1 - alpha $
  donde $1 - alpha$ es el *nivel de confianza*.
]

#importante[
  *Interpretacion frecuentista:* Si tomamos $N$ muestras y construimos $N$ intervalos, aproximadamente $(1-alpha)N$ contendran al verdadero $theta$.
]

Tipos de intervalos:
- *Bilateral:* ambos limites finitos
- *Unilateral a derecha:* $(-infinity, hat(theta)_u^alpha)$
- *Unilateral a izquierda:* $(hat(theta)_l^alpha, +infinity)$

=== IC para la Media ($sigma$ conocida)

Sean $X_i tilde cal(N)(mu, sigma)$ i.i.d., $sigma^2$ conocida. Con nivel de confianza $gamma$:

#align(center)[#table(
  columns: 2,
  align: (left, left),
  [*Tipo*], [*Intervalo*],
  [Unilateral derecha], [$(-infinity, overline(X) + z_gamma sigma/sqrt(n))$],
  [Unilateral izquierda], [$(overline(X) - z_gamma sigma/sqrt(n), +infinity)$],
  [Bilateral], [$(overline(X) - z_((1+gamma)/2) sigma/sqrt(n), overline(X) + z_((1+gamma)/2) sigma/sqrt(n))$],
)]

donde $z_p = Phi^(-1)(p)$ es el percentil de la normal estandar.

#tip[
  Por TCL, estas formulas valen para n grande aunque las v.a. no sean normales. Si $sigma$ es desconocida y n es muy grande, reemplazar $sigma$ por $S$.
]

=== IC para la Media ($sigma$ desconocida)

Sean $X_i tilde cal(N)(mu, sigma)$ i.i.d., ambos desconocidos. Usar *t-Student*:

#align(center)[#table(
  columns: 2,
  align: (left, left),
  [*Tipo*], [*Intervalo*],
  [Unilateral derecha], [$(-infinity, overline(X) + t_(n-1,gamma) S/sqrt(n))$],
  [Unilateral izquierda], [$(overline(X) - t_(n-1,gamma) S/sqrt(n), +infinity)$],
  [Bilateral], [$(overline(X) - t_(n-1,(1+gamma)/2) S/sqrt(n), overline(X) + t_(n-1,(1+gamma)/2) S/sqrt(n))$],
)]

donde $t_(k,p)$ es el percentil de t-Student con $k$ grados de libertad.

#nota[
  Para $n > 200$, la t-Student es muy similar a la normal, asi que $t_(n-1,delta) approx z_delta$.
]

=== IC para Proporcion (n grande)

#align(center)[#table(
  columns: 2,
  align: (left, left),
  [*Tipo*], [*Intervalo*],
  [Unilateral derecha], [$[0, hat(p) + z_gamma sqrt((hat(p)(1-hat(p)))/n))$],
  [Unilateral izquierda], [$(hat(p) - z_gamma sqrt((hat(p)(1-hat(p)))/n), 1]$],
  [Bilateral], [$(hat(p) - z_((1+gamma)/2) sqrt((hat(p)(1-hat(p)))/n), hat(p) + z_((1+gamma)/2) sqrt((hat(p)(1-hat(p)))/n))$],
)]

#nota[
  Notar que $p in [0,1]$ y se usa $hat(p)(1-hat(p))$ como estimador de la varianza.
]

#pagebreak()

= TP9 - Pruebas de Hipotesis

== Generalidades

#definicion("Hipotesis Estadistica")[
  Afirmacion sobre parametros de una poblacion. Se contrasta una *hipotesis nula* ($H_0$) contra una *hipotesis alternativa* ($H_1$).
]

#definicion("Estadistico de Prueba")[
  Valor $Lambda$ calculado a partir de la muestra. Se rechaza $H_0$ cuando $Lambda in R$ (region critica).
]

=== Tipos de Errores

#align(center)[#table(
  columns: 3,
  align: (left, center, center),
  [], [*$H_0$ verdadera*], [*$H_0$ falsa*],
  [Se acepta $H_0$], [OK], [Error Tipo II ($beta$)],
  [Se rechaza $H_0$], [Error Tipo I ($alpha$)], [OK],
)]

#importante[
  - *Nivel de significacion* ($alpha$): maxima prob. de Error Tipo I
  - *Potencia* ($1 - beta$): prob. de rechazar $H_0$ cuando es falsa
]

#definicion("Valor p")[
  Probabilidad de obtener un estadistico "peor" que el observado, asumiendo $H_0$ verdadera. Se rechaza $H_0$ si $p < alpha$.
]

== Pruebas para la Media

=== Tres Tipos de Pruebas

*1. Dos colas:*
$ H_0: mu = mu_0 quad "vs" quad H_1: mu != mu_0 $
Rechazo: $Lambda in.not (lambda_l, lambda_u)$

*2. Cola derecha:*
$ H_0: mu <= mu_0 quad "vs" quad H_1: mu > mu_0 $
Rechazo: $Lambda > lambda_u$

*3. Cola izquierda:*
$ H_0: mu >= mu_0 quad "vs" quad H_1: mu < mu_0 $
Rechazo: $Lambda < lambda_l$

=== Con Varianza Conocida (Test Z)

Estadistico: $ Z = (overline(X) - mu_0)/(sigma/sqrt(n)) $

#align(center)[#table(
  columns: 3,
  align: (left, center, center),
  [*Prueba*], [*Rechazo*], [*Valor p*],
  [$H_0: mu = mu_0$], [$Z < -z_(1-alpha/2)$ o $Z > z_(1-alpha/2)$], [$2(1 - Phi(|z_"obs"|))$],
  [$H_0: mu <= mu_0$], [$Z > z_(1-alpha)$], [$1 - Phi(z_"obs")$],
  [$H_0: mu >= mu_0$], [$Z < -z_(1-alpha)$], [$Phi(z_"obs")$],
)]

#tip[
  Por TCL, estas formulas valen para n grande aunque las v.a. no sean normales. Si $sigma$ es desconocida y n grande, usar $S$ en lugar de $sigma$.
]

=== Con Varianza Desconocida (Test t)

Estadistico: $ T = (overline(X) - mu_0)/(S/sqrt(n)) $

#align(center)[#table(
  columns: 3,
  align: (left, center, center),
  [*Prueba*], [*Rechazo*], [*Valor p*],
  [$H_0: mu = mu_0$], [$T < -t_(n-1,1-alpha/2)$ o $T > t_(n-1,1-alpha/2)$], [$2(1 - Xi_(n-1)(|t_"obs"|))$],
  [$H_0: mu <= mu_0$], [$T > t_(n-1,1-alpha)$], [$1 - Xi_(n-1)(t_"obs")$],
  [$H_0: mu >= mu_0$], [$T < -t_(n-1,1-alpha)$], [$Xi_(n-1)(t_"obs")$],
)]

donde $Xi_(n-1)$ es la CDF de la t-Student con $n-1$ grados de libertad.

== Pruebas para una Proporcion

Sea $q$ la probabilidad desconocida. Con $n$ grande ($n > 100$):

Estadistico: $ Z = (hat(q) - q_0)/sqrt((q_0(1-q_0))/n) $

#align(center)[#table(
  columns: 3,
  align: (left, center, center),
  [*Prueba*], [*Rechazo*], [*Valor p*],
  [$H_0: q = q_0$], [$|Z| > z_(1-alpha/2)$], [$2(1 - Phi(|z_"obs"|))$],
  [$H_0: q <= q_0$], [$Z > z_(1-alpha)$], [$1 - Phi(z_"obs")$],
  [$H_0: q >= q_0$], [$Z < -z_(1-alpha)$], [$Phi(z_"obs")$],
)]

#pagebreak()

= Resumen de Formulas Clave

== Estimadores Puntuales

#align(center)[#table(
  columns: 3,
  align: (center, center, center),
  [*Parametro*], [*Estimador*], [*Varianza del Estimador*],
  [$mu$], [$overline(X) = 1/n sum X_i$], [$sigma^2/n$],
  [$sigma^2$], [$S^2 = 1/(n-1) sum(X_i - overline(X))^2$], [$2 sigma^4/(n-1)$ (normal)],
  [$p$], [$hat(p) = X/n$], [$p(1-p)/n$],
)]

== Intervalos de Confianza Bilaterales

#align(center)[#table(
  columns: 2,
  align: (left, center),
  [*Caso*], [*IC al nivel $gamma$*],
  [Media, $sigma$ conocida], [$overline(X) plus.minus z_((1+gamma)/2) sigma/sqrt(n)$],
  [Media, $sigma$ desconocida], [$overline(X) plus.minus t_(n-1,(1+gamma)/2) S/sqrt(n)$],
  [Proporcion (n grande)], [$hat(p) plus.minus z_((1+gamma)/2) sqrt((hat(p)(1-hat(p)))/n)$],
)]

== Estadisticos de Prueba

#align(center)[#table(
  columns: 2,
  align: (left, center),
  [*Caso*], [*Estadistico*],
  [Media, $sigma$ conocida], [$Z = (overline(X) - mu_0)/(sigma/sqrt(n))$],
  [Media, $sigma$ desconocida], [$T = (overline(X) - mu_0)/(S/sqrt(n))$],
  [Proporcion (n grande)], [$Z = (hat(p) - p_0)/sqrt((p_0(1-p_0))/n)$],
)]

== Valores Criticos Comunes

#align(center)[#table(
  columns: 4,
  align: (center, center, center, center),
  [$alpha$], [$z_(1-alpha/2)$], [$z_(1-alpha)$], [Confianza],
  [0.10], [1.645], [1.282], [90%],
  [0.05], [1.960], [1.645], [95%],
  [0.01], [2.576], [2.326], [99%],
)]

#error[
  No confundir:
  - *Nivel de confianza* ($1 - alpha$): para IC
  - *Nivel de significacion* ($alpha$): para tests
  - IC del 95% corresponde a test con $alpha = 0.05$
]

#tip[
  - Test *bilateral*: usar $z_(1-alpha/2)$ o $t_(n-1,1-alpha/2)$
  - Test *unilateral*: usar $z_(1-alpha)$ o $t_(n-1,1-alpha)$
]
