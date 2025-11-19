#set document(
  title: "Guía Rápida - TP8 y TP9",
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

// PORTADA
#align(center)[
  #v(1em)
  #text(size: 24pt, weight: "bold")[Guía de Referencia Rápida]
  #v(0.5em)
  #text(size: 18pt)[TP8 y TP9 - Estimación y Pruebas de Hipótesis]
  #v(0.5em)
  #text(size: 14pt)[Con MicroPython]
  #v(0.5em)
  #text(size: 12pt, fill: gray)[
    Probabilidad y Estadistica\
    2025
  ]
  #v(1em)
]

#line(length: 100%, stroke: 1pt)
#v(1em)

= Índice Rápido de Programas

#align(center)[#table(
  columns: 3,
  align: (left, left, left),
  [*Tipo de Problema*], [*Archivo Python*], [*Función Principal*],

  [IC media ($sigma$ conocida)], [`Estimacion.py`], [`IC_media_sigma_conocida()`],
  [IC media ($sigma$ desconocida)], [`Estimacion.py`], [`IC_media_sigma_desconocida()`],
  [IC proporción], [`Estimacion.py`], [`IC_proporcion()`],
  [IC datos agrupados], [`EstimacionDeDatosAgrupados.py`], [`IC_media_agrupada()`],
  [IC datos directos], [`EstimacionMuestrasDirectas.py`], [`IC_media()`],
  [IC varianza], [`IC_Varianza.py`], [`IC_varianza()`],
  [IC diferencia medias], [`IC_DiferenciaMedias.py`], [Varias funciones según caso],
  [IC diferencia proporciones], [`IC_DiferenciaProporciones.py`], [`IC_diferencia_proporciones()`],
  [Tamaño muestral media], [`Estimacion.py`], [`n_media()`],
  [Tamaño muestral proporción], [`Estimacion.py`], [`n_proporcion()`],
  [Test Z media], [`PruebasHipotesis.py`], [`z_test_media_sigma_conocida()`],
  [Test t media], [`PruebasHipotesis.py`], [`t_test_media_sigma_desconocida()`],
  [Test Z proporción], [`PruebasHipotesis.py`], [`z_test_proporcion()`],
  [Test diferencia medias], [`PruebasHipotesis_DosMuestras.py`], [Varias funciones],
  [Test diferencia proporciones], [`PruebasHipotesis_DosMuestras.py`], [`z_test_diferencia_proporciones()`],
)]

#pagebreak()

= TP8 - Estimación de Parámetros

== Ejercicios con Resolución en el PDF

=== Ejercicio 9: Llenadora de latas de café

*Enunciado resumido:* Máquina dosifica cantidades con distribución normal, $sigma = 15$ g. Muestra de $n=10$ con $overline(x) = 246$ g.

a) IC del 90% para dosificación media

b) Tamaño muestral para error de muestreo de 5 gramos

*Archivo a usar:* `Estimacion.py`

*Código:*

```python
# Datos
X_barra = 246
sigma = 15
n = 10
alfa = 0.1

# a) IC del 90%
# z = invNorm(1 - 0.1/2) = invNorm(0.95)
z = 1.6449

margen = z * sigma / (n ** 0.5)
IC = (X_barra - margen, X_barra + margen)
print("IC 90%:", IC)
# Resultado: (238.20, 253.80)

# b) Tamaño muestral para E = 5
E = 5
n_nuevo = (z * sigma / E) ** 2
print("n necesario:", n_nuevo)
# Resultado: n = 25, entonces 15 envases mas
```

#nota[
Este ejercicio usa $sigma$ conocida, por lo que el estadístico es $Z tilde N(0,1)$. Si $sigma$ fuera desconocida, usaríamos distribución t-Student.
]

#pagebreak()

=== Ejercicio 13: Contenido de silicio en coladas

*Enunciado resumido:* Tabla con datos agrupados de contenido de silicio en 150 coladas. Estimar con 95% de confianza el contenido medio.

