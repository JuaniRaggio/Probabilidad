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
  $ P(A|B) = P(A) <=> P(A inter B) = P(A).P(B) <=> A "ind" B $

  $ P(A|B) = P(A inter B)/P(B) => 0.6 = P(A inter B)/P(B) $

  Uso los datos para obtener mas informacion

  $ P(A union overline(B)) = P(A) + P(overline(B)) - P(A inter overline(B)) = P(A) - P(B) + 1 - P(A inter overline(B)) $

  $ => P(A union overline(B)) = P(A) - P(B) + 1 - 1 + P(overline(A) union B) and P(overline(A) union B) = P(A union overline(B)) $

  $ P(A union overline(B)) = P(A) - P(B) + P(A union overline(B)) $

  $ 0 = P(A) - P(B) => #table()[P(A) = P(B)] $

  Tenemos que

  $ P(A) = P(B) and P(A|B) = 0.6 $

  Supongo que son independientes

  $ P(A|B) = P(A) => P(A) = 0.6 $

  Tambien tendriamos que
  
  $ P(A union overline(B)) = 0.8 = P(A) + P(overline(B)) - P(A inter overline(B)) $

  $ 0.8 = 0.6 + (1 - 0.6) - (0.6 times (1 - 0.6)) = 0.76 $

  $ #table()[$ 0.8 != 0.76 => "Absurdo!" $] $

  Vino de suponer independencia por lo tanto no son independientes

b. Calcular $P(A union B)$ y $P(B|A)$

  $ P(A union B) = P(A) + P(B) - P(A inter B) = P(A) + P(B) - P(A|B).P(B) $

  $ P(A inter B) = P(A|B).P(B) $

  $ P(B|A) = P(A inter B)/P(A) and P(A) = P(B) => #table()[P(B|A) = P(A|B) = 0.6] $

== Ejercicio 12

Sean A y B dos sucesos asociados a un experimento aleatorio. Considerando que $P(A) = 0.4$

$P(B) = p$ y $P (A union B) = 0.7$ 
Cuál es el valor de p si A y B son:

1. Mutuamente excluyentes?

  $ P(A union B) = P(A) + P(B) => 0.7 = 0.4 + p => p = 0.3 $

2. Independientes?

  $ P(A|B) = P(A) => P(A inter B)/P(B) = A => P(A inter B) = P(A) times P(B) $

  $ P(A union B) = P(A) + P(B) - P(A inter B) => 0.7 = 0.4 + p - P(A) times P(B) $

  $ 0.7 = 0.4 + p - 0.4 times p => p = 0.5 $

== Ejercicio 15
Cierto tipo de motor eléctrico falla por obstrucción de los cojinetes, por combustión del bobinado o por desgaste de las escobillas. Suponga que la probabilidad de la obstrucción es el doble de la de combustión, la cual es cuatro veces más probable que la inutilización de las escobillas. Cuál es la probabilidad de que el fallo sea por cada uno de estos tres mecanismos si la *probabilidad de que el motor falle es 0.13?* Indique las hipótesis que debe asumir para resolver el problema.

- MF : {Falla el motor}

- OC : {Falla por obstruccion de cojinetes}

- CB : {Falla por combustion del bobinado}

- DE : {Falla por desgaste de las escobillas}

$ P("OC") = 2 times P("CB") and P("CB") = 4 times P("DE") $

El motor falla si falla alguna de las tres cosas, entonces

$ "MF" = "OC" union "CB" union "DE" $

$ P("MF") = P("OC" union "CB" union "DE") $

$ P("MF") = P("OC") + P("CB" union "DE") - P("OC" inter ("CB" union "DE")) $

$ P("CB" union "DE") = P("CB") + P("DE") - P("CB" inter "DE") $

$ P(("OC" inter "CB") union ("OC" inter "DE")) = P("OC" inter "CB") + P("OC" inter "DE") - P("OC" inter "CB" inter "DE") $

Entonces tenemos...

