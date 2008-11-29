## Aggiungere un prefisso agli attributi delegati

Ora `Module#delegate` ha una nuova opzione `:prefix` che può essere utilizzata per fare in modo che il nome della classe target venga prefisso al nome del metodo.
Vediamo due esempi. Nel primo caso, il classico uso degli attributo delegati:

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client
	end

	Invoice.new.street
	Invoice.new.city
	Invoice.new.name

Ed ora un esempio che illustra l'uso della nuova opzione `:prefix`;

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client, :prefix => true
	end

	Invoice.new.client_street
	Invoice.new.client_city
	Invoice.new.client_name

E' anche possibile customizzare il prefisso:

	class Invoice < ActiveRecord::Base
		delegate :street, :city, :name, :to => :client, :prefix => :customer
	end

	Invoice.new.customer_street
	Invoice.new.customer_city
	Invoice.new.customer_name
