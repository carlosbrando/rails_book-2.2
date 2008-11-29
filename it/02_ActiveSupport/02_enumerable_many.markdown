## Nuovo metodo: Enumerable#many?

Un nuovo metodo, chiamato `many?`, è stato aggiunto al modulo `Enumerable`. E come il suo nome suggerisce, vi informa se una collezione contiene più di un oggetto; ovvero, se contiene più oggetti.

Questo metodo è un alias per `collection.size > 1`. Vediamo alcuni esempi:

	>> [].many?
	# => false

	>> [ 1 ].many?
	# => false

	>> [ 1, 2 ].many?
	# => true

In aggiunta al formato mostrato nei precedenti esempi, questo metodo beneficia di una nuova implementazione che gli permette di ricevere anche dei blocchi, esibendo quindi un comportamento simile al metodo `any?`.

Osserviamo i seguenti esempi:

	>> x = %w{ a b c b c }
	# => ["a", "b", "c", "b", "c"]

	>> x.many?
	# => true

	>> x.many? { |y| y == 'a' }
	# => false

	>> x.many? { |y| y == 'b' }
	# => true

	# another example...
	people.many? { |p| p.age > 26 }

Per inciso, questo metodo restituisce `true` solo se una iterazione del blocco restituisce true, oppure laddove la collezione ha più di un oggetto quando invocato senza blocco.

Un'interessante nota a margine: il metodo fu inizialmente chiamato `several?` ma poi venne cambiato in `many?`.


