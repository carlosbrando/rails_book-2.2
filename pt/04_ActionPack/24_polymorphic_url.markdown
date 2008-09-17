## Polymorphic Routes

Os métodos `*_polymorphic_url` e `*_polymorphic_path`, muito usados para gerar URLs a partir de registros do banco de dados, receberam um novo parâmetro opcional. Agora, além dos parâmetros normais eles também aceitam um hash de opções, tornando possível gerar rotas com parâmetros adicionais na url.

Vamos aos exemplos, com o método equivalente nos comentários:

	edit_polymorphic_url(@article, :param1 => '10')
	# => edit_article_url(@article, :param1 => '10')

	polymorphic_url(@article, :param1 => '10')
	# => article_url(@article, :param1 => '10')

	polymorphic_url(@article, :format => :pdf, :param1 => '10')
	# => formatted_article_url(@article, :pdf, :param1 => '10')
