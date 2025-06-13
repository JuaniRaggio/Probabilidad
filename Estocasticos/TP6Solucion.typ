#import "@preview/gviz:0.1.0": *
#show raw.where(lang: "dot-render"): it => render-image(it.text)
// Graph example:
// ```dot-render
// digraph mygraph {
//   node [shape=box];
//   A -> B;
//   B -> C;
//   B -> D;
//   C -> E;
//   D -> E;
//   E -> F;
//   A -> F [label="one"];
//   A -> F [label="two"];
//   A -> F [label="three"];
//   A -> F [label="four"];
//   A -> F [label="five"];
// }
// ```

= Ejercicio 1
<random_walk>

*Caminada aleatoria simetrica.*

Supongamos el siguiente juego: se lanza una moneda en forma reiterada y el jugador gana 1 peso si sale cara y pierde 1 peso si sale ceca.

1. Se define el proceso estocastico $X_n : n in NN$ donde $X_n$ es el dinero que tiene el jugador al cabo de $n$ jugadas (se supone $X_0 = 0$). Definir el recorrido de $X_n$ y el espacio de estados del proceso (valido para todo valor de n)

Sabemos que cada paso notemoslos $i$, si la moneda no esta cargada y asumiendo que son independientes entre si:

$ P(Z_i = "Gana") = 0.5 => "son" i.i.d. $

$ Z_i = \{"Gana" -> 1, "Pierde" -> -1\} $

En palabras esto seria que todas las tiradas de moneda tienen una probabilidad de ganar de $0.5$, por lo que el valor esperado de $n$ tiradas, viene dado por:

Es un proceso de Markov pues las probabilidades son i.i.d. Por lo tanto la plata que se tiene en la jugada $n$ depende _solamente_ de lo que se tiene en la tirada anterior $n - 1$

Entonces los posibles valores de $X_n$ son:

#align(center)[#table[$ X_n = (+1) . k + (-1) . (n - k) = 2k - n, k in NN_0 $]]

El recorrido:

#align(center)[#table[$ R_(X_n) = \{ -n, -n + 2, -n + 4, ..., n \} $]]

_Duda que tuve: porque se le suman k pares? no podria terminar en n + 1?_

Notemos con un ejemplo rapido:

Si parto en 0 y tengo que si o si hacer 3 jugadas, _no tengo forma de volver a_ 0 entonces tiene sentido que la paridad sea la misma que la cantidad de jugadas (si se le suma 2k a un numero mantiene su paridad)

Por lo tanto si partimos en 0 y queremos saber la probabilidad de volver a 0, y se hacen 3 jugadas va a ser 0 esa probabilidad

2. Obtener la distribucion de probabilidades de $X_n$

Como mencionamos anteriormente en caso de querer volver a un valor que no mantiene la paridad de $n$ (cantidad de jugadas), la probabilidad de llegar a ese punto va a ser 0

Ademas de esto solo nos interesa el paso anterior ya que como son eventos i.i.d., no nos interesa toda la historia


$ P(X_n = x_n | X_(n - 1) = x_(n - 1)) = cases(
  1/2 & "si" x_n = x_(n - 1) plus.minus 1,
  0 & "si no" 
) $


Luego la distribucion de $X_n$ la obtenemos usando que $X_n = 2k - n$

Como k es la cantidad de exitos, podemos deducir la distribucion ya que su probabilidad es $0.5$

$ K tilde.op "Binomial"("Trials" = n, p = 0.5) $

$ P(X_n = x_n) = P(2K - n = x_n) = P(K = (x_n + n)/2) = "BinomialPDF"(x = K, n = n, 0.5) $

$ k in \{ -n, 2 - n, 4 - n, ..., n \} $
  
3. Expresar la variable $X_n$ como suma de variables iid

Esto es sencillo, de hecho lo habiamos escrito asi anteriormente:

$ X_n = sum _(k = 1)^n Z_k $

4. Calcular $E[X_n], V[X_n]$

$ E[X_n] = n E[Z_i] = n(0.5(-1) + 0.5(1)) = n 0 = 0 $
$ V[Z_i] = E[Z_i ^2] - E^2[Z_i] => E[X_n ^2] = n(0.5(-1)^2 + 0.5(1)^2) = n 1 = n $


== Ejercicio 2
*Caminata aleatoria general*

Extiende al ejercicio anterior, pero esta vez asumiendo que la moneda puede estar _cargada_, osea que la probabilidad de que salga cara es $p in (0, 1)$

1. Obtener la distribucion de probabilidades de $X_n$

$ Z_i in {-1, 1} $

Pero esta vez:

$ P(Z_i = 1) = p, P(Z_i = -1) = 1 - p $

$ X_n = sum _(k = 0)^n Z_i = "Igual al anterior (la probabilidad no afecta el recorrido)" $

