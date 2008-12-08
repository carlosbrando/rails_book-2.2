## Nuovo metodo di istanza Model#delete

Al fine di rendere `ActiveRecord` più consistente, un ulteriore metodo di istanza è stato creato: `Model#delete`. E' simile all'omonimo metodo di classe. Il metodo `delete`, al differenza del metodo `destroy`, elimina il record dal database senza invocare i metodi di callback, come `before_destroy` e `after_destroy`.

Questo metodo, inoltre, non rispetta le opzioni di vincolo, come `:dependent`, che specifica cosa debba essere fatto con gli oggetti associati quando il record viene eliminato.

	client = Client.find(1)
	client.delete