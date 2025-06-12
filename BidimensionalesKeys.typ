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

