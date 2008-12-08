## StringInquirer

Une nouvelle classe nommée `StringInquirer` a été ajoutée a Rails.

Je vais utiliser quelques exemples pour faire comprendre. Créons une classe `Client` avec une méthode qui retourne son statut (`status`).

	class Client
	  def status
	    "active"
	  end
	end

	c = Client.new
	c.status
	# => "active"

	c.status == "active"
	# => true

	c.status == "inactive"
	# => false

OK, jusqu'ici tout est normal. Je vais maintenant modifier l'implémentation de la méthode `status` en utilisant la classe `StringInquirer`. Gardons à l'esprit que la valeur renvoyée par `status` bien sûr peut provenir d'une base de données, ceci n'est qu'un exemple :

	class Client
	  def status
	    ActiveSupport::StringInquirer.new("active")
	  end
	end

	c = Client.new
	c.status
	# => "active"

	# Here is the big difference:
	c.status.active?
	# => true

	c.status.inactive?
	# => false

Pour vérifier si le `status` du client a la valeur attendue, au lieu de comparer à des `Strings`, j'utilise une méthode du nom de la valeur du statut attendu et un point d'interrogation.

Bien sûr cet usage a commencé dans Rails même. Par exemple pour vérifier que Rails a été chargé dans un environnement de production, vous pouvez remplacer le vieux `Rails.env == "production"` par :

	Rails.env.production?
