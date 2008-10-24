## Definindo como o método validates\_length\_of deve funcionar

O método `validates_length_of` faz parte dos muitos métodos de validação contidos no `ActiveRecord`. Este método em particular serve para garantir que o valor gravado em uma determinada coluna no banco de dados terá um tamanho máximo, mínimo, exato, ou até mesmo se está em um intervalo de valores.

Mas o termo "tamanho" é relativo. Hoje quando dizemos "tamanho" estamos nos referindo a quantidade de caracteres no texto.

Mas imagine um caso onde eu tenha um campo em um formulário onde a limitação não seja definida pela quantidade de caracteres e sim pela quantidade de palavras, algo como "escreva um texto com no mínimo 100 palavras". Imagine uma página onde o usuário tenha de redigir uma redação, por exemplo.

Hoje, para validar isto não teríamos outra escolha senão criarmos um novo método que faça esta validação. Mas à partir do Rails 2.2 poderemos personalizar o método `validates_length_of` para funcionar da forma como desejamos usando a opção `:tokenizer`.

Veja um exemplo que resolveria o problema citado acima:

	validates_length_of :essay,
	                    :minimum => 100,
	                    :too_short => "Sua redação deve ter no mínimo %d palavras."),
	                    :tokenizer => lambda {|str| str.scan(/\w+/) }

Este é apenas um exemplo do que podemos fazer com esta nova opção. Além disso podemos usa-lá para contar apenas a quantidade de dígitos, menções de uma única palavra, etc..