Lo que si va a cambiar es la distribucion, como las probabilidades cambian, ahora la Binomial que representa a $x$ va a ser otra

Siendo $k$ la cantidad de victorias:

$ K tilde.op "Binomial"(n, p) $

Entonces la distribucion de $X_n$ nos quedaria:

$ X_n = 2k - n => K = (X_n + n) /2 $

$ P(X_n = x) = "BinomPDF"(x = k, n, p) $

2. Calcular la esperanza y la varianza

Esto es sencillo, _igual que siempre_:

Tener en cuenta que es la suma de las esperanzas de cada uno de los experimentos

$ E[Z_i] = (+1) p + (-1) (1 - p) = 2p - 1 => E[X_n] = n E[Z_i] = n(2p - 1) $

$ V[Z_i] = p + 1 - p + (2p - 1)^2 => V[X_n] = n V[Z_i] = n(4p^2 - 4p) = 4n p(p - 1) $


== Ejercicio 3

Suponga un proceso estocastico en tiempo discreto con espacio de eestados discreto definido de la siguiente manera:

$ X_(n + 1) = X_n + Z_n $

Para $n$ tomando los valores 0, 1, 2, ..., y con $X_0 = 0$. Las variables aleatorias $Z_n$ se suponen iid con recorrido: $\{-2, -1, 0, 1, 2\}$ con funcion de probabilidad $p_Z (z) = P(Z = z); p_Z (-2) = p_Z (2) = 0.1; p_Z (1) = p_Z (-1) = 0.25; p_Z (0) = 0.3$

1. Obtener la distribucion de probabilidades de $X_n$ para $n$ tomando los valores 1, 2 y 3.

Usando el dato:

- $n = 1$:

$ X_(0+1) = X_0 + Z_0 = Z_0 => X_1 = Z_0 $

- $n = 2$

$ X_2 = X_1 + Z_1 = Z_0 + Z_1 $
$  $

- $n = 3$

$ X_3 = X_2 + Z_2 = Z_0 + Z_1 + Z_2 $

Luego ver calculo de distribucion en programa que nos da literalmente todos los casos

```py

Z_vals = [-2, -1, 0, 1, 2]

# Probabilidades
Z_probs = [0.1, 0.25, 0.3, 0.25, 0.1]

def inicializar_Z():
    dist = {}
    for i in range(len(Z_vals)):
        dist[Z_vals[i]] = Z_probs[i]
    return dist

def convolve(dist1, dist2):
    result = {}
    for val1 in dist1:
        for val2 in dist2:
            suma = val1 + val2
            prob = dist1[val1] * dist2[val2]
            if suma in result:
                result[suma] += prob
            else:
                result[suma] = prob
    return result

def calcular_Xn(Z_dist, n):
    dist = Z_dist
    for _ in range(n-1):
        dist = convolve(dist, Z_dist)
    return dist

Z_dist = inicializar_Z()

n = int(input("Ingrese n: "))

Xn = calcular_Xn(Z_dist, n)

def mostrar(dist, nombre):
    print("Distribución de", nombre)
    for k in sorted(dist.keys()):
        print("X =", k, "-> P =", round(dist[k], 4))
    print("")

mostrar(Xn, f"X{n}")

```

Si queremos escribir como suma de las $Z_i$ hariamos:

$ X_i = sum _(k = 0)^(n - 1) Z_k $

2. Calcular $E[X_n], V[X_n]$

Como las $Z_i$ son i.i.d., la varianza de la suma va a ser la suma de las varianzas, es decir que todas las variables aleatorias van a tener la misma varianza y la misma esperanza

$ E[X_n] = E[sum _(k = 0)^(n - 1) Z_k] = sum_(k = 0)^(n - 1) underbrace([Z_k], 0) = 0 $

$ V[X_n] = V[sum _(k = 0)^(n - 1) Z_k] = sum _(k = 0)^(n - 1) V[Z_0] = sum _(k = 0)^(n - 1) V[Z_0] = n V[Z_0] = n E[Z_0 ^2] = n (4 (0.2) + 1 (0.5)) = 1.3n $


== Ejercicio 4 - Caminata aleatoria Gaussiana
Otra extension de los ejercicios anteriores es cuando la cantidad perdida o ganada en cada jugada es una variable aleatoria continua. En particular, supongamos que la cantidad ganada en la jugada k-esima es una VA $G_k tilde.op N(0,1)$. Mas aun, asuma que las $G_k$ son i.i.d.. Se define el proceso estocastico $X_n : n in NN$ donde $X_n$ es el dinero que tiene el jugador al cabo de $n$ jugadas (se supone $X_0 = 0$)

1. Recorrido de $X_n$ y el espacio de estados del proceso

