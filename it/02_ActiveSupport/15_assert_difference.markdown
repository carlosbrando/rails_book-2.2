## Cambiamento nel metodo assert\_difference

Quanto utilizziamo il metodo `assert_difference` con più di una espressione e viene generato un errore, diventa difficile capire quale espressione causi il fallimento dell'assertion, dal momento che il messaggio di errore non include tale informazione.

In Rails 2.2 il messaggio di errore indica chiaramente quale metodo fa fallire l'assertion.
Esempio:

	assert_difference ['Post.count', 'current_user.posts.count'] do
	  Post.create(params)
	end

Il precedente codice mostra il seguente messaggio di errore, nell'ipotesi che la seconda espressione non passi:

**<current\_user.posts.count> was expression that failed. <1> expected but was <0>.**