$ P("MF") = P("OC") + P("CB") + P("DE") - P("CB" inter "DE") - (P("OC" inter "CB") + P("OC" inter "DE") - P("OC" inter "CB" inter "DE")) $

$ P("MF") = 0.13 $

Luego tenemos que suponer que los eventos son independientes

$ 0.13 = P("OC") + P("CB") + P("DE") - P("CB").P("DE") - P("OC").P("CB") - P("OC").P("DE") + P("OC").P("CB").P("DE") $

#table()[Faltaria usar los datos para extraer una por una todas las probabilidades]


== Ejercicio 16
Un sistema de frenado diseñado para impedir que los automóviles derrapen puede descomponerse en tres subsistemas en serie (el sistema de frenado *opera adecuadamente* si y solo sí los *tres subsistemas operan adecuadamente*), que operan independientemente: un sistema
electrónico, otro hidráulico y un tercero mecánico. La confiabilidad de un sistema se dene
como la probabilidad de que funcione adecuadamente durante un período de tiempo dado.
En cierto tipo de frenado las confiabilidades de cada subsistema son respectivamente 0.998;
0.997.y 0.993.

\

SE = {Funciona el sistema electronico} = 0.998

SH = {Funciona el sistema hidraulico} = 0.997

SM = {Funciona el sistema mecanico} = 0.993

a. Determine la confiabilidad del sistema.

#table(columns: 1)[ESTO ESTA MAL][
Como el sistema esta en serie, el orden en el que se "evaluan" es siempre el mismo $ E -> H -> M $

- Por lo que si estas evaluando el sistema hidraulico, ya sabes que tuvo que haber funcionado el sistema electrico.

- Si estas evaluando el sistema mecanico, ya sabes que tuvo que haber funcionado el sistema hidraulico (en consecuencia el electrico tambien)
][Porque que el sistema funcione "en serie", no necesariamente quiere decir que se van a evaluar uno por uno. Lo que pasa en estos sistemas es que SI o SI tienen que funcionar los tres sistemas, si cualquiera de los tres falla, no puedes frenar adecuadamente]

Entonces,
$ "S" = {"El sistema funciona"} $

$ P("S") = P("SE" inter "SH" inter "SM") = P("SE") times P("SH") times P("SM") = 0.998 times 0.997 times 0.993 = 0.98804 $

b. Si en cierto período de operación el sistema falló porque eso ocurrió con uno de los subsistemas, cuál de los tres es más probable que haya fallado?

Claramente el mas propenso a fallar es el sistema mecanico pues es el que menor confiabilidad tiene


== Ejercicio 17

Un número binario está compuesto sólo de los dígitos 0 y 1. Esos dígitos se transmiten uno
tras otro a través de cierto canal de información. Suponga que la probabilidad de que se
transmita un dígito incorrecto es $p$ y que los *errores en dígitos diferentes son independientes*
uno de otro.

a. Cuál es la probabilidad de recibir al extremo del canal de información un número
incorrecto de n dígitos ? La condición de número incorrecto corresponde a que por lo
menos un bit sea recibido con error.

Se plantea que el experimento aleatorio se repite _n veces_, independientemente de si en el experimento $i, i < n$ se envia un bit erroneo, se van a seguir repitiendo los experimentos hasta llegar a n

$"ok"_i$: {"El i-esimo digito se recibio sin errores"}

Como los experimentos son independientes el uno del otro, el evento: NK: {"El numero se envio correctamente"}, implica se cumpla $"ok"_i$ para todo i menor o igual a n, con n siendo la cantidad de digitos del numero

$ P("NK") = P(inter.big_(1)^(n) "ok"_i) $

$ P("NK") = product_(1)^(n) P("ok"_i) underbrace(=>, "equiprob.") P("NK") = P("ok"_i)^n = (1 - p)^n $

b. Cuál es la probabilidad de recibir al extremo del canal de información un número
incorrecto de n dígitos por tener sólo un bit con error?

Esto es probabilidad condicional, pues necesitamos saber la probabilidad de que un solo bit haya sido incorrecto sabiendo que el numero fue incorrecto