*Archivo a usar:* `EstimacionDeDatosAgrupados.py`

*Código:*

```python
# Datos agrupados
clases = [(0.333, 0.433), (0.433, 0.533), (0.533, 0.633),
          (0.633, 0.733), (0.733, 0.833), (0.833, 0.933),
          (0.933, 1.033)]
frecuencias = [4, 12, 19, 28, 48, 25, 14]

n = 150
gl = n - 1
alfa = 0.05
# z = invNorm(0.975)
z = 1.9599

# Calcular marcas de clase
marcas = [(a + b)/2 for a, b in clases]

# Media muestral agrupada
suma = sum(m * f for m, f in zip(marcas, frecuencias))
x_barra = suma / n

# Varianza muestral agrupada
var = sum(f * (m - x_barra)**2 for m, f in zip(marcas, frecuencias))
var = var / (n - 1)
s = var ** 0.5

# IC con aproximacion normal (n grande)
margen = z * s / (n ** 0.5)
IC = (x_barra - margen, x_barra + margen)
print("IC 95%:", IC)
# Resultado: (0.716, 0.763)
```

#importante[
Como $n=150$ es grande, podemos usar aproximación normal (z) en lugar de t-Student. Para $n < 30$ deberíamos usar t.
]

#pagebreak()

=== Ejercicio 14: Recipientes de ácido sulfúrico

*Enunciado resumido:* Contenidos de 7 recipientes: 9.8, 10.2, 10.4, 9.8, 10.0, 10.2, 9.6 litros. IC del 95% para la media.

*Archivo a usar:* `EstimacionMuestrasDirectas.py`

*Código:*

```python
# Datos directos
datos = [9.8, 10.2, 10.4, 9.8, 10.0, 10.2, 9.6]
n = len(datos)  # n = 7
gl = n - 1      # gl = 6
alfa = 0.05

# t = invT(1 - 0.05/2, 6) = invT(0.975, 6)
t = 2.447

# Calcular media
x_barra = sum(datos) / n

# Calcular varianza muestral
s2 = sum((x - x_barra)**2 for x in datos) / (n - 1)
s = s2 ** 0.5

# IC del 95%
margen = t * s / (n ** 0.5)
IC = (x_barra - margen, x_barra + margen)
print("IC 95%:", IC)
# Resultado: (9.74, 10.26)
```

#tip[
Cuando tenés datos directos (no agrupados), podés usar `EstimacionMuestrasDirectas.py`. Con muestras chicas ($n < 30$) y $sigma$ desconocida, siempre usar t-Student.
]

#pagebreak()

=== Ejercicio 20: Proceso productivo con defectuosos

*Enunciado resumido:* Muestra de $n=300$ con 18 defectuosos.

a) IC del 90% para porcentaje defectuoso

b) Tamaño adicional para semiamplitud de 0.01

c) Porcentaje defectuoso máximo con 90% de confianza

*Archivo a usar:* `Estimacion.py`

*Código:*

```python
# Datos
x = 18      # defectuosos
n = 300     # muestra
p_hat = x / n  # p_hat = 0.06
alfa = 0.1

# a) IC bilateral del 90%
# z = invNorm(0.95)
z = 1.6449

margen = z * ((p_hat * (1 - p_hat) / n) ** 0.5)
IC = (p_hat - margen, p_hat + margen)
print("a) IC 90%:", IC)
# Resultado: (0.037, 0.083)

# b) Tamaño adicional para E = 0.01
E = 0.01
n_nuevo = (z ** 2) * p_hat * (1 - p_hat) / (E ** 2)
print("b) n necesario:", n_nuevo)
adicional = n_nuevo - n
print("   Adicional:", adicional)
# Resultado: n = 1526, adicional = 1226

# c) IC unilateral (porcentaje maximo)
# Para cola derecha: z_0.90
z_unilateral = 1.2816
p_max = p_hat + z_unilateral * ((p_hat * (1 - p_hat) / n) ** 0.5)
print("c) p maximo:", p_max)
# Resultado: 0.0776 (7.76%)
```

