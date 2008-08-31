## Informando outro primary\_key em associações

Uma nova opção foi acrescentado aos métodos `has_many` e `has_one`: a opção `:primary_key`.

Fazendo uso desta opção podemos definir qual método do modelo associado retornará a chave primária que será usada na associação. Obviamente o método padrão é o **id**.

Veja um exemplo de uso:

	has_many :clients_using_primary_key, :class_name => 'Client',
	  :primary_key => 'name', :foreign_key => 'firm_name'

O método `has_one` funciona exatamente como no exemplo acima.
