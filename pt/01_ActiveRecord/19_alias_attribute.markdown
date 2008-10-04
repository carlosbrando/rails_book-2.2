## alias\_attribute funcionando com Dirty Objects

Para entender esta alteração, vamos precisar analisar o mesmo código sendo executado em uma versão mais antiga do Rails e depois nesta nova versão. Vamos pegar um modelo como exemplo:

	class Comment < ActiveRecord::Base
	  alias_attribute :text, :body
	end

Note que estou usando o método `alias_attribute` para criar um alias para o atributo `body` com o nome de `text`. Na teoria este método deveria replicar todos os métodos de leitura, escrita, pesquisa e qualquer outro que envolva o atributo `body`. Mas vejamos um exemplo sendo executado no Rails 2.1 ou anterior:

	c = Comment.first
	# => #<Comment id: 1, body: "my comment">

	c.body
	# => "my comment"

	c.text
	# => "my comment"

	c.body = "a new message"
	# => "a new message"

	c.body_changed?
	# => true

	c.text_changed?
	# => NoMethodError: undefined method `text_changed?' ...

Ao executar o método `text_changed?` temos um erro, porque o `alias_attribute` não estava replicando os métodos de rastreamento, mas isto já foi corrigido. Veja o mesmo código executado agora em um projeto Rails 2.2:

	c = Comment.first
	# => #<Comment id: 1, body: "my comment">

	c.body
	# => "my comment"

	c.text
	# => "my comment"

	c.body = "a new message"
	# => "a new message"

	c.body_changed?
	# => true

	c.text_changed?
	# => true

	c.text_change
	# => ["my comment", "a new message"]
