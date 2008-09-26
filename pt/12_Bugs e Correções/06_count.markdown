## Método count do ActiveRecord não inclui um alias para associações

Digamos que temos a seguinte associação `has_many :through`:

	class Author < ActiveRecord::Base
	  has_many :authorships
	  has_many :books, :through => :authorships
	end

Ao procurar por um livro você pode incluir a autoria em sua busca:

	author.books.find(:all, :include => :authorships,
	                  :conditions => ["authorships.primary = ?", true])

Isto funciona muito bem, sem erros. Mas tente fazer o mesmo com o método `count`:

	author.books.count(:include => :authorships,
	                   :conditions => ["authorships.primary = ?", true])

Temos um erro. Isto acontece porque a tabela **authorships** foi incluída duas vezes na mesma query.

O método `find` é mais esperto, porque ele cria um apelido para a tabela, coisa que o método `count` não faz. Eu sei que o exemplo dado não é muito bom, mas é apenas para tentar mostrar o problema com o método `count`.

Esta falha foi corrigida. Agora o método `count` se comporta exatamente como o método `find` em relação ao `:include`.

## Correção de bug no método count do ActiveRecord

Existia um bug no método `count` do `ActiveRecord` quando usávamos uma associação `has_many` em conjunto com a opção `:limit` ou `:offset`. Vejamos um exemplo:

	class Post < ActiveRecord::Base
	  has_many :comments, :limit=> 2
	end

No código acima quando tentarmos recuperar os comentários de um post, apenas 2 comentários devem ser retornados.

	post.comments.length # => 2

	# Veja o SQL usado:
	# SELECT * AS count_all FROM "comments" WHERE
	# ("comments".post_id = 1) LIMIT 2

	Mas, ao usarmos o método count:

	post.comments.count # => 3

	# Veja o SQL usado:
	# SELECT count(*) AS count_all FROM "comments" WHERE
	# ("comments".post_id = 1)

Como você pode ver o erro ocorria porque a clausula `LIMIT 2` não era incluída na query do SQL.

Obviamente isto já foi corrigido e já está funcionando no Rails 2.2.
