= Guia de ejercicios - VAD

= Ejercicio 1
Considere el experimento de lanzar un par de dados no cargados. Sean las variables aleatorias 

- $X$: { Suma de los puntos obtenidos }
- $Y$: { Maximo puntaje de los dos obtenidos }
- $N_i$: { El valor que toma el dado i }

$R_(N_i) = "{ 1, 2, 3, 4, 5, 6 }"$
$R_i = "{ 1, 2 }"$

Obtener las tablas de la funcion de probabilidad y la funcion de distribucion de estas variables aleatorias discretas. Calcular las siguientes probabilidades:

- $R_X = "{ 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 }"$

#table(columns: 2)[$x$][$P(X = x)$][2][$P(N_1 = 1 inter N_2 = 1)$][3][$P((N_1 = 1 inter N_2 = 2) union (N_1 = 2 inter N_2 = 1))$][4][$P((N_1 = 2 inter N_2 = 2) union (N_1 = 3 inter N_2 = 1) union (N_1 = 1 inter N_2 = 3))$][5][$2 times P((N_1 = 2 inter N_2 = 3) union (N_1 = 1 inter N_2 = 4))$][6][$2 times P((N_1 = 4 inter N_2 = 2) union (N_1 = 5 inter N_2 = 1)) + P(N_1 = 3 inter N_2 = 3)$][7][$2 times P((N_1 = 4 inter N_2 = 3) union (N_1 = 5 inter N_2 = 2) union (N_1 = 6 inter N_2 = 1))$][8][$2 times P((N_1 = 3 inter N_2 = 5) union (N_1 = 2 inter N_2 = 6)) + P(N_1 = 4 inter N_2 = 4)$][9][_Ver funcion abajo_][10][...][11][...][12][...]

_Notemos:_ $P(X = x) = (x - 1)/6^2$

\

- $R_Y = "{ 6, 5, 4, 3, 2, 1 }"$

#table(columns: 2)[y][P(Y = y)][1][$P(N_1 = 1 inter N_2 = 1)$][2][$P(N_1 = 2 inter N_2 = 2) + 2 times P(N_1 = 2 inter N_2 = 1)$][3][$P(N_1 = 3 inter N_2 = 3) + 2 times P(N_1 = 3 inter N_2 <= 2)$][4][$2 times P(N_1 = 4 inter N_2 <= 4)$][5][$2 times P(N_1 = 5 inter N_2 <= 5)$][6][$2 times P(N_1 = 6 inter N_2 <= 6)$]

_Notemos:_ $P(Y = y) = $


a. Probabilidades pedidas de X:

$ P(X < 7) = P(X = 1) + P(X = 2) + P(X = 3) + P(X = 4) + P(X = 5) + P(X = 6) $
$ P(X < 7) = 0 + 1/6^2 + underbrace(1/6^2 + 1/6^2, P(X = 3)) + underbrace(3 times 1/6^2, P(X = 4)) + underbrace(4 times 1/6^2, P(X = 5)) + underbrace(5 times 1/6^2, P(X = 6)) =  $

\

= Ejercicio 2
Suponga que la demanda diaria de un articulo es una variable aleatoria $D$ con recorrido $R_D = {1, 2, 3, 4}$ y funcion de probabilidad $p_D (r) = C 2^r /(r!)$

a. Calcule la constante C.

Como me dan la funcion de densidad y la suma en todo el recorrido tiene que dar 1, es facil ver:

$ 1 = C (2 + 2^2/2 + 2^3/6 + 2^4/24) => C = 1/(2 + 2^2/2 + 2^3/6 + 2^4/24) $

b. La representacion grafica de la funcion es sencilla pues discreta

\

= Ejercicio 3 - Determinar:

a. Valor esperado y varianza de las VADs del ejercicio 1

$ E[X] = sum_(x in R_X) P(X = x).x =\ P(X = 2).2 + P(X = 3).3 + P(X = 4).4 + P(X = 5).5 + P(X = 6).6\ + P(X = 7).7 + P(X = 8).8 + P(X = 9).9 + P(X = 10).10 + P(X = 11).11 + P(X = 12).12 $

$ E[X] = 143/9 = 15.889 $

\

$ E[Y] = sum_(y in R_Y) P(Y = y).y = P(Y = 1) + 2 . P(Y = 2) + 3 . P(Y = 3) + 4.P(Y = 4) + 5 . P(Y = 5) + 6 . P(Y = 6) $

