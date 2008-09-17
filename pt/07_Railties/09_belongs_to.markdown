## Relacionamentos belongs\_to automatizados

Se você já estiver usando o Rails 2.2, tente executar o seguinte comando para criar um novo modelo:

	./script/generate scaffold comment author:string body:text post:references

Note que estou informando que meus comentários terão uma referência a tabela posts. Ou em outras palavras que meus comentários pertencem (`belongs_to`) a um post. Agora veja o arquivo **app/models/comment.rb** gerado pelo script:

	class Comment < ActiveRecord::Base
	  belongs_to :post
	end

O relacionamento com a tabela posts já foi incluído automaticamente no modelo. Este é um novo recurso que encontramos nesta versão.
