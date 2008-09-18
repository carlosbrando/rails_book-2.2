## Pluralização na Internacionalização

Em alguns casos as traduções de certas frases pode depender de um número ou quantidade. Isto é algo muito comum e o pacote de internacionalização já vem preparado para estes casos.

Como exemplo, vamos pegar o método `distance_in_words`. Se o tempo for de 1 segundo a frase “1 segundo” no singular nos serve muito bem, mas se o tempo for maior do que isto a frase deve estar no plural como em “5 segundos”.

No arquivo de localização, podemos internacionalizar frases do nosso aplicativo que dependem de um número ou quantidade, por exemplo:

	datetime:
	  distance_in_words:
	    x_seconds:
	      one: "1 segundo"
	      other: "{{count}} segundos"

Este é um recurso valioso que é usado por vários métodos nativos do Rails e pode ser usado em seus próprios métodos.
