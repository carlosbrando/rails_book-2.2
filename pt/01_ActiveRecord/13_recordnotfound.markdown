## Nova versão destrutiva dos métodos de pesquisa do ActiveRecord

Os métodos dinâmicos de pesquisa do `ActiveRecord` receberam uma versão destrutiva, que dispara um erro do tipo `RecordNotFound` caso nenhum registro seja encontrado, ao invés de apenas retornar `nil` como acontece atualmente.

Para usar esta versão, basta adicionar o sinal de exclamação no final do método. Veja um exemplo:

	Topic.find_by_title!("The First Topic!")
	# => ActiveRecord::RecordNotFound