$ E[Y] = 1/6^2 times 1 + (1 + 2)/6^2 times 2 + (1 + 2 times 2 )/6^2 times 3 + (1 + 2 times 3)/6^2 times 4 + (1 + 2 times 4)/6^2 times 5 + (1 + 2 times 5)/6^2 times 6 $

b. Valor esperado E[D] de la variable aleatoria D de la demanda del ejercicio anterior


\


= Ejercicio 4

Se seleccion al azar una muestra sin reemplazo de 3 articulos de un total de 10 de los cuales 2 son defectuosos. Si X es la variable aleatoria: numero de articulos defectuosos en la muestra, obtenga la distribucion de probabilidades de X y calcule sus parametros caracterisiticos. Como cambia el problema si el muestreo es con sustitucion?

- Se seleccionan 3 al azar
- Total elems: 10
- Defect elems: 2
- X = { Numero de articulos *defectuosos* }

=== Como cambia el problema si el muestreo es con sustitucion?
Lo que cambia seria que en vez de tener ditribucion *hipergeometrica*, tendria distribucion *geometrica*.

- Por un lado la *Hiper* es sin reposicion, es decir que cambia la probabilidad en cada extraccion

- Por otro lado la *Geo* es con reposicion, es decir que para todas las extracciones, la probabilidad es la misma

\

= Ejercicio 5

- El 0.84 pasa la prueba sin modificaciones
- Las que no, se reelaboran y de estas, el 0.75 pasa la prueba
- Las que no, se vuelven a reelaborar y de estas, el 0.9 pasan la prueba
- Las que no, se desarman

$ X = {"#veces que se reprocesa una controladora seleccionada al azar"} $

$ E_i = {"Exito despues de la falla i"} $

a. $R_X = {0, 1, 2}$

$ P(X = x) = cases(
  0.84                   &"si" x = 0,
  0.16 times 0.75 = 0.12 &"si" x = 1,
  0.16 times 0.25 = 0.04 &"si" x = 2,
) $

Nota1: _Entiendo que a pesar de que la prueba 2 se realiza solo si se fallo en la primera, son independientes las pruebas entre si_

Nota2: _En el ultimo caso no se multiplica por 0.9 porque en realidad todos los que llegaron a esa instancia, van a haber sido reelaborados 2 veces y no mas (funcionen o no)_

\

b. Calcular el valor espearado de $X$, como se interpreta este numero?

$ E[X] = P(X = 0) times 0 + P(X = 1) times 1 + P(X = 2) times 2 = 0.2 $

Se puede interpretar como que se espera que las controladoras se van a reprocesar 0 veces

\

c. Calcular la varianza y el desvio estandar de $X$

$ "Var"(X) = E[X^2] - E^2[X] = E[X^2] - 0.2^2 = 0.28 - 0.2^2 = 0.24 $

$ sigma(X) = sqrt("Var"(X)) = sqrt(0.24) approx 0.4898979 $

\

d. Cual es el porcentaje de controladoras que se desarman?

$ D = {"Una controladora tomada al azar se desarma"} $

$ P(D) = P(X != 0 inter X != 1 inter X != 2) = 0.84 times 0.16^2 times 0.75 times 0.25 = 0.004032 $

\

= Ejercicio 6

En una estacion de servicio, la distribucion de clientes que llegan cada 15 minutos tiene la siguiente distribucion de probabilidades

#align(center)[
#table(columns: 4)[*Nro. de clientes*][0][1][2][*Probabilidad*][0.2][0.5][0.3]]

$ "NC" = {"Cantidad de clientes que llegan en 15 mins"} $

$ f_("NC")(x) = cases(
  0.2 "si" x = 0,
  0.5 "si" x = 1,
  0.3 "si" x = 2
) $

$ "TC" = {"Un cliente paga con tarjeta de credito"} $

$ P("TC") = 0.25 $

Cada cliente tiene una forma de pago independiente de la de los demas

$ Y = {"La cantidad de clientes que en 15 minutos pagan con tarjeta de credito"} $

a. Obtener la distribucion de probabilidades de la variable aleatoria $Y$

_Hay que usar probabilidad total_

$ Y tilde "Binomial"("trials" = "NC", p = P("TC")) $

