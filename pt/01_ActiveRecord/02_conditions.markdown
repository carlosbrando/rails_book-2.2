## Uma nova forma de especificar conditions usando Hash

Ao realizar buscas no banco de dados, por vezes temos de fazer uso da opção `:joins` a fim de melhorar a performance de nosso aplicativo, em outros casos precisamos simplesmente recuperar algum tipo de informação que depende do resultado de duas tabelas.

Por exemplo, se desejássemos recuperar todos os usuários do sistema que compraram itens da cor vermelha, faríamos algo assim:

	User.all :joins => :items, :conditions => ["items.color = ?", 'red']

Este tipo de sintaxe parece incomodar já que você precisa incluir o nome da tabela (no caso **items**) dentro de uma **string**. O código parece estranho.

No Rails 2.2 encontraremos uma novidade nesta questão, nos permitindo fazer a mesma coisa de uma forma um pouco diferente, usando uma chave dentro do `Hash` para identificar a tabela:

	User.all :joins => :items, :conditions => {
	  :age => 10,
	  :items => { :color => 'red' }
	}

	# um outro exemplo que talvez deixe o código mais claro
	User.all :joins => :items, :conditions => {
	  :users => { :age => 10 },
	  :items => { :color => 'red' }
	}

Na minha opinião, desta forma o código fica muito mais claro, principalmente se temos de condicionar muitos campos de várias tabelas.

Só tenha em mente que a chave usada é o nome da tabela (você percebe pelo nome pluralizado) ou um alias caso você o tenha especificado na query.
