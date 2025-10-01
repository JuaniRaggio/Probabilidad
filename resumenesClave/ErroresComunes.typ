#align(center)[*Errores que cometi durante la resolucion de ejercicios*]

#set heading(numbering: "1.")


= Generales:

== Negar probabilidades discretas:

- Hay que tener cuidado cuando *las probabilidades son discretas*,
  no es lo mismo menor igual que el menor

- Cuando das vuelta probabilidades hay que tener mucho cuidado,
  si negas un $>=$, te queda $<$ y en tal caso tendrias que usar el valor que 
  tenias *menos uno*, para transformarlo en $<=$

- Ojo porque en este parcial hay tiempos que son discretos, esos son los que 
  pueden llegar a hacer que metas la pata


= Cadenas de Markov:

+ *ATENTO* a poner bien filas y columnas.

  - Ser concistente, si lo hacer al revez del enunciado (siempre y cuando sea 
    cuadrada la matriz), ser concistente para el resultado

  - Intentar hacerlo como dice en el enunciado porque sino puede llegar a 
    causar confusion

+ Los *subindices de X son el numero de estado*, si entre los subindices hay 
  una diferencia de $k$ pasos, se puede calcular la matriz de transicion con 
  las probabilidades usando $PP^k$ y se ve la celda que interesa

= Procesos estocasticos

== Cadenas de Markov

- Ojo cuando tengo una probabilidad condicional, que me dice *tengo info del
  futuro* pero queres la probabilidad del *pasado respecto de ese futuro*

  _Ejemplo:_
  $ X_n = {"El resultado maximo observado luego de " n "tiradas del dado"} $
  $ P(X_1 = 1 | X_3 = 3) => "Probabilidad de lo que paso en el primer caso,
  sabiendo lo que paso en el tercero" $
  _Luego se puede descomponer en las probabilidades de lo que paso en el 
  primer paso. *Acordarse de usar que pasar de un estado mayor a uno menor, es
  probabilidad 0 (me ahorra notacion)*_

= Intervalos de confianza

+ Cuando me piden un $n$ tal que el error sea un numero entero $k$, si no se 
  puede obtener ese valor, vamos a querer obtener el menor error posible.
  Entonces:

$ "El " n " siempre se redondea para arriba" $

+ La forma de maximizar $hat(p)(1-hat(p)) <=> hat(p) = 0.5$, nos sirve cuando 
  queremos limitar un error en base a la cantidad de muestras, en tal caso 
  tenemos que tener en cuenta que esa $hat(p)$ puede ser maxima