$ f_Y(y) = P("NC" = 0).underbrace("binompdf"(0, 0.25), "Y=y sabiendo que NC = 0") + P("NC" = 1).underbrace("binompdf"(1, 0.25), "Y = y sabiendo NC = 1") + P("NC" = 2).underbrace("binompdf"(2, 0.25), "Y = y sabiendo NC = 2") $

_Ojo porque la distribucion de probabilidades es "la tablita", es decir que probabilidad tiene cada valor del recorrido_

#align(center)[#table(columns: 2)[y][P(Y = y)][0][$0.2 + 0.5 times 0.75 + 0.3 times 0.5625 = 0.74375 $][1][$0.2 times 0 + 0.5 times 0.25 + 0.3 times 0.375 = 0.2375$][2][$0.2 times 0 + 0.5 times 0 + 0.3 times 0.0625 = 0.01875$]]

b. Calcule el valor esperado y la dispersion de la variable aleatoria $Y$

$ E[Y] = P(Y = 0).0 + P(Y = 1).1 + P(Y = 2).2 = 0.2375 + 0.0375 = 0.275 $

$ "Var"(Y) = E[X^2] - E^2[X] = P(Y = 1).1^2 + P(Y = 2).2^2 - 0.275^2 = 0.236875 $

= Ejercicio 7

Una organizacion de consumidores que valua automoviles nuevos reporta regularmente el numero de defectos importantes en cada automovil examinado. Sea $X$ el numero de defectos importantes en un automovil seleccionado al azar de un cierto tipo y $F_X(x)$ la funcion de distribucion de probabilidad correspondiente

$ F_X(x) = cases(
  0 &"si" x < 0,
  0.06 &"si" 0 <= x < 1,
  0.19 &"si" 1 <= x < 2,
  0.39 &"si" 2 <= x < 3,
  0.67 &"si" 3 <= x < 4,
  0.92 &"si" 4 <= x < 5,
  0.97 &"si" 5 <= x < 6,
  1 &"si" x >= 6
) $

1. Calcular la siguientes probabilidades directamente de la funcion dada:

$p_X(2) = P(X = 2), P(X > 3), P(2 <= X <= 5), y P(2 < X < 5)$

$ p_X(2) = 0.39 - 0.19 = 0.2 $
$ P(X > 3) = 1 - 0.67 = 0.33 $
$ P(2 <= X <= 5) = 0.97 - 0.19 = 0.78 $
$ P(2 < X < 5) = 0.92 - 0.39 = 0.53 $

2. Cual es el numero esperado de defectos importantes que se espera al examinar un automovil, seleccionado al azar, del tipo considerado en este problema?

$ E[X] = 0.06 times 0 + 0.13 times 1 + 0.2 times 2 + 0.28 times 3 + 0.25 times 4 + 0.05 times 5 + 6 times 0.03 = 2.8 $

\

= Ejercicio 8

La probabilidad de falla de un cierto tipo de componentes electronicos es de 0.10, una compañia produce con ellos dos tipos de circuitos denominados *I* y *II* respectivamente. El circuito de tipo *I* consiste en un paralelo de dos componentes. El circuito tipo *II* esta armado con una serie de dos componentes. De la produccion total se elige un circuito de cada tipo. Sea $X$ la variable aleatoria que indica el numero de circuitos que funciona cuando se prueban ambos.

1. Definir la funcion de probabilidad $p_X$, hallar la funcion de probabilidad y representar ambas funciones en forma grafica

$ X = {"Cantidad de circuitos que funcionan"} $

$ F_i = {"El circuito tipo i, falla"} $

$ C_i = {"El componente i, falla"}, i in {1, 2} $

$ P(F_"I") = P(C_1 inter C_2) underbrace(=, "ind") P(C_1) . P(C_2) = 0.01 $

$ P(overline(F_"I")) = P(overline(C_1) union overline(C_2)) = 1 - P(F_"I") = 0.99 $

$ P(F_"II") = P(C_1 union (overline(C_1) inter C_2)) = P(C_1) + P(overline(C_1)).P(C_2) = 0.1 + 0.09 = 0.19 $

$ p_X(x) = cases(
  P(F_("I") inter F_("II")) &"si" x = 0,
  P((F_("I") inter overline(F_("II"))) union (overline(F_"I") inter F_"II")) &"si" x = 1,
  P(overline(F_("I")) inter overline(F_("II"))) &"si" x = 2,
) $

2. Hallar el valor esperado de $X$

