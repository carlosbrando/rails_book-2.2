## Melhorando a performance usando ETags

Antes de começar a explicar este novo recurso, deixe-me tentar explicar o que são ETags (Entity Tags). Etags seriam de uma forma grosseira identificadores associados a cada recurso para determinar se o arquivo que está no servidor é o mesmo que está no cache do browser. No caso, o recurso seria uma página em HTML, mas também poderia ser um XML ou JSON.

Cabe ao servidor a responsabilidade de verificar se o recurso solicitado é igual dos dois lados. Caso o servidor confirme que o recurso armazenado no cache do browser do usuário é exatamente o mesmo que seria enviado de volta para ele, ao invés de devolver todo o conteúdo do recurso novamente ele apenas retorna um status **304** (Not Modified) e o browser usará o que está em seu cache.

Servidores Web como o Apache e o IIS já sabem fazer isto para página estáticas. Mas quando o conteúdo é dinâmico, como na maioria das páginas de um projeto Ruby on Rails, a responsabilidade é todo nossa.

Dois novos atributos foram adicionados ao objeto `response`, são o `last_modified` e o `etag`. Quando um valor é atribuído a estes atributos eles são automaticamente repassados aos cabeçalhos **HTTP\_IF\_MODIFIED\_SINCE** e **HTTP\_IF\_NONE\_MATCH** respectivamente. Quando uma nova requisição (`request`) deste recurso for feita ela retornará com estes cabeçalhos permitindo que você possa comparar com o valor atual e determinar se o que está no cache do usuário é uma versão recente ou antiga do conteúdo do recurso. Caso a versão do usuário seja a mais recente, ao invés de renderizar o recurso novamente, você pode simplesmente enviar um status "304 Not Modified" solicitando ao browser que use a versão armazenada em seu cache.

Para realizar esta operação temos dois métodos que podemos usar dependendo da situação: `stale?` e `fresh_when`.

Vejamos um exemplo:

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    if stale?(:last_modified => @article.published_at.utc, :etag => @article)
	      respond_to do |wants|
	        wants.html
	        wants.xml { render :xml => @article }
	      end
	    end    
	  end
	end

No exemplo acima, se no cabeçalho do `request` os valores forem diferentes dos atribuídos ao método `stale?` significa que a versão no cache do usuário não é recente, então o bloco respond_to é disparado e os valores informados ao método são atribuídos aos atributos `last_modified` e `etag` do objeto `response`.

Se os valores forem iguais, quer dizer que a versão no cache do usuário é a mais recente. Então o bloco respond_to não é disparado e apenas um status "304 Not Modified" é devolvido.

Ainda temos o método `fresh_when` que é uma versão simplificada do método `stale?`. Veja um exemplo:

	def show
	  @article = Article.find(params[:id])
	  fresh_when(:etag => @article, :last_modified => @article.created_at.utc)
	end

Basicamente este método faz o seguinte: Ele atribui os valores informados aos seus respectivos atributos no objeto `response` e verifica se eles são iguais aos enviados no objeto `request`, se forem diferentes (stale) então ele renderizará o template padrão da action. Caso os atributos sejam iguais em ambos os objetos (fresh), então ele apenas retornará um status "304 Not Modified" no lugar de renderizar o template.

Em algumas situações talvez seja necessário informar um `Array` à opção `:etag`, como no exemplo abaixo:

	fresh_when(:etag => [@article, current_user], :last_modified => @article.created_at.utc)
	
	# ou
	
	if stale?(:last_modified => @article.published_at.utc, :etag => [@article, current_user])
		# ...
	end