UE: {"Solo un digito tuvo error"}

$ P("UE"|overline("NK")) = P("UE" inter overline("NK"))/P(overline("NK")) $

$ P("UE"|overline("NK")) = P("UE" inter "NK")/(1 - p^n) = P("UE")/(1 - p^n) $

Tenes que tomar uno entre en para decir en que "posicion" esta el error, por eso se lo multiplica por el combinatorio

$ P("UE") = (1 - p)^(n - 1) p binom(n, 1) $

$ #table(columns: 1)[$P("UE"|overline("NK")) = ((1 - p)^(n - 1) p binom(n, 1))/(1 - (1 - p)^n) $] $


== Ejercicio 18

Agregando tres bits extras a una palabra de 4 bits de una manera particular (código de Hamming) se puede detectar y corregir hasta un error en cualquiera de los bits. Si la probabilidad de que un bit sea cambiado durante la transmisión (y por consiguiente se transmita con error) es 0.05 y esos cambios son independientes


a. cuál es la probabilidad de que una palabra (de 7 bits en total) sea correctamente recibida (o sea con hasta un error) ?

Volvemos a usar el evento $"ok"_i$ y el evento UI

$ p = 0.05 => P("UE") + P("NK") = 7 times (1 - 0.05)^(7 - 1) times 0.05 + (1 - 0.05)^7 = 0.95561 $

b. Compare la probabilidad calculada en a) con la que correspondería si la palabra de 4 bits no fuera transmitida con bits de chequeo. En este caso los 4 bits deben recibirse sin error para que la palabra no tenga error.

$ P("NK") = (1 - 0.05)^4 = 0.81451 $


== Ejercicio 19

En la fabricación de cierto artículo se encuentra que se presenta un tipo de defectos con una probabilidad de 0.1 y defectos de un segundo tipo con una probabilidad de 0.05.
Si la ocurrencia de esos defectos puedan suponerse sucesos independientes, cuál es la probabilidad de que:

$ D_i = {"Articulo tiene el defecto i"} $

a. Un articulo no tenga ambas clases de defectos?

$ P(overline(D_1 inter D_2)) = 1 - P(D_1 inter D_2) $

Como son independientes...

$ P(D_1 inter D_2) = P(D_1) times P(D_2) $

$ P(overline(D_1 inter D_2)) = 1 - 0.1 times 0.05 = 0.995 $


b. Un articulo sea defectuoso?

$ D = {"Articulo defectuoso"} = D_1 union D_2 $

$ P(D) = P(D_1 union D_2) = P(D_1) + P(D_2) - P(D_1 inter D_2) $

$ P(D) = 0.15 - (1 - 0.995) = 0.145 $


c. Sabiendo que un articulo es defectuoso, tenga solo un tipo de defecto?

$ "1D" = {"Articulo tiene un solo tipo de defecto"} $

$ P("1D") = P((D_1 inter overline(D_2)) union (overline(D_1) inter D_2)) $

$ P("1D") = P(D_1 inter overline(D_2)) + P(overline(D_1) inter D_2) - P(D_1 inter overline(D_2) inter overline(D_1) inter D_2) $

$ P("1D") = P(D_1 inter overline(D_2)) + P(overline(D_1) inter D_2) $

$ P("1D") = 0.1 times 0.95 + 0.9 times 0.05 = 0.14 $

$ P("1D"|D) = P("1D" inter D)/P(D) underbrace(=, "1D implica D") P("1D")/P(D) = 0.96551 $


== Ejercicio 20

Los contactos A, B, C, D, pertenecen a distintos relevadores (A en serie con B, en paralelo a C en serie con D). Cuando se excita cualquier relevador se cierra el contacto pero puede ocurrir una falla de conexión con probabilidad $10^(-2)$. Calcule la probabilidad de que circule corriente entre la entrada y la salida del circuito de la gura al excitar los cuatro relevadores. Asuma independencia de falla de los relevadores.


CC = {"Circula corriente en la salida"}