$ E[X] = 1.P((F_("I") inter overline(F_("II"))) union (overline(F_"I") inter F_"II")) + 2.P(overline(F_("I")) inter overline(F_("II"))) =\ = 0.01 times (1 - 0.19) + 0.99 times 0.19 + 2 times 0.99 times (1 - 0.19) = 1.8 $

\

= Ejercicio 10

Un contratista debe elegir entre dos obras. La primera promete una ganancia de 
$240k$ con una probabilidad de 0.75 o una perdida de $60k$ (por inconvenientes 
varios) con una probabilidad de 0.25. La segunda obra promete una ganancia de 
$360k$ con probabilidad 0.5 o una perdida de $90k$ con probabilidad 0.5

+ Cual deberia elegir el contratista si quiere maximizar la ganancia esperada?

La ganancia esperada deberia ser el valor esperado de la variable aleatoria
que describe la ganancia, llamemosla $X$

*Para la obra 1*:
$ f_X (x) = cases(
  0.75 "if" x = 240 000,
  0.25 "if" x = -60 000
) $

$ E[X] = P(X = 240 000) . 240 000 - P(X = 60 000) . 60 000 = 165 000 $

*Para la obra 2*:
$ f_Y (y) = cases(
  0.5 "if" x = 360 000,
  0.5 "if" x = -90 000
) $

$ E[Y] = P(Y = 360 000) . 360 000 - P(Y = -90 000) . 90 000 = 135 000 $

#align(center)[#table()[*Deberia elegir la obra 1*]]

+ Cual seria la obra que elegiria si su negocio anduviera mal y quebrara a menos
que lograra una ganancia de $300k$ en su proxima obra

*La obra 2*

\

= Ejercicio 11

Un vendedor de diarios compra cada periodico a 40 centavos y lo vende a 1 peso y no puede devolver los diarios que no vendio. La demanda diaria es independiente de la del dia anterior y tiene la siguiente distribucion de probabilidades:

#table(columns: 9)[*cantidad demandada*][63][64][65][66][67][68][69][70][*probabilidad*][0.01][0.04][0.06][0.08][0.15][0.28][0.22][0.16]

Cuantos diarios debe adquirir diariamente si desea maximizar la ganancia esperada? (la insatisfaccion de la demanda no esta penalizada)

\

= Ejercicio 12

De un mazo de naipes ordinarios (52 naipes) bien barajado se extraen cinco
cartas, al azar (sin sustitucion), para un mano de poker

+ Obtenga la distribucion de probabilidades del numero de diamantes D en la mano

$ X = {"Se extrae un diamante de la carta de naipes bien barajada"} $
$ D = {"Cantidad de diamantes en una mano de cinco cartas"} $

Hay 13 diamantes en total, entonces:
$ P(X) = 13/52 $

== Muy importante
Notemos que las probabilidades en esta situacion cambian en cada extraccion,
ya sea que sacamos un diamante o no. Pues se reducen los casos totales 
(cantidad de cartas) y en caso de extraer un diamante, el total de diamantes

- Por lo tanto:

$ D tilde "Hipergeometrica"("pop. size" = 52, "successes in pop." = 13, "extraction size" = 5) $

1. Determine el valor esperado y el desvio estandar de D

_Para el valor esperado, podemos usar la formula_
$ E[D] = 5 . P(D = 5) + 4 . P(D = 4) + 3 . P(D = 3) + 2 . P(D = 2) + 1 . P(D = 1) $
$ E[D] = 5 times 0.000495 + 4 times 0.010729 + 3 times 0.081542 + 2 times 0.274279 + 0.411419 $
#align(center)[#table()[$ E[D] = 1.2499 $]]

_Para el desvio lo mismo_

$ sigma = sqrt(V[X]) $

$ V[X] = E[X^2] - E^2[X] $
$ V[X] = 2.4264 - 1.5624 = 0.8639 $

#align(center)[#table()[$sigma = sqrt(0.8639) = 0.9295$]]

2. Calcule la probabilidad de sacar por lo menos un trebol

$ P(T >= 1) underbrace(=, "#Treb. = #Diam.") P(D >= 1) = 1 - P(D < 1) $
$ P(T >= 1) = 1 - P(D = 0) = 1 - 0.2215 = 0.7785 $

#align(center)[#table()[$P(T >= 1) = 0.7785$]]

3. Calcule la probabilidad de sacar por lo menos dos ases

$ "EA" = {"Se extrae un As del mazo de 52 cartas"} $
$ A = {"Cantidad de ases en una mano de cinco cartas"} $