- En este caso los pasos son variables aleatorias pero continuas, por lo tanto usamos las formulas cerradas, no necesitamos usar Convolucion

$ X_n tilde.op N(0, n) $

$ R_X_n = RR -> "Pues puede tomar cualquier valor" $


2. Obtener la distribucion de probabilidades de $X_n$

Esta mencionada anteriormente, _pero_ si queremos escribir la funcion acumulada, seria:

$ P(X_n <= n) = Phi (x/sqrt(n)) -> "Acordarse 'x menos la media dividido el desvio'" $

3. Calcular $E[X_n], V[X_n]$

$ E[X_n] = mu = 0 $

$ V[X_n] = n $


== Ejercicio 8 - Procesos de Poisson

Suponga que en cierto banco se atiende, en promedio durante una parte del dia, a cuatro clientes cada seis minutos segun un proceso de Poisson. Calcular la probabilidad de que:

1. Puedan atenderse a seis o mas clientes en seis minutos
2. Se empleen mas de tres minutos en atender a un cliente
3. El tiempo de atencio a un cliente este comprendido entre dos y cuatro minutos
4. El tiempo que insuma atender 10 clientes sea menor a 10 minutos

*Muy importante*: Recordar que en los _procesos de Poisson_, $lambda$ representa eventos por unidad de tiempo, por lo que en este caso:

$ 4 "Clientes cada" 6 "minutos" => 4/6 "Clientes por unidad de tiempo (mins)" $

Luego una vez tenemos $lambda$ por unidad de tiempo, podemos decir que $T tilde.op "Exponencial"(lambda)$, siendo $T$ la unidad de tiempo (minuto)

Definimos: $C: "Cantidad de clientes atendidos"$

#align(center)[#table()[$ P(C(t) <= 6) = "Poiscdf"(lambda times 6) => P(C(t) > 6) = 1 - "Poiscdf"(lambda times 6) = 0.21486 $]]

Retomamos $T$, nos piden la probabilidad de que se empleen mas de 3 minutos en atender a 1 cliente, quiere decir que la distancia en tiempo entre eventos sea mayor a 3 unidades de minutos:

#align(center)[#table()[$ P(T > 3) = 1 - P(T <= 3) = 1 - "ExpoCDF"(lambda) = 0.13532 $]]

Luego me piden el tiempo de atencion a un cliente este entre dos y cuatro minutos, en este caso volvemos a usar la misma distribucion $T$ pues es la que nos indica la distancia en tiempo entre dos eventos

$ P(2 < T < 4) = P(T < 4) - P(T < 2) = "ExpoCDF"(x=4, lambda) - "ExpoCDF"(x=2, lambda)$

$ P(2 < T < 4) = 0.9305258126197583 - 0.7364204344410559 = 0.1941053 $

$ #align(center)[#table()[P(2 < T < 4) = 0.1941]] $

Me piden que el tiempo que insuma atender 10 clientes sea menor a 10 minutos.

*Ojo* porque cuando piden muchos eventos en un tiempo determinado, tenemos que usar Poisson

*Esto esta mal*:
$ P(T = 1) = "ExpoPDF"(x = 1, lambda) = 0.3422 $

*Esto es lo que corresponde hacer:*

Como piden el tiempo que insuma atender 10 clientes sea _menor a 10 minutos_ hay que tener en cuenta el caso en el que atienden a MAS de 10 clientes:

$ P(T_(10) <= 10) = P(C(t) >= 10) = 1 - P(C(t) < 10) = 1 - P(C(t) <= 9) $
$ 1 - "PoisCDF"(lambda times 10) = 0.13737 $
#align(center)[#table()[ $P(T_(10) <= 10) = 0.13737 $]]


== Ejercicio 13

Tres supermercados $S_1, S_2, S_3$ compiten por los clientes. Una investigacion determina que al comenzar el mes de agosto los tres supermercados tienen igual cantidad de clientes. Al finalizar el mes se observa que:

1. $S_1$ conserva el $80%$ de sus clientes y gana el $10%$ y el $2%$ de los clientes de $S_2, S_3$
1. $S_2$ conserva el $70%$ de sus clientes y gana el $14%$ y el $8%$ de los clientes de $S_1, S_3$
1. $S_3$ conserva el $90%$ de sus clientes y gana el $6%$ y el $20%$ de los clientes de $S_1, S_2$

Sea $PP$ la matriz cuadrada de elementos $p_(i j)$, donde $p_(i j)$ es la probabilidad de que un cliente del supermercado $S_i$ se pase al supermercado $S_j$ al cabo de un mes.

1. Construir la matriz de transicion $PP$, con los datos del problema

*Esto es incorrecto*:
$ mat(
  0.8, 0.1, 0.02;
  0.14, 0.7, 0.08;
  0.06, 0.2, 0.9
) $