$ P("CC") = P((B inter A) union (D inter C)) = P(B inter A) + P(D inter C) - P(A inter B inter D inter C) $

Como son independientes y su probabilidad de falla es 

$ p = 10^(-2) $

$ P("CC") = P(B) times P(A) + P(D) times P(C) - P(A) times P(B) times P(C) times P(D) = 0.99960399 $


== Ejercicio 21

Un conjunto electrónico consta de 2 subsistemas, A y B. A partir de una serie de pruebas previas, se presuponen estas probabilidades:
$ P (A "falle") = 0.2; $
$ P (B "solo falle") = 0.15; $
$ P (A " y " B "fallen") = 0.15 $

\

Calcule las siguientes probabilidades:

1. $ P(A "falle" | B "haya fallado") $

$ P(A "falle" | B "haya fallado") = P(A "falle" inter B "falle")/P(B "falle") = 0.15/P(B "falle") $

$ P(B "falle") = P("solo" B "falle" union A " y " B "fallen") = P("solo" B "falle") + P(A " y " B "fallen") - underbrace(P("solo falle" B inter A " y " B "fallen"), "Interseccion vacia" => P(...) = 0) $

$ P(B "falle") = 0.15 + 0.15 = 0.3 $

$ P(A "falle" | B "fallo") = 0.5 $

2. $ P("solo" A "falle") $

$ P("solo" A "falle") = P(A "falle") - P(A " y " B "fallen") = 0.2 - 0.15 = 0.05 $


== Ejercicio 22

Para la señalización de emergencia se han instalado dos indicadores que funcionan independientemente. La probabilidad de que el indicador accione durante la avería es igual a 0.95 para el primero de ellos y 0.9 para el segundo


a. Halle la probabilidad de que durante la avería accione sólo un indicador.

P: {"Se acciona el primer indicador"}

S: {"Se acciona el segundo indicador"}

$ P((P inter overline(S)) union (overline(P) inter S)) = P(P inter overline(S)) + P(overline(P) inter S) - underbrace(P(P inter overline(S) inter overline(P) inter S), "Prob. de conjunto vacio" => 0) $

$ P(P inter overline(S)) + P(overline(P) inter S) underbrace(=, "x ind") P(P) times P(overline(S)) + P(overline(P)) times P(S) = 0.14 $

b. Calcule la probabilidad de que durante la avería se accionen k indicadores para k tomando los valores 0, 1, y 2.

$ 0: "CE" = {"Se accionan 0 indicadores"} $

$ P(overline(P) inter overline(S)) underbrace(=, "x ind") P(overline(P)) times P(overline(S)) = (1 - 0.95) times (1 - 0.9) = 0.005 $

$ 1: "UN" = {"Se acciona 1 indicador"} $

$ P("UN") = P("CE" union ((P inter overline(S)) union (overline(P) inter S))) underbrace(=, "m.e.") 0.005 + 0.14 = 0.145 $

$ 2: "DS" = {"Se accionan 2 indicadores"} $

$ P("DS") = P("UN" union (P inter S)) underbrace(=, "m.e. y" P "ind" S) 0.145 + P(P) times P(S) = 1 $

Tiene sentido porque me piden "que se accionen k", no me dicen explicitamente "que se accionen _exactamente_ k"

== Ejercicio 23

Una instalación industrial funciona cuando lo hacen un motor y al menos dos de tres equipos de bombeo. La probabilidad de que funcione el motor es 0.95 y la de funcionamiento de cada equipo de bombeo es 0.8. Se supone que la ocurrencia de falla en el motor o cualquiera de las bombas son sucesos independientes


a. Calcule la probabilidad de buen funcionamiento de la instalación.

$ I: {"Funciona la instalacion"} $

$ M: {"Funciona el motor"} $

$ E_i: {"Funcionan i equipos de bombeo"} $

$ P(E_i) = 0.8^i times 0.2^(3 - i) times binom(3, i) $

$ P(I) = P(M inter (E_3 union E_2)) $

$ P(I) underbrace(=, "m.e.") P(M inter E_3) + P(M inter E_2) $

$ P(I) underbrace(=, "ind") P(M) times P(E_3) + P(M) times P(E_2) $

$ P(I) = 0.95 times (0.512 + 0.384) = 0.8512 $

b. Si la instalación funciona calcular la probabilidad de que funcionen exactamente dos equipos de bombeo.

$ P(E_2|I) = P(E_2 inter I)/P(I) underbrace(=, E_2 => I) P(E_2) = 0.512 $


== Ejercicio 27

En una fábrica de pernos, las máquinas A, B y C fabrican 25 %, 35 % y 40 % de la producción total, respectivamente. De lo que producen, 5 %, 4 % y 2 % respectivamente son pernos defectuosos. Se escoge un perno al azar del total de lo producido por las tres máquinas.

1. Cual es la probabilidad de que el perno extraído sea defectuoso?

$ D = {"El perno extraido fue defectuoso"} $

$ A = {"El perno se extrajo de la maquina A"} $

$ B = {"El perno se extrajo de la maquina B"} $

$ C = {"El perno se extrajo de la maquina C"} $

$ P(D) = P(D|A).P(A) + P(D|B).P(B) + P(D|C).P(C) $

$ P(D) = 0.05 times 0.25 + 0.04 times 0.35 + 0.02 times 0.40 = 0.0345 $

2. Si el perno extraido es defectuoso, de que maquina es mas probable quevenga

$ "Maquina mas probable" = "max"{P(A|D), P(B|D), P(C|D)} $

$ P(A|D).P(D) = P(D|A).P(A) => P(A|D) = (P(D|A).P(A))/P(D) = (0.05 times 0.25)/0.0345 = 0.362318 $

$ P(B|D).P(D) = P(D|B).P(B) => P(B|D) = 0.40579 $

$ P(C|D).P(D) = P(D|C).P(C) => P(C|D) = 0.23188 $

La maquina mas probable es la *B*

$ballot$


== Ejercicio 28

Un sistema de transmisión de energía eléctrica está compuesto por un transformador elevador T1, dos líneas de transporte de energía L y dos transformadores reductores T2. El consumidor puede recibir por cualquier línea la potencia que necesite, pero el transformador reductor puede transmitir sólo el 50 % de la potencia requerida por el consumidor. La probabilidad de falla del transformador T1 es qT 1 = 0.05, de una línea L es $q L = 0.03$ y la del transformador T2 es $q T_2 = 0.006$. Los fallos de todos los elementos se consideran sucesos aleatorios independientes.

Determinar la probabilidad de transmitir un porcentaje de la potencia requerida por el consumidor del:

$ X% = {"Se transmite el" X% "de la potencia requerida por el cliente"} $

1. 100%

Quiere decir que *si o si* ambos transformadores reductores $T_2$ estan funcionando correctamente

$ "FT"_(i j) = {"Funciona el dispositivo" T_(i j)} $


$ P("100%") = P("FT"_(1 1) inter ("FT"_(L 1) union "FT"_(L 2)) inter "FT"_(2 1) inter "FT"_(2 2)) $

Como los fallos son _sucesos aleatorios independientes_, es relativamente facil desglosar esta cuenta

$ P(100%) = P("FT"_(1 1)) times P("FT"_(L 1) union "FT"_(L 2)) times P("FT"_(2 1)) times P("FT"_(2 2)) $

$ P(100%) = 0.95 times P("FT"_(L 1) union "FT"_(L 2)) times (1 - 0.006)^2 $

$ P("FT"_(L 1) union "FT"_(L 2)) = P("FT"_(L 1)) + P("FT"_(L 2)) - P("FT"_(L 1) inter "FT"_(L 2)) = 2 times (1 - 0.03) - (1 - 0.03)^2 $

$ P("FT"_(L 1) union "FT"_(L 2)) = 0.9991 $

$ P(100%) = 0.937789 $


2. 50%

$ P(50%) $

3. 0%

== Ejercicio 29
== Ejercicio 30
== Ejercicio 33
== Ejercicio 37


