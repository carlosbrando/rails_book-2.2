## StringInquirer

Une nouvelle classe nomm�e `StringInquirer` a �t� ajout�e a Rails.

Je vais utiliser quelques exemples pour faire comprendre. Cr�ons une classe `Client` avec une m�thode qui retourne son statut (`status`).

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

OK, jusqu'ici tout est normal. Je vais maintenant modifier l'impl�mentation de la m�thode `status` en utilisant la classe `StringInquirer`. Gardons � l'esprit que la valeur renvoy�e par `status` bien s�r peut provenir d'une base de donn�es, ceci n'est qu'un exemple :

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

Pour v�rifier si le `status` du client a la valeur attendue, au lieu de comparer � des `Strings`, j'utilise une m�thode du nom de la valeur du statut attendu et un point d'interrogation.

Bien s�r cet usage a commenc� dans Rails m�me. Par exemple pour v�rifier que Rails a �t� charg� dans un environnement de production, vous pouvez remplacer le vieux `Rails.env == "production"` par :

	Rails.env.production?
