= Procedimientos para ejercicios de Bidimensionales

== Teorema transformacion general
_Nota: Este metodo solo se aplica si la funcion $g(X)$ es monotona por partes_

- Sea $Y, X$ vac, donde conocemos la denisdad de $X$
- Sea $Y = g(X)$, no estrictamente monotona (no inyectiva)

_Para hallar la densidad de Y_...

$ f_Y(y) = sum _(x_i in g^(-1)(y)) (f_X(x_i))/abs(g'(x_i)) $

- *ATENTO* los $x_i$ son las preimagenes de las ramas, *no las raices*
- $g'(x_i) != 0 =>$ Los puntos donde la funcion es localmente invertible
- La sumatoria recorre todas las partes en donde la funcion es monotona (localmente invertible)

===== En otras palabras...

1. Escribís la ecuación $y = g(x)$ y resolvés para $x$: hallás todas las soluciones $x_i$ que cumplen $g(x_i) = y$

2. En cada solución $x_i$:
   - Verificás que esté en el dominio de $X$
   - Calculás $f_X(x_i)$
   - Derivás $g(x)$ y evaluás $|g'(x_i)|$

3. Sumás los términos $f_X(x_i)/abs(g'(x_i))$ correspondientes a cada solución válida

=== Teorema: trasformacion caso monotono
_Nota: Este metodo solo se aplica si la funcion $g(X)$ es monotona (inyectiva)_

$ f_Y(y) = f_X(g ^(-1)(y)) . abs((d)/(d y) g ^(-1)(y)) $

Notemos que en este caso hay varias cosas que cambian:

- Se usa $g ^(-1)(y)$ en la evaluacion de $f_X$
- Se multiplica en vez de dividir
- Restriccion mayor: _Monotonia estricta_


== Variables aleatorias bidimensionales

_Nota:_
Antes de leer todo _discretas_ y todo _continuas_ tener en cuenta que la diferencia entre ambas es minima

- En discretas vamos a tener la suma de probabilidades puntuales

- En continuas vamos a tener integrales de densidades de probabilidad

Es razonable pensar las siguientes equivalencias entre caso discreto vs continuo

- $P(X = x) -> f_X(x)$

- $sum -> integral$

La correlacion es comun para ambos casos. Nos dice como se relacionan linealmente dos variables

$ ro_(X, Y) = "Cov"(X, Y)/(sigma_X sigma_Y) $
$ -1 <= ro_(X, Y) <= 1 $
$ ro_(X, Y) = -1 -> "negativa perfecta" -> "aumentan y disminuyen al mismo ritmo pero en sentido opuesto" $
$ ro_(X, Y) = 0 -> "no existe correlacion lineal" $
$ ro_(X, Y) = 1 -> "positiva perfecta" -> "aumentan y disminuyen al mismo ritmo y en mismo sentido" $

=== Discretas

Las *probabilidades marginales* de cierta $X$ son: Fijar una x y hacer la suma de todas las probabilidades *conjuntas* (interseccion) con todas las probabilidades $x, y_i$

$ P(X = x) = sum _y P(X = x, Y = y) $

- Teorema fundamental:

$ P(Y = y|X = x) = P(X = x, Y = y)/P(X = x) $

_Conclusion:_ La *probabilidad marginal* representa *la probabilidad total de que ocurra un determinado valor de X, sin importar Y*, sabiendo que X e Y estan relacionados obviamente

- La *esperanza*:

$ E[X] = sum x P(X) $


- La *varianza*:
$ V(X) = sum (x - E[X])^2 P(X) $


- La *covarianza*:

$ "Cov"[X, Y] = sum (x - E[X])(y - E[Y])P(X, Y) = E[X Y] - E[X]E[Y] $


==== Independencia

Dos variables son independientes sii
$ p_(X, Y)(x_i, y_i) = p_X(x_i) . p_Y(y_i) $


