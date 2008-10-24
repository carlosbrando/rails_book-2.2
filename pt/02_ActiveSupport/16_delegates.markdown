## Adicionando um prefixo aos delegates

O método `Module#delegate` agora possui uma nova opção `:prefix` que pode ser atribuída caso você queira que o nome da classe alvo seja usado como prefixo antes do nome do método. Vejamos dois exemplos, primeiro da forma comum:

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client
	end

	Invoice.new.street
	Invoice.new.city
	Invoice.new.name

Agora usando a opção `:prefix`:

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client, :prefix => true
	end

	Invoice.new.client_street
	Invoice.new.client_city
	Invoice.new.client_name

Você também pode personalizar, atribuindo um outro nome ao prefixo:

	class Invoice < ActiveRecord::Base
		delegate :street, :city, :name, :to => :client, :prefix => :customer
	end

	Invoice.new.customer_street
	Invoice.new.customer_city
	Invoice.new.customer_name
