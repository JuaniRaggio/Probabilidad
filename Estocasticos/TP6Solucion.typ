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

$ Z_i = \{"Gana" -> 1, "Pierde" -> -1} $

En palabras esto seria que todas las tiradas de moneda tienen una probabilidad de ganar de $0.5$, por lo que el valor esperado de $n$ tiradas, viene dado por:

Es un proceso de Markov pues las probabilidades son i.i.d. Por lo tanto la plata que se tiene en la jugada $n$ depende _solamente_ de lo que se tiene en la tirada anterior $n - 1$

Entonces los posibles valores de $X_n$ son:

$ X_n = (+1) . k + (-1) . (n - k) = 2k - n $

$ \{ -n, -n + 2, -n + 4, ..., n \} $








