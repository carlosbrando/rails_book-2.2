## Ajout d'un préfixe aux *delegates*

`Module#delegate` a maintenant une nouvelle option `:prefix` qui peut être utilisée quand vous voulez que le nom de la classe cible soit préfixé par le nom de la méthode. Observons deux exemples. Voici d'abord la façon classique d'employer les *delegates* :

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client
	end

	Invoice.new.street
	Invoice.new.city
	Invoice.new.name

Et voici un exemple avec la nouvelle option `:prefix` :

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client, :prefix => true
	end

	Invoice.new.client_street
	Invoice.new.client_city
	Invoice.new.client_name

Vous pouvez aussi personnaliser le préfixe :

	class Invoice < ActiveRecord::Base
		delegate :street, :city, :name, :to => :client, :prefix => :customer
	end

	Invoice.new.customer_street
	Invoice.new.customer_city
	Invoice.new.customer_name