#nota[
Para intervalos unilaterales, el fractil cambia. En bilateral usamos $z_(1-alpha\/2)$, en unilateral usamos $z_(1-alpha)$.
]

#pagebreak()

=== Ejercicio 22: Rating de programa de TV

*Enunciado resumido:* Panel de 600 hogares, rating de 25% (150 hogares vieron el programa).

a) IC del 90% para el rating

b) Inversión adicional en dispositivos para error de $plus.minus 1%$

*Archivo a usar:* `Estimacion.py`

*Código:*

```python
# Datos
n = 600
p_hat = 0.25
alfa = 0.1

# a) IC del 90%
# z = invNorm(0.95)
z = 1.6449

margen = z * ((p_hat * (1 - p_hat) / n) ** 0.5)
IC = (p_hat - margen, p_hat + margen)
print("a) IC 90%:", IC)
# Resultado: (0.221, 0.279) o (22.1%, 27.9%)

# b) Tamaño para E = 0.01
E = 0.01

# Opcion 1: Conservadora (p = 0.5)
n_conservador = (z / (2 * E)) ** 2
print("b) n conservador:", n_conservador)
# Resultado: n = 6764, adicional = 6164

# Opcion 2: Con estimacion previa (p_hat = 0.25)
n_estimado = (z ** 2) * p_hat * (1 - p_hat) / (E ** 2)
print("   n con estimacion:", n_estimado)
adicional = n_estimado - n
print("   Adicional:", adicional)
# Resultado: n = 5073, adicional = 4473
```

#importante[
Cuando no tenés estimación previa de $p$, usá $p=0.5$ (más conservador). Si ya tenés datos, usá $hat(p)$ de la muestra previa para ahorrar tamaño muestral.
]

#pagebreak()

== Ejercicios Clave Adicionales

=== Ejercicio 7: Duración de piezas de equipo

*Tema:* IC media con $sigma$ conocida

*Datos:* $n=100$, $overline(x)=501.2$, $sigma=4$

*Código:*
```python
# Estimacion.py
X_barra = 501.2
sigma = 4
n = 100

# a) IC 95%: z = invNorm(0.975) = 1.96
z_95 = 1.96
IC_95 = IC_media_sigma_conocida(X_barra, sigma, n, z_95)

# b) IC 99%: z = invNorm(0.995) = 2.576
z_99 = 2.576
IC_99 = IC_media_sigma_conocida(X_barra, sigma, n, z_99)
```

=== Ejercicio 11: Densidad de producto químico

*Tema:* Tamaño muestral para media

*Datos:* $sigma=0.005$, error $< 0.002$, confianza 95%

*Código:*
```python
# Estimacion.py
sigma = 0.005
E = 0.002
z = 1.96  # invNorm(0.975)

n = (z * sigma / E) ** 2
# Resultado: n >= 25
```

=== Ejercicio 15: Tambores de suavizante

*Tema:* IC media con $sigma$ desconocida

*Datos:* $n=15$, $overline(x)=63$, $s=12.5$, confianza 90%

*Código:*
```python
# Estimacion.py
X_barra = 63
S = 12.5
n = 15
gl = n - 1  # gl = 14

# t = invT(0.95, 14)
t = 1.7613

IC = IC_media_sigma_desconocida(X_barra, S, n, t)
# Resultado: (57.3, 68.7)
```

=== Ejercicio 23: Diferencia de medias

*Tema:* IC diferencia de medias con varianzas iguales

*Datos:* Grupo 1: $overline(x)_1=28.5$, $s_1=4.2$, $n_1=15$; Grupo 2: $overline(x)_2=32.1$, $s_2=3.8$, $n_2=12$

