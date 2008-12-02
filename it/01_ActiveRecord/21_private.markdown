## Rendere gli attributi ActiveRecord privati

Rails 2.2 vi permette di marcare attributi di `ActiveRecord` come `private`. Fino ad ora, questo era difficoltoso, dal momento che tali attributi sono creati attraverso tecniche di metaprogrammazione.

Per capire come funziona, rendiamo privato l'attributo `name` del modello `User`:

	class User < ActiveRecord::Base

	  private
	  def name
	    "I'm private"
	  end

	end

Quindi, proviamo ad accedervi:

	user = User.first
	# => #<User id: 1, name: "teste">

	user.name
	# => NoMethodError: undefined method `NoMethodError' for #<User:0x234df08>

Potete vedere che l'eccezione `NoMethodError` viene sollevata quando cerchiamo di chiamare un metodo privato. Tuttavia, possiamo modificare il nome dell'utente, poiché il metodo `name=` è ancora pubblico:

	user.name = "Carlos"
	# => "Carlos"
