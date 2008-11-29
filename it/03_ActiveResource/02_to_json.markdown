## ActiveResource::Base #to\_xml e #to\_json

Sono stati aggiunti due nuovi metodi ad `ActiveResource::Base`: `to_xml` e `to_json`. Il primo fornisce una rappresentazione XML di una risorsa, mentre il secondo fornisce una rappresentazione in formato JSON.

Il metodo `to_json` può essere configurato utilizzando i parametri opzionali `:only` ed `:except`, i quali vi permettono di selezionare solamente determinati attributi. Esempio:

	person = Person.new(:first_name => "Carlos", :last_name => "Brando")
	person.to_json
	# => {"first_name": "Carlos", "last_name": "Brando"}

	person.to_json(:only => ["first_name"])
	# => {"first_name": "Carlos"}

	person.to_json(:except => ["first_name"])
	# => {"last_name": "Brando"}
