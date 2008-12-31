## ActiveResource::Base #to\_xml et #to\_json

Deux nouvelles méthodes ont été ajoutées à `ActiveResource::Base`&nbsp;: `to_xml` et `to_json`. La première convertit la ressource en chaîne XML&nbsp;; la seconde renvoie aussi une chaîne mais au format JSON.

La méthode `to_json` peut être configurée avec les paramètres optionnels `:only` et `:except`, qui vous permettent de limiter ou de supprimer certains attributs. Par exemple&nbsp;:

	person = Person.new(:first_name => "Carlos", :last_name => "Brando")
	person.to_json
	# => {"first_name": "Carlos", "last_name": "Brando"}

	person.to_json(:only => ["first_name"])
	# => {"first_name": "Carlos"}

	person.to_json(:except => ["first_name"])
	# => {"last_name": "Brando"}