*Código:*
```python
# IC_DiferenciaMedias.py
X1_barra = 28.5
X2_barra = 32.1
S1 = 4.2
S2 = 3.8
n1 = 15
n2 = 12
gl = n1 + n2 - 2  # gl = 25

# t = invT(0.975, 25)
t = 2.060

IC = IC_diferencia_medias_varianzas_iguales(
    X1_barra, X2_barra, S1, S2, n1, n2, t)
```

=== Ejercicio 24: Diferencia de medias (Welch)

*Tema:* IC diferencia de medias con varianzas distintas

*Datos:* Grupo 1: $overline(x)_1=18.7$, $s_1=6.5$, $n_1=20$; Grupo 2: $overline(x)_2=20.3$, $s_2=3.2$, $n_2=25$

*Código:*
```python
# IC_DiferenciaMedias.py
X1_barra = 18.7
X2_barra = 20.3
S1 = 6.5
S2 = 3.2
n1 = 20
n2 = 25

# Calcular grados de libertad de Welch
gl = gl_welch(S1, S2, n1, n2)
print("GL Welch:", gl)

# t = invT(0.975, gl)
t = 2.021

IC = IC_diferencia_medias_varianzas_distintas(
    X1_barra, X2_barra, S1, S2, n1, n2, t)
```

#tip[
Usá varianzas iguales (pooled) cuando ambas varianzas muestrales son similares. Si son muy diferentes, usá aproximación de Welch.
]

#pagebreak()

= TP9 - Pruebas de Hipótesis

== Ejercicios con Resolución en el PDF

=== Ejercicio 8: Resistencia de alambre aleado

*Enunciado resumido:* Fabricante dice $mu=250$ MN/m². Contratista prueba $n=35$ con $overline(x)=274.4$ y $s=11.2$. ¿Es significativamente diferente? ($alpha=0.05$)

*Archivo a usar:* `PruebasHipotesis.py`

*Código:*

```python
# Datos
X_barra = 274.4
mu_0 = 250
S = 11.2
n = 35
gl = n - 1
alfa = 0.05

# Test bilateral: H0: mu = 250 vs H1: mu != 250
# t_critico = invT(0.975, 34)
t_critico = 2.032

# Calcular estadistico t
t_obs = t_test_media_sigma_desconocida(X_barra, mu_0, S, n)
print("t observado:", t_obs)
# t_obs = 12.89

# Decision
print(decision_t_bilateral(t_obs, t_critico))
# Como |12.89| > 2.032, RECHAZAMOS H0
# Conclusion: La resistencia ES significativamente diferente
```

#importante[
Como $n=35 > 30$, podríamos usar aproximación normal, pero con t-Student es más preciso. El valor observado es muy extremo ($t=12.89$), rechazamos fuertemente $H_0$.
]

*Interpretación:* La evidencia muestral es muy fuerte ($t=12.89 >> 2.032$). El contratista puede concluir con alta confianza que la resistencia del lote es significativamente diferente a lo especificado.

#pagebreak()

=== Ejercicio 16: Control de proceso con defectuosos

*Enunciado resumido:* Proporción defectuosos es 2%. Se inspecciona muestra de tamaño $n$ cada hora, revisa proceso si hay $c$ o más defectuosos. Determinar $n$ y $c$ con:
- $alpha=0.1$ (probabilidad de detener cuando no hay que hacerlo)
- $beta(0.06)=0.2$ (probabilidad de NO detener cuando $p=6%$)

*Archivo a usar:* `PruebasHipotesis.py`

*Código:*

