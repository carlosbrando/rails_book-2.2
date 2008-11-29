## Assegnare un nome alle variabili locali di una collezione nei partials

Nel codice seguente un `partial` viene utilizzato con una collezione di oggetti:

	render :partial => "admin_person", :collection => @winners

All'interno del `partial` è possibile utilizzare la variabile `admin_person` per accedere agli elementi della collezione. Ma tale convenzione sui nomi è decisamente poco intuitiva.

Adesso è possibile scegliere un nome customizzato per tale variabile, attraverso l'opzione `:as`. Modifichiamo il precedente esempio:

	render :partial => "admin_person", :collection => @winners, :as => :person

Ora è possibile accedere ad ogni item della collezione attraverso la (più intuitiva) variabile `person`.

## I partial non definiscono più variabili locali implicitamente

Nell'esempio seguente, facciamo il rendering in un partial senza indicare quale variabile debba essere utilizzata per riempire il suo contenuto. Precedentemente, Rails assumeva che dovesse utilizzare una variabile di istanza avente lo stesso nome del partial.

	@customer = Customer.new("Carlos Brando")
	render :partial => "customer"

A partire da Rails 2.2 tale comportamento è deprecato, e viene emesso un relativo warning:

"@customer will no longer be implicitly assigned to customer"

Aspettatevi che tale funzionalità venga completamente rimossa in futuro.
