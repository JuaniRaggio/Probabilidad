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