Lo que estoy haciendo aca es que la columna dice el origen, mientras que la fila es el destino pero es la revez:

$ mat(
  0.8, 0.14, 0.06;
  0.1, 0.7, 0.2;
  0.02, 0.08, 0.9
) $


2. Si $PP^(n)$ es la matriz cuyo elemento de la posicion $i, j$ indica la proporcion de clientes que se pasaron de $S_i$ a $S_j$ al cabo de $n$ meses, determine que porcentaje de clientes se pasaron de $S_2 -> S_3$ al cabo de 2 meses

Nos queda, haciendo la potencia en la calculadora y obteniendo la posicion $(2, 3)$:

$ "El porcentaje de clientes que" S_2 -> S_3 " al cabo de 2 meses" = 0.326 $

3. Sea $arrow(p) (0) = (1/3 1/3 1/3)$ el vector fila cuyos elementos indican la proporcion de clientes que tenia inicialmente cada supermercado. El producto $A PP^n$ indica la proporcion de clientes de cada supermercado al cabo de $n$ meses.

Por codigo obtenemos:

- 1 año: $arrow(p) (12) = (0.19056464217402852, 0.24282981204838205, 0.5666055457775896) $
- 2 años: $arrow(p) (24) = (0.17863451653371634, 0.23889188846628787, 0.5824735949999964) $
- 3 años: $arrow(p) (36) = (0.17773767147277136, 0.238602152570176, 0.5836601759570534) $

Notemos que a largo plazo va a converger la proporcion de clientes de cada supermercado

== Ejercicio 17

Considere una cadena de Markov con espacio de estados $EE = \{a, b, c\}$ y matriz de transicion de probabilidades dada por:

$ PP = mat(
  0.3, 0.4, 0.3;
  1, 0, 0;
  0, 0.3, 0.7;
) $

1. Calcular $P(X_2 = a|X_1 = b, X_0 = c)$

Como es una cadena de Markov, la probabilidad de $X_2$ solo depende del paso anterior, por lo tanto:

$ P(X_2 = a|X_1 = b, X_0 = c) = P(X_2 = a|X_1 = b) $

Esta probabilidad es "La probabilidad de $X_2 = a$ sabiendo que $X_1 = b$" entonces sale facilmente con la matriz de transicion de probabilidades. Como el espacio de estados es $EE = \{a, b, c\}$ entonces las "filas" y las "columnas" de las matrices representan esas transiciones

$ P(X_2 = a|X_1 = b) = P(X_n+1 = a | X_n = b) = "Origen: b" -> "Destino: a" = PP[1][0] = 1 $

2. Calcular $P(X_35 = a|X_33 = a)$

$ P(X_35 = a| X_33 = a) => "Haces dos pasos y terminas en el mismo lugar" $

El "Hacer dos pasos" quiere decir que si elevo la matriz al cuadrado, voy a obtener esas probabilidades

$ PP^2[a][a] = PP^2[0][0] underbrace(=, "por codigo") 0.49 $

3. Estimar $P(X_200 = a| X_0 = b)$

$ PP^200 [b][a] = 0.3704 $


== Ejercicio 25

Cada materia que cursa un alumno en una universidad tiene tres oportunidades para dar el examen final. Suponga que la *probabilidad de aprobar el examen final es siempre p*. Sea $X_n$ la variable aleatoria que da el *número de oportunidades* que tiene el alumno en el período *n*. El recorrido de $X_n$ es el conjunto {0,1,2,3} siendo el valor cero el estado que se alcanza cuando se aprueba el examen final (claramente un estado absorbente). El *estado 3* corresponde al que se tiene una vez *aprobada la cursada*. Cuando no se aprueba en la última de las instancias se produce una transición del estado 1 al 3 (la materia se recursa)


1. Modelar la evolucion de este proceso como una cadena de Markov obteniendo la matriz de probabilidades de transicion de un paso

- Entonces se empieza en 3 $=> X_0 = 3$

- Con probabilidad $p$ se pasa directo a 0 en todos los estados, con probabilidad $p-1$ se pasa al estado $n - 1$

- En la ultima de las instancias, si desaprobas, pasas a 3 denuevo

- Si ya estas en cero, no tenes chance de irte a otro lado

$ PP = mat(
  1, 0, 0, 0;
  p, 0, 0, 1 - p;
  p, 1 - p, 0, 0;
  p, 0, 1 - p, 0;
) $

2. En el caso de que el estado inicial es 3, la distribucion de probabilidades es $(0, 0, 0, 1)$. Obtener la distribucion de probabilidades para los primeros tres periodos y conjeturar sobre su forma para todo $n$. Analizar su valor limite

Esto seria calcular si o si a mano la multiplicacion de matrices para los 3 casos. No lo voy a hacer pero es eso

