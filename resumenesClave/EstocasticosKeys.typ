#set heading(numbering: "1.")

= Proceso Estocastico
- Coleccion de variables aleatorias indexadas por un parametro (en general tiempo)

$ \{X(t)\}_(t in T) $

$T: "Tiempo discreto o continuo"$

$E: "Espacio de estados" -> "Valores posibles de" X(t)$


== Simplificaciones utiles
- *Procesos estacionarios*

Las probabilidades son independientes del tiempo

_Las reglas del juego no dependen del momento en que empezamos_

$ f(x_1, t_1 + Delta t, x_2, t_2 + Delta t, ...) = f(x_1, t_1, x_2, t_2, ...) $


- *Incrementos independientes*

Los cambios en intervalos de tiempo *no solapados* son independientes

- *Incrementos estacionarios*

Las distribuciones de los incrementos solo dependen del *tamaño del intervalo*, no del momento


== Procesos de Markov

_El futuro depende solo del presente, no de todo el pasado_

$ P(X(t_n) = x_n|X(t_(n - 1)) = x_(n - 1), ..., X(t_1) = x_1) = P(X(t_n) = x_n|X(t_(n - 1)) = x_(n - 1)) $

Se ignora el pasado, solo te importa el lugar final

- En tiempos discretos:

$ p(x_3, t_3|x_1, t_1) = sum _x_2 p(x_3, t_3|x_2, t_2) . p(x_2, t_2|x_1, t_1) $

=== Cadenas de Markov

Son procesos de Markov con espacio de estados discreto:

1. Distribucion inicial $p_j(0)$
2. Matriz de transicion $P$, donde cada elemento $p_(i j)$ es:
$ p_(i j) = P(X_(n + 1) = s_j|X_n = s_i) $

- Evolcion/Paso:
$ arrow(p)(n + 1) = arrow(p)(n).P $

- Si es homogenea (transiciones no dependen de $n$):
$ arrow(p)(n) = arrow(p)(0) . P^n $

- Existe un *estado estacionario* si:
$ pi = pi P $

_Se resuelve el sistema con la condicion inicial:_

$ sum pi_i = 1 $

_Nota_ a $pi$ se lo llama "autovector" a izquierda porque multiplica a la matriz desde la izquierda y "a 1" porque en ese calculo $lambda = 1$ (deberia estar multiplicando a $pi$)

- *Estados de una cadena de Markov* <estados>
  - *Accesible*: Existe camino de un estado al otro
  - *Irreducible*: Todos se comunican (_comunicar_: Si puedo llegar de A a B entonces puedo llegar de B a A)
  - *Recurrente*: Vuelve seguro
  - *Transitorio*: Puede que no vuelva al estado inicial
  - *Periodico/Aperiodico*
  - *Regular*: Algun $P^n$ tiene todas sus entradas positivas


== Procesos de Poisson

- *Proceso estocastico* uso:$->$ arribos, fallas, particulas

$ lambda: "Eventos por unidad de tiempo" => T_i tilde.op "Exponencial"(lambda) $

Cumple con...
+ *Incrementos independientes*
+ *Incrementos estacionarios*
+ La probabilidad de 1 evento en $Delta t approx lambda Delta t$ (_leer que es lambda_)
+ La probabilidad de 2 o mas eventos en $Delta t$ es despreciable

- *Distribucion*:
$ P(N(t) = k) = (lambda t)^k/k! e^(- lambda t) $

- Los tiempos entre eventos son exponenciales con parametro $lambda$


== Tiempo hasta absorcion

- Si algunos estados son absorbentes, sse trabaja con una particion de la matriz:

$ P = mat(
  I, 0;
  F, Q;
) $

$ M = (I - Q)^(-1) $

- *Probabilidades de absorcion* $G = M F$ 








