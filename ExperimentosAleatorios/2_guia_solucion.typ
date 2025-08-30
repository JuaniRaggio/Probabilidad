= Guia 2 - Experimentos Aleatorios

== Ejercicio 1
Se arrojan dos dados no cargados.

  a. Describa un espacio muestral o conjunto de todos los resultados posibles.

    $ SS = "Combinacion de todos los posibles pares" -> \#SS = 6^2 = 36 $

  b. Calcule la probabilidad de que la suma de los dos dados sea 7.

    $ "SI" = {"La suma de los dados es SIete"} $

    Las maneras en las que la suma de los dos dados es 7, seria:
    - $6 + 1$
    - $1 + 6$
    - $5 + 2$
    - $2 + 5$
    - $4 + 3$
    - $3 + 4$

    $ \#"SI" = 6 $

    Como son *equiprobables*, Laplace es aplicable, entonces...

    $ P("SI") = 6/36 = 1/6 $

  c. Calcule la probabilidad de que la suma sea 4 o 9.

    $ "C" = {"La suma de los dados es Cuatro"} $
    $ "N" = {"La suma de los dados es Nueve"} $

    Las maneras en las que la suma de los dos dados es 4:
    - $3 + 1$
    - $1 + 3$
    - $2 + 2$

    $ \#"C" = 3 $

    Como son *equiprobables*, Laplace es aplicable, entonces...

    $ P("C") = 3/36 = 1/12 $

    Las maneras en las que la suma de los dos dados es 9:
    - $6 + 3$
    - $3 + 6$
    - $5 + 4$
    - $4 + 5$

    $ \#"N" = 4 $

    Como son *equiprobables*, Laplace es aplicable, entonces...

    $ P("N") = 4/36 = 1/9 $

    === Finalmente, tenemos que calcular:
    $ P("N" union "C") underbrace(=, "m.e.") P("N") + P("C") = 1/9 + 1/12 = 7/36 $

== Ejercicio 2

De una urna con bolillas rojas numeradas de 1 a 5 y tres negras numeradas de 6 a 8 se saca
una completamente al azar. Juzgue la validez de los siguientes argumentos.

  a) Las rojas tienen mayor probabilidad de salir que las negras. Como 1 es roja y 6 negra,
  es más probable que salga el 1 que el 6.

  _Falso, como se extraen completamente al azar, la probabilidad de que salga una bolita u otra, es la misma. Por lo que la probabilidad de que salga la 1R o la 6N es la misma_

  b) Sólo hay dos resultados posibles: rojo o negro. Luego la probabilidad de cada uno es
  1/2.

  _Falso, los resultados posibles son 8 y sus probabilidades son iguales y como la suma tiene que dar 1, las probabilidades de todas las bolitas son $1/8$_

  c) Cualquier bolilla tiene la misma probabilidad de salir: 1/8.

  _Verdadero_
  
  d) El experimento ya se realizó una vez y salió el 4. Si se vuelve a realizar sería mucha ca-
  sualidad que vuelva a salir el 4. Luego en dos repeticiones consecutivas del experimento
  si la primera vez salió 4, la segunda es menos probable que salga el 4 que, por ejemplo,
  el 8.

  _Falso, pues los experimentos son independientes entre si._

== Ejercicio 3
Tres componentes se conectan para formar un sistema. El componente 1 se conecta en serie
con un paralelo de los componentes 2 y 3. Como éstos dos últimos se conectan en paralelo,
este subsistema funcionará si, por lo menos, uno de los dos componentes funciona. Para que
el sistema funcione deberán funcionar el componente 1 y al menos uno de los componentes
del paralelo.
Supongamos un experimento aleatorio que consiste en registrar el estado de cada componente
como Si si funciona el componente i y Fi si falla el componente i.
Listar los resultados que corresponden al suceso:

a. A: funcionan exactamente dos de los tres componentes.

  $ A = {"SSF", "SFS", "FSS"} => \#A = 3 $

b. B: al menos dos de los componentes funcionan.

  $ B = A union {"SSS"} $

c. C: el sistema funciona.

  $ C = {"SSF", "SFS", "SSS"} $

==== Lista solicitada:

- $ overline(C) = {"FFF", "FSS", "FSF", "FFS", "SFF"} $
Tiene sentido pues $ \#C + \#overline(C) = 8 = 2^3 $

- $ A union C = {"SSF", "SFS", "SSS", "FFS"} $

- $ A inter C = {"SSF", "SFS"} $

- $ B union C = B $
_Pues todos los elementos de C estan en B, para que el sistema funcione, al menos dos de los componentes tienen que funcionar_

- $ B inter C = C $
_Pues que el sistema funcione, es un subconjunto de los elementos de que al menos dos de los componentes funcionen. Queda afuera el caso en el que no funciona el primer elemento_

== Ejercicio 4

En una producción de 100 artículos hay 10 defectuosos y el resto no tiene defectos.

