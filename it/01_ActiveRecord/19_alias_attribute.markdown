## Ora alias\_attribute funziona con i dirty objects

Per comprendere questa modifica dobbiamo analizzare uno spezzone di codice eseguito su due versioni di Rails: 2.2 e precedente. Vediamo un esempio di modello:

	class Comment < ActiveRecord::Base
	  alias_attribute :text, :body
	end

Notate che stiamo utilizzando il metodo `alias_attribute` per creare un alias per l'attributo `body` chiamato `text`. In teoria questo metodo dovrebbe replicare i vari metodi dinamici creati da `ActiveRecord`, correlati all'attributo `body`. Ma osservate il seguente esempio eseguito su Rails 2.1 (o precedente):

	c = Comment.first
	# => #<Comment id: 1, body: "my comment">

	c.body
	# => "my comment"

	c.text
	# => "my comment"

	c.body = "a new message"
	# => "a new message"

	c.body_changed?
	# => true

	c.text_changed?
	# => NoMethodError: undefined method `text_changed?' ...

Nell'eseguire il metodo `text_changed?` compare un errore, dal momento che la chiamata `alias_attribute` sta replicando il metodo tracciato. Ma ciò adesso è stato corretto.

Osserviamo il comportamento del medesimo codice su Rails 2.2:

	c = Comment.first
	# => #<Comment id: 1, body: "my comment">

	c.body
	# => "my comment"

	c.text
	# => "my comment"

	c.body = "a new message"
	# => "a new message"

	c.body_changed?
	# => true

	c.text_changed?
	# => true

	c.text_change
	# => ["my comment", "a new message"]