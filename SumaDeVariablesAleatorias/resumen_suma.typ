= Para que sirven las desigualdades?

- Sirven siempre, para *cualquier tipo de variable aleatoria*
- Sirven para cuando *no sabes la distribucion de la variable*

== Desigualdad de Markov

$X$ una variable aleatoria, $forall epsilon > 0$ con $P(X>=0) =1$

$ P(X >= epsilon) <= (E(X))/epsilon $


== Desigualdad de Chebychev

$X$ una va., $forall epsilon > 0$

$ P(|X - E(X)| >= epsilon) <= (V(X))/(epsilon^2) $

=== Cuando usar cada una?

- Si solo nos interesa un lado de las cotas $=>$ *Markov*

- Ambas sos sirven para poner una cota y no necesitamos obtener el valor exacto

- A veces nos da $> 1$ la cota, lo cual es raro pero tiene sentido porque no
  deja de ser una cota

$ "V.A.I.I.D" ->
"Variables aleatorias independientes e identicamente distribuidas" $

= Suma de VAIID

$ X_1, ..., X_n, "vaiid" $
$ -> mu = E(X_1) = E(X_i), forall i $
$ -> sigma = sigma(X_1) = sigma(X_i), forall i $

- $S_n = sum_(i = 1)^n X_i$

  - $E(S_n) = E(sum_(i = 1)^n X_i) = sum_(i = 1)^n E(X_i) = n m$

  - $V(S_n) = V(sum_(i = 1)^n X_i) underbrace(=, "ind") sum_(i = 1)^n V(X_i) = n m$

- $overline(X)_n = (sum_(i = 1)^n X_i)/n = (S_n)/n$

  - $E(overline(X)_n) = E(S_n / n) = 1/n E(S_n) = mu_x$


  - $V(overline(X)_n) = V(S_n / n) = 1/(n^2) V(S_n) = (n sigma^2)/(n^2) =
    sigma^2 /n => sigma(overline(X)_n) = sigma/sqrt(n)$

$ P(|overline(X)_n - E(overline(X)_n)| >= epsilon) <= (V(overline(X)_n))/(epsilon) $
$->$ A medida de que se promedian mas variables, la probabilidad de que ese
promedio, este lejos del valor esperado, se achica

== Suma de variables aleatorias con distribucion conocida

_Si no sabemos que da, siempre se puede chequear calculando cual deberia ser
la media_

- #underline()[*Suma de binomiales*] $->$ binomial
  $X tilde "Bi"(n, p); Y tilde "Bi"(m, p), "ind" => X + Y tilde "Bi"(n + m, p)$

- #underline()[*Suma de Poisson*] $->$ Poisson
  $X tilde P_0 (lambda_1); Y tilde P_0 (lambda_2) "ind" => X + Y tilde 
  P_0(lambda_1 + lambda_2)$

- ...

\
\

= Ley de los grandes numeros

$ X_i, "v.a.i.i.d. con" E(X_i) $
$ P(|overline(X)_n - mu| >= epsilon) -> 0 $
$ (overline(X)_n overbrace(->, P) mu) $

_La probabilidad de que el promedio se aleje del valor esperado tiende a cero 
a mayor tamaño muestral_
*Sentido comun*

