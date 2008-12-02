## Rendre les attributs ActiveRecord privés

Rails&nbsp;2.2 vous permet de marquer `private` certains objets `ActiveRecord`. C'était difficile jusqu'à présent car ces objets sont créés par métaprogrammation.

Rendons privé l'attribut `name` du modèle `User` pour comprendre le fonctionnement.

	class User < ActiveRecord::Base

	  private
	  def name
	    "Je suis privé"
	  end

	end

Puis essayons de le récupérer :

	user = User.first
	# => #<User id: 1, name: "teste">

	user.name
	# => NoMethodError: undefined method `NoMethodError' for #<User:0x234df08>

Vous constatez que l'exception `NoMethodError` est signalée quand nous essayons d'invoquer une méthode privée. Par contre, je peux encore modifier le nom de l'utilisateur car la méthode `name=` est encore publique :

	user.name = "Carlos"
	# => "Carlos"
