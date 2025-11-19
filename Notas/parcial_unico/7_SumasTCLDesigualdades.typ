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

= Generalidades

Sean $X$ e $Y$ variables aleatorias:

$ E[X + Y] = E[X] + E[Y] $

$ "Var"[X + Y] = V[X] + 2 "Cov"[X, Y] + "Var"[Y] $

$ "Cov"[X, Y] = E[X.Y] - E[X].E[Y] $

#nota[
  Para variables aleatorias *independientes*

  \

  #align(center)[Para variables *continuas*]
  $ f_(X + Y) (z) = integral_(-infinity)^(infinity) f_X (x) f_Y (z - x) d x
  = integral_(-infinity)^(infinity) f_X (z - y) f_Y (y) d y $

  \

  #align(center)[Para variables *discretas*]
  $ P(X + Y = z) = sum_(x in R_X) P(X = x) P(Y = z - x) = sum_(y in R_Y) P(X = z - y) P(Y = y) $
]

#nota[
  *Varianza* y *Esperanza* de Suma de Variables aleatorias

  Sean ${X_k}_(k = 1)^n$ variables aleatorias independientes y llamemos

  $ S_n = sum_(k = 1)^n X_k $

  $ E[S_n] = sum_(k = 1)^n E[X_k] $
  $ V[S_n] = sum_(k = 1)^n V[X_k] $

  #importante[
    Solo si son *identicamente distribuidas*, vale
    $ E[S_n] = n E[X_1] $
    $ V[S_n] = n V[X_1] $
  ]
]

#nota[
  Sumas especiales, *para estas sumas suponemos que las variables a sumar son
  independientes entre si*

  1. Suma de Binomiales es Binomial con $n = a + b$, siendo a y b el n de las va

  $ N_1 tilde "Bino"(n, p), N_2 tilde "Bino"(m, p) => N_1 + N_2 tilde "Bino"(m + n, p) $

  2. Suma de Poisson es Poisson con $lambda = lambda_1 + lambda_2$

  $ N_1 tilde "Pois"(lambda_1), N_2 tilde "Pois"(lambda_2) => N_1 + N_2 tilde 
  "Pois"(lambda_1 + lambda_2) $

  3. Suma de Norm es Norm

  $ X_1 tilde N(mu_1, sigma_1), X_2 tilde N(mu_2, sigma_2) $
  $ X_1 + X_2 tilde N(mu_1 + mu_2, sqrt((sigma_1)^2 + (sigma_2)^2)) $

  4. Suma de expo es gama, sean $X_1, X_2, ..., X_n tilde "exp"(lambda)$

  $ sum_(k = 1)^n X_k tilde Gamma(n, lambda) $
  $ f_Gamma(n, lambda) (x) = ((lambda x)^n-1)/((n - 1)!) lambda e^(-lambda x),
  x > 0 $

  5. Suma de los cuadrados de normales es chi-cuadrado, sean $X_1, X_2, ..., 
  X_n tilde N(0, 1)$

  $ sum_(k = 1)^n X_k^2 tilde chi_n^2 $
  $ f_chi_n^2 (x) = (x/2)^(n/2) (e^(x/2))/(x Gamma (n/2)), x > 0 $

  6. Suma de chi-cuadrado es chi-cuadrado, sean $X_1 tilde chi_n^2$ y $X_2 tilde chi_m^2$

  $ X_1 + X_2 tilde chi_(n + m)^2 $

  7. Suma de Cauchy, sean $X_1 tilde "Cauchy"(x_1, gamma_1)$ y 
    $X_2 tilde "Cauchy"(x_2, gamma_2)$

  $ X_1 + X_2 tilde "Cauchy"(x_1 + x_2, gamma_1 + gamma_2) $
  $ f_X_1 (x) = 1/pi gamma/(gamma^2 + (x - x_1)^2) $

]

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

= Promedio

$ overline(X)_n = "El promedio de una muestra de tamaño" n $

$ overline(X)_n = (sum_(i = 1)^n X_i)/n = (S_n)/n $

- $E(overline(X)_n) = E(S_n / n) = 1/n E(S_n) = mu_x$

- $V(overline(X)_n) = V(S_n / n) = 1/(n^2) V(S_n) = (n sigma^2)/(n^2) = sigma^2 /n => sigma(overline(X)_n) = sigma/sqrt(n)$

#importante[
$ P(|overline(X)_n - E(overline(X)_n)| >= epsilon) <= (V(overline(X)_n))/(epsilon) $

A medida de que se promedian mas variables, la probabilidad de que ese promedio, este lejos del valor esperado, se achica.
]

= Ley de los grandes numeros

== Ley debil

$ X_i, "v.a.i.i.d. con" E(X_i) $
$ lim_(n -> infinity) P(|overline(X)_n - mu| >= epsilon) = 0 $

#nota[
La probabilidad de que el promedio se aleje del valor esperado tiende a cero a mayor tamaño muestral. *Sentido comun*.
]

== Ley fuerte

$ P(lim_(n -> infinity) overline(X)_n = mu) = 1 $

= Teorema Central del Limite (TCL)

Sean ${X_k}_(k = 1)^n$ i.i.d. con $mu = E[X_1]$ y $sigma^2 = V[X_1]$. Def:

$ Z_n = (overline(X)_n - mu)/(sigma/sqrt(n)) $

TCL dice que

#align(center)[#table()[
  $ lim_(n -> infinity) F_(Z_n) (z) = lim_(n -> infinity) P(Z_n <= z) = Phi(z) $
]]


#importante[
  *Siempre normalizamos a partir de lo que queremos aproximar*

  Aprox. validas para $n > 20$:

  $ F_Z_n (z) = P(Z_n <= z) approx Phi(z) $
  $ F_(overline(X)_n) (x) = P(overline(X)_n <= x) approx Phi((x - mu_(overline(X)_n))/(sigma_(overline(X)_n))) $
  $ F_S_n (s) = P(S_n <= s) approx Phi((s - mu_S_n)/(sigma_S_n)) $

  Sea $A subset.eq Omega$ un evento posible, $p = P(A)$. Supongamos que se 
  repite varias veces el experimento, $hat(P)_n$, para $n > 20$

  $ F_hat(P)_n (q) = P(hat(P)_n <= q) approx Phi((q - p)/sqrt((p(1 - p))/n)) $

]

== Correccion por continuidad

Podemos usar *TCL* para aproximar *VADs* pero notemos que estamos aproximando
algo discreto, usando una funcion continua, por lo que tenemos que hacer una
correccion para que realmente aproxime una variable discreta

Por ejemplo si tenemos las VAD ${X_k}_(k = 1)^n$ i.i.d., con recorrido
$R_X = {0, 1, 2, ...}$, con $mu = E[X_1]$ y $sigma^2 = V[X_1]$, luego
$R_S_n = {0, 1, 2, ...}$ y

$ P(S_n = s) = P(s - a/2 < S_n <= s + 1/2) approx 
Phi((s + 1/2 - n mu)/(sigma sqrt(n))) - Phi((s - 1/2 - n mu)/(sigma sqrt(n))) $

$ P(overline(X)_n = x) = P(x - 1/(2n) < overline(X)_n <= x + 1/(2n)) approx
Phi((x + 1/(2n) - mu)/(sigma/sqrt(n))) - Phi((x - 1/(2n) - mu)/(sigma/sqrt(n))) $

para todo $s in R_S_n$ y $x in R_overline(X)_n$




