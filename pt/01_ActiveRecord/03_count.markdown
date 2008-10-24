## Nova opção :from para métodos de cálculo do ActiveRecord

Uma nova opção foi incluída aos métodos de cálculos do `ActiveRecord` (`count`, `sum`, `average`, `minimum` e `maximum`).

Ao fazer uso da opção `:from`, podemos sobrecarregar o nome da tabela na query gerada pelo `ActiveRecord`, o que não parece muito útil em um primeiro momento. Mas algo interessante que esta opção nos permite fazer é forçar o MySQL a usar um índice especifico ao realizar o cálculo desejado.

Veja alguns exemplos de uso:

	# Forçando o MySQL a usar um índice para realizar o cálculo
	Edge.count :all, :from => 'edges USE INDEX(unique_edge_index)',
	           :conditions => 'sink_id < 5')

	# Realizando o cálculo em uma tabela diferente da classe associada
	Company.count :all, :from => 'accounts'