```python
# Datos
p_0 = 0.02
p_1 = 0.06
alfa = 0.1
beta_deseado = 0.2

# Test unilateral: H0: p <= 0.02 vs H1: p > 0.02

# Calcular n usando condiciones de alfa y beta
# Formula: n >= [(z_alfa * sqrt(p0(1-p0)/p1(1-p1)) - z_beta)^2] / [(p0-p1)^2/(p1(1-p1))]

z_alfa = 1.2816  # invNorm(0.9)
z_beta = -0.8416  # invNorm(0.2)

# Calculo simplificado
factor1 = (z_alfa * ((p_0*(1-p_0))/(p_1*(1-p_1)))**0.5 - z_beta)**2
factor2 = (p_0 - p_1)**2 / (p_1 * (1 - p_1))
n = factor1 / factor2
print("n minimo:", n)
# Resultado: n >= 90

# Determinar c (numero critico de defectuosos)
n = 90
p_hat_critico = p_0 + z_alfa * ((p_0 * (1 - p_0) / n) ** 0.5)
c = n * p_hat_critico
print("c (defectuosos criticos):", c)
# Resultado: c = 4 (se rechaza H0 si X >= 4)
```

#nota[
Este es un diseño de prueba de hipótesis. Fijamos $alpha$ y $beta$ ANTES de ver los datos, y determinamos $n$ y la región crítica que satisfacen ambas condiciones.
]

*Interpretación:* Cada hora, inspeccionar 90 piezas. Si hay 4 o más defectuosas, detener y revisar el proceso. Esto garantiza:
- Probabilidad de falsa alarma (detener sin necesidad) $<= 10%$
- Probabilidad de NO detectar cuando $p=6%$ (error tipo II) $<= 20%$

#pagebreak()

== Ejercicios Clave Adicionales

=== Ejercicio 1: Conceptos básicos de hipótesis

*Tema:* Entender errores tipo I y tipo II, potencia del test

*Conceptos clave:*
- *Error Tipo I ($alpha$):* Rechazar $H_0$ cuando es verdadera (falsa alarma)
- *Error Tipo II ($beta$):* NO rechazar $H_0$ cuando es falsa (falso negativo)
- *Potencia ($1 - beta$):* Probabilidad de detectar cuando $H_0$ es falsa
- *Región crítica:* Valores del estadístico que llevan a rechazar $H_0$

#tip[
En diseño de experimentos, elegís $alpha$ (usualmente 5%) y calculás $beta$ según $H_1$ específica. A menor $alpha$, mayor $beta$ para el mismo $n$.
]

=== Ejercicio 10: Test bilateral para media

*Enunciado resumido:* Se supone $mu=50$. Muestra $n=25$, $overline(x)=52.3$, $s=4.1$. Test con $alpha=0.05$.

*Archivo a usar:* `PruebasHipotesis.py`

*Código:*
```python
# Datos
X_barra = 52.3
mu_0 = 50
S = 4.1
n = 25
gl = n - 1  # gl = 24
alfa = 0.05

# Test bilateral: H0: mu = 50 vs H1: mu != 50
# t_critico = invT(0.975, 24)
t_critico = 2.064

# Calcular estadistico t
t_obs = (X_barra - mu_0) / (S / (n ** 0.5))
print("t observado:", t_obs)
# t_obs = 2.80

# Decision
if abs(t_obs) > t_critico:
    print("RECHAZAMOS H0")
else:
    print("NO RECHAZAMOS H0")
# Como |2.80| > 2.064, RECHAZAMOS H0
```

#nota[
Test bilateral: rechazamos si el valor observado está en cualquier extremo (muy grande o muy pequeño). Usamos $|t_"obs"| > t_(alpha\/2)$.
]

=== Ejercicio 11: Test unilateral para media

*Enunciado resumido:* Fabricante dice $mu >= 100$ horas. Muestra $n=40$, $overline(x)=96.2$, $s=8.5$. Test con $alpha=0.05$.

*Archivo a usar:* `PruebasHipotesis.py`

