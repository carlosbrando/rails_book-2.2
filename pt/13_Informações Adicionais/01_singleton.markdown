## O que é uma Rota Singular?

Além do **map.resources**, há também uma forma singular (ou "singleton") de rotear recursos: **map.resource**. Esta forma é usada para representar um recurso que só aparece uma vez no contexto.

Faz muito sentido usar uma rota singular quando temos um recurso que será único dentro da aplicação ou da sessão do usuário corrente.

Por exemplo, em um projeto de uma agenda cada usuário registrado tem seu próprio catálogo de endereços, então poderíamos cria nossa rota assim:

	map.resource :address_book

Com isto podemos usar todo o conjunto de recursos disponibilizados pelo Rails, tais como:

	GET/PUT address_book_url
	GET 	edit_address_book_url
	PUT 	update_address_book_url

Note que tudo está no singular. Estamos assumindo que no contexto atual não precisamos especificar qual catálogo de endereços desejamos, ao invés disso podemos simplesmente dizer "o catálogo de endereços", já que o usuário atual só tem um.

O relacionamento entre a tabela de catálogos e o usuário corrente não é automático, você deve autenticar o usuário e retornar o catálogo dele. Não existe mágica aqui, é apenas uma outra técnica de roteamento a nossa disposição, se precisarmos.
