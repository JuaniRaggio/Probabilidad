= Ejercicio 7

El tiempo de duracion de una pieza de un equipo puede considerarse una variable aleatoria normal con desvio estandar de 4 horas y una media $mu$ que se desea estimar. Una muestra aleatoria de 100 piezas que fueron probadas produjo una media muestral de 501.2 horas de duracion. Obtener un intervalo de confianza para la media $mu$ con un nivel de confianza de:
1. 0.95

Por calculadora obtenemos: $(500.416, 501.984)$


2. 0.99

Por calculadora obtenemos: $(500.41601479999997, 501.9839852)$


= Ejercicio 6

En una fabrica de materiales electronicos se desea estimar el peso promedio del ultimo lote de rollos de alambre de cobre salido de produccion. Para ello se eligio al azar una muestra de 20 rollos que arrojo un pormedio de 38kg por rollo. Se conoce ademas, de registros historicos que el desvio estandar del peso de un rollo es de 4.2kg

1. Estimar el peso medio de los rollos con un intervalo de confianza del $95%$

$ (36.15930358941854, 39.84069641058146) => "Peso medio" = 38 plus.minus 1.8407 $

2. Cuantos rollos mas habria que pesar para poder obtener una estimacion del peso medio de un rollo con un error de muestreo de 1kg

$ "Margen" = (z sigma)/sqrt(n) => 1 = (z 4.2)/sqrt(n) => n = 17.64 z^2 underbrace(=, z^2 = 1.9599^2) 67.76  $

Conclusion: Se tendrian que pesar $67.76 - 20 = 47.76 approx 48$ rollos mas 


= Ejercicio 9

Una maquina llenadora de latas de cafe dosifica cantidades variables con distribucion normal de desvio estandar de 15 gramos. A intervalos regulares se toman muestras de 10 envases con el fin de estimar la dosificacion media. Una de estas muestras arrojo una media de 246 gramos

1. Obtener un intervalo de confianza del $90%$ para la dosificacion media.

$ I C = (238.19777418637986, 253.80222581362014) $

2. Cuantos envases mas habria que pesar para poder obtener una estimacion cuyo error de muestreo fuera 5 gramos?

Nos estan pidiendo que el error de muestreo $EE$ sea 5, entonces:

$ n =  (z * sigma / E)^2 => n = (z sigma/EE)^2 => n = 24.3498 => n - 10 approx 14 "Muestras mas" $


= Ejercicio 13
En la siguiente tabla se presentan los datos del contenido de silicio en una muestra de $150$ coladas de hierro:

#align(center)[#table(columns : 2)[*Cantidad de silice*][*Cantidad de coladas*][0.333 - 0.433][4][0.433 - 0.533][12][0.533 - 0.633][19][0.633 - 0.733][28][0.733 - 0.8333][48][0.8333 - 0.933][25][0.933 - 1.033][14]]

Estimar con una confianza del $95%$ el contenido medio de silice por colada

$ "Usando programa es gratis:" (0.7156984294696472, 0.7636349038636862) $

= Ejercicio 14

Los contenidos de 7 recipientes similares para acido sulfurico son:

9.8, 10.2, 10.4, 9.8, 10.0, 10.2 y 9.6 litros.

Obtener intervalos de confianza del $95%$ para la media del contenido de los recipientes de esa clase asumiendo que el contenido de acido en los recipientes es una VANormal

Por codigo de datos muestrales obtenemos: $ (9.738404696416119, 10.261595303583881) $

= Ejercicio 21

De un proceso productivo de una pieza seriada se tomo una muestra de 300 unidades en la que se encontraron 18 defectuosas

1. Calcular los limites de confianza del $90%$ para el porcentaje defectuoso del proceso.

$ "Usando la estimacionde proporcion con:" alpha = 0.1, n = 300, hat(p) = 18/300: $

$ => (0.03744695306106069, 0.0825530469389393) $

2. Calcular el tamaño de muestra adicional para tener un intervalo del mismo nivel de confianza pero semi-amplitud $0.01$ (o sea del 1% de semi-amplitud)

$ "Semi-amplitud" = "Error" = EE = "Margen" $

$ "margen" = z times sqrt( (hat(p) times (1 - hat(p))) / n' ) <= 0.01 $

$ 0.01 >= 1.64485 times sqrt((hat(p) - hat(p)^2)/n') $

Suponiendo que $hat(p)$ es maximo pues queremos el limite, el maximo de la funcion $g(p) = p(1-p) <=> p = 0.5 =>$ tomamos ese valor

Finalmente obtendriamos: $ n' = 6763.9 approx 6764 => "Se necesitan" 6764 - 300 = 6364 "muestras extra" $

3. Con la muestra dada de 300 unidades calcular el porcentaje defectuoso maximo del proceso con $90%$ de confianza (o sea un porcentaje tal que la probabilidad que el verdadero porcentaje defectuoso lo exceda sea 0.1)


= Ejercicio 17