$ P("EA") = 4/52 $

$ A tilde "Hipergeometrica"("pop. size" = 52, "successes in pop." = 4, "extraction size" = 5) $

$ P(A >= 2) = 1 - P(A <= 1) = 1 - c d f(A = 1) = 1 - 0.9583 = 0.0417 $

#align(center)[#table()[$P(A >= 2) = 0.0417$]]

\

= Ejercicio 13

En una semana de trabajo se realizaron 50 facturas en un comercio. En 5 de el
las se cometio un error


\



\

= Ejercicio 21

Se determino, a partir de numerosas experiencias previas, que de cada 5 fusibles que produce una maquina 1 es defectuoso. Calcular la probabilidad de que en una muestra aleatoria (*de un lote muy grande*) de 4 fusibles se obtengan:

#align(center)[*Como la muestra es muy grande, podemos usar binomial en vez de hipergeometrica*]

$ D = {"Cantidad de fusibles defectuosos tomados de una muestra de 4"} $

$ D tilde "Binomial"("trials" = 4, p = 1/5) $

1. Uno defectuoso

$ P(D = 1) = "binompdf"(4, 1/5) = 0.4096 $

2. Como max dos defectuosos

$ P(D <= 2) = "binomcdf"(4, 1/5) = 0.9728 $

3. Ninguno defectuoso

$ P(D = 0) = "binompdf"(4, 1/5) = 0.4096 $

4. Los cuatro defectuosos

$ P(D = 4) = "binompdf"(4, 1/5) = 0.0016 $

\

= Ejercicio 24

La maquina A produce diariamente el doble de articulos que la maquina B; el 4% de los articulos producidos por la maquina A tiende a ser defectuosos, mientras que para la maquina B el porcentaje de defectuosos es del 2%. Se combina la produccion diaria de ambas maquinas y se toma una muestra aleatoria de 10 articulos

1. Cual es la probabilidad de que la muestra contenga exactamente 2 defectuosos?

$ D_i = {"Cantidad de articulos defectuosos en una muestra de i articulos"} $

$ D = {"Articulo defectuoso"} $

$ A = {"articulo de la maquina A dentro de la muestra"} $

$ B = {"articulo de la maquina B dentro de la muestra"} $

$ P(D|A) = 0.04 $

$ P(D|B) = 0.02 $

$ P(D) = 0.04 P(A) + 0.02 P(B) = 0.03333 $

$ P(D_10 = 2) = "Binompdf"("trials" = 10, p = 0.0333333) = 0.03812 $

2. Determinar el valor esperado y el desvio estandar del numero de articulos defectuosos en esa muestra aleatoria de 10 articulos

$ E[X] = P(D_10 = 1) + P(D_10 = 2) 2 + P(D_10 = 3) 3 + P(D_10 = 4) 4 + P(D_10 = 5) 5 + P(D_10 = 6) 6 + P(D_10 = 7) 7 + P(D_10 = 8) 8 + P(D_10 = 9) 9 + P(D_10 = 10) 10 = p . n = 0.3333 $

$ sigma(X) = sqrt(V[X]) = sqrt(p n (1 - p)) = sqrt(0.322222) = 0.567646 $

\

= Ejercicio 28

Sea p la probabilidad de que cualquier simbolo particular de un codigo se transmita erroneamente a traves de un sistema de comunicaciones. Suponga que en diferentes simbolos ocurren errores independientemente uno de otro. Suponga tambien que con probabilidad $p_2$ un simbolo erroneo se corrige al recibirse. Sea $X_n$ el numero de simbolos correctos recibidos en un bloque de mensaje formado por $n$ simbolos (una vez que el proceso de correccion haya terminado)

1. Demostrar que $X_n$ es una variable aleatoria discreta con distribucion binomial

2. Determinar el valor esperado y la verianza de $X_n$ si $n = 10$, $p = 0.02$, y $p_2 = 0.95$

$ D = {"Hubo defecto en la salida del envio"} $

$ Z = {"Se corrige un defecto"} $

$ C = {"Simbolo recibido correctamente"} $

$ P(C) = P(C|D).P(D) + P(C|overline(D)).P(overline(D)) $

$ P(C) = P(D inter Z). P(D) + P(overline(D))^2 = 0.96078 $

$ E[X_n] = n 0.96078 = 9.6078 $

$ V[X] = n p (1 - p) = 0.37681 $