a. Para cada uno de los siguientes experimentos describa un espacio muestral y asigne la
probabilidad a cada suceso elemental.

  1. Se extrae un artículo al azar y se registra su calidad.

    $ SS = {overline(D), D} $

    $ P(overline(D)) = 90/100 $

    $ P(D) = 10/100 $

  2. Se extraen simultáneamente dos artículos y se registra su calidad.

    $ SS = {0overline(D), 1overline(D), 2overline(D)} $

    $ P(0overline(D)) = binom(90, 2)/binom(100, 2) $

    $ P(1overline(D)) = (binom(90, 1) binom(10, 1))/binom(100, 2) $

    $ P(2overline(D)) = (binom(90, 0) binom(10, 2))/binom(100, 2) $

  3. Se extraen *sucesivamente* sin reposición 2 artículos y *se registra su calidad.*

    $ SS = {0overline(D), 1overline(D), 2overline(D)} $

    $ P(0overline(D)) = (90 times 89)/(100 times 99) $

    $ P(1overline(D)) = (90 times 10)/(100 times 99) = P(D overline(D)) = P(overline(D) D) $

    $ P(2overline(D)) = (10 times 9)/(100 times 99) $

  4. Se extraen *sucesivamente* con reposición 2 artículos y *se registra su calidad.*

    $ SS = {0overline(D), D overline(D), overline(D) D, 2overline(D)} $

    $ P(0overline(D)) = (90^2)/(100^2) $

    $ P(D overline(D)) = (90 times 10)/(100^2) $

    $ P(overline(D) D) = (10 times 90)/(100^2) $

    $ P(2overline(D)) = (10^2)/(100^2) $

  5. Se extraen *sucesivamente* con reposición 2 artículos y *se cuenta la cantidad de defectuosos.*

    $ SS = {0overline(D), 1overline(D), 2overline(D)} $

    $ P(0overline(D)) = (90^2)/(100^2) $

    $ P(1overline(D)) = (90 times 10)/(100^2) $

    $ P(2overline(D)) = (10^2)/(100^2) $
    
  6. Se extraen *sucesivamente* sin reposición 2 artículos y *se cuenta la cantidad de defectuosos.*

    $ SS = {0overline(D), 1overline(D), 2overline(D)} $

    $ P(0overline(D)) = (90 times 89)/(100 times 99) $

    $ P(1overline(D)) = (90 times 10)/(100 times 99) $

    $ P(2overline(D)) = (10 times 9)/(100 times 99) $

b. Compare los resultados obtenidos en: 2) con 3) y 3) con 4) y saque conclusiones.

c. Calcule la probabilidad de que el segundo artículo sea bueno en los casos 3). y 4). Compare los resultados.

d. Compare los resultados obtenidos en: 2) con 3) y 3) con 4) y saque conclusiones si el tamaño de la población es 1000.

e. Generalice la probabilidad de obtener kdefectuosos en una muestra aleatoria de tamaño n en los casos 5) y 6) si hay b artículos buenos y d defectuosos.


== Ejercicio 6

Obtener una expresión de cálculo para $ P(A union B union C) $ en términos de $ P(A), P(B), P(C), P(A inter B), P(B inter C), P(A inter C) y P(A inter B inter C) $

_Notemos_ $ B union C = D => P(A union B union C) = P(A union D) $

$ P(A union D) = P(A) + P(D) - P(A inter D) = P(A) + P(B union C) - P(A inter (B union C)) $

Desglozando...

$ P(B union C) = P(B) + P(C) - P(B inter C) $

$ P(A inter (B union C)) = P((A inter B) union (A inter C)) = P(A inter B) + P(A inter C) - P(A inter B inter C) $

Finalmente...

$ P(A union B union C) = P(A) + P(B) + P(C) - P(B inter C) - P(A inter B) - P(A inter C) + P(A inter B inter C) $


== Ejercicio 8
Dos sucesos A y B tienen igual probabilidad de ocurrencia, $P(A) = P(B) = 0.4$. Calcular $P(A|B)$ si la probabilidad de ocurrencia de ambos es $P(A inter B) = 0.25$

$ P(A|B) = P(A inter B)/P(B) = 0.25/0.4 = 0.625 $


== Ejercicio 10

Considere dos sucesos $A$ y $B$ para los cuáles
$P(A) = 1/2$,
$P(B) = 1/3$,
$P(A inter B) = 1/4$

#underline[Calcular:]

a. $P (A|B)$

  $ P(A|B) = P(A inter B)/P(B) = (1/4)/(1/3) = 3/4 $

b. $P(B|A)$ 

  $ P(B|A) = P(A inter B)/P(A) = (1/4)/(1/2) = 2/4 $

c. $P(A union B)$

  $ P(A union B) = P(A) + P(B) - P(A inter B) = 1/2 + 1/3 - 1/4 = 0.583 $

d. $P(overline(A)|overline(B))$

  $ P(overline(A)|overline(B)) = P(overline(A) inter overline(B))/P(overline(B)) = P(overline(A union B))/(1 - P(B)) = (1 - P(A union B))/(1 - P(B)) = 0.625 $

e. $P(overline(B)|overline(A))$

  $ P(overline(B)|overline(A)) = P(overline(B) inter overline(A))/P(overline(A)) = P(overline(B union A))/(1 - P(A)) = (1 - P(B union A))/(1 - P(A)) = 0.833 $

\
\
\

== Ejercicio 11
Si $P(A|B) = 0.6$, $P(overline(A) union B) = P(A union overline(B)) = 0.8$

a. Son independientes los sucesos A y B?
  $ P(A|B) = P(A) <=> A "ind" B $

b. Calcular $P(A union B)$ y $P(B|A)$

== Ejercicio 12