*Código:*
```python
# Datos
X_barra = 96.2
mu_0 = 100
S = 8.5
n = 40
gl = n - 1
alfa = 0.05

# Test unilateral izquierdo: H0: mu >= 100 vs H1: mu < 100
# t_critico = -invT(0.95, 39) (negativo porque es cola izquierda)
t_critico = -1.685

# Calcular estadistico t
t_obs = (X_barra - mu_0) / (S / (n ** 0.5))
print("t observado:", t_obs)
# t_obs = -2.83

# Decision (cola izquierda)
if t_obs < t_critico:
    print("RECHAZAMOS H0")
else:
    print("NO RECHAZAMOS H0")
# Como -2.83 < -1.685, RECHAZAMOS H0
```

#importante[
Test unilateral: solo una cola. Para $H_1: mu < mu_0$, rechazamos si $t_"obs" < -t_(alpha)$. Para $H_1: mu > mu_0$, rechazamos si $t_"obs" > t_(alpha)$.
]

*Interpretación:* Evidencia suficiente para concluir que la duración promedio es significativamente menor a 100 horas.

#pagebreak()

=== Ejercicio 15: Test de proporción

*Enunciado resumido:* Se dice que 30% de estudiantes prefieren modalidad online. Encuesta a $n=200$, 70 prefieren online. ¿Contradice la afirmación? ($alpha=0.05$)

*Archivo a usar:* `PruebasHipotesis.py`

*Código:*
```python
# Datos
x = 70
n = 200
p_hat = x / n  # p_hat = 0.35
p_0 = 0.30
alfa = 0.05

# Test bilateral: H0: p = 0.30 vs H1: p != 0.30
# z_critico = invNorm(0.975)
z_critico = 1.96

# Calcular estadistico z
z_obs = (p_hat - p_0) / ((p_0 * (1 - p_0) / n) ** 0.5)
print("z observado:", z_obs)
# z_obs = 1.54

# Decision
if abs(z_obs) > z_critico:
    print("RECHAZAMOS H0")
else:
    print("NO RECHAZAMOS H0")
# Como |1.54| < 1.96, NO RECHAZAMOS H0
```

#nota[
Para pruebas de proporción con $n$ grande, usamos aproximación normal. El test es válido si $n dot p_0 >= 5$ y $n dot (1-p_0) >= 5$.
]

*Interpretación:* No hay evidencia suficiente para rechazar que la proporción es 30%. La diferencia observada (35% vs 30%) puede deberse a variabilidad muestral.

#pagebreak()

= Resumen de Decisiones en Pruebas de Hipótesis

#align(center)[#table(
  columns: 3,
  align: (left, center, center),
  [*Tipo de Test*], [*Rechazar $H_0$ si:*], [*Valor $p$ < $alpha$*],

  [Bilateral (media, $sigma$ conocida)], [$|z_"obs"| > z_(alpha\/2)$], [Sí],
  [Bilateral (media, $sigma$ desconocida)], [$|t_"obs"| > t_(alpha\/2)$], [Sí],
  [Bilateral (proporción)], [$|z_"obs"| > z_(alpha\/2)$], [Sí],

  [Unilateral derecho (media)], [$t_"obs" > t_(alpha)$], [Sí],
  [Unilateral izquierdo (media)], [$t_"obs" < -t_(alpha)$], [Sí],
  [Unilateral derecho (proporción)], [$z_"obs" > z_(alpha)$], [Sí],
  [Unilateral izquierdo (proporción)], [$z_"obs" < -z_(alpha)$], [Sí],
)]

#v(1em)

#tip[
Regla práctica: si $|"estadistico"_"obs"| >$ valor crítico, rechazamos $H_0$. El valor crítico cambia según el nivel de confianza y si es bilateral o unilateral.
]

#error[
No confundas nivel de confianza con nivel de significancia:
- Nivel de confianza = $1 - alpha$ (para IC)
- Nivel de significancia = $alpha$ (para tests)
- IC del 95% corresponde a test con $alpha=0.05$
]

#importante[
*Cómo elegir entre bilateral y unilateral:*
- *Bilateral:* Querés detectar cambios en ambas direcciones ($!=$)
- *Unilateral:* Solo importa una dirección ($>$ o $<$)
]
