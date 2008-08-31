## Melhorando a performance usando ETags

Antes de começar a falar sobre isto, deixa eu tentar explicar o que são ETags (Entity Tags). Etags seriam de uma forma grosseira identificadores associados a cada recurso para determinar se o arquivo que está no servidor é o mesmo que está no cache do browser. No caso, o recurso seria uma página em HTML, mas também poderia ser um XML ou JSON.

Cabe ao servidor a responsabilidade de verificar se o recurso solicitado é igual dos dois lados. Caso o servidor confirme que o recurso armazenado no cache do browser do usuário é exatamente o mesmo que seria enviado de volta para ele, ao invés de devolver todo o conteúdo do recurso novamente ele apenas retorna um status **304** (Not Modified) e o browser usará o que está em seu cache.

Servidores Web como o Apache e o IIS já sabem fazer isto para página estáticas. Mas quando o conteúdo é dinâmico, como na maioria das páginas de um projeto Ruby on Rails, a responsabilidade é todo nossa.

O objeto `response` ganhou dois novos métodos, o `last_modified=` e o `etag=` (note o sinal de igualdade "="). Quando você atribuir valores a estes métodos eles serão repassados aos cabeçalhos **HTTP\_IF\_MODIFIED\_SINCE** e **HTTP\_IF\_NONE\_MATCH** respectivamente. Quando uma nova requisição (`request`) deste recurso for feita ela retornará com estes cabeçalhos permitindo que você possa comparar com o novo valor informado no `response` e decidir se quer enviar todo o conteúdo do recurso novamente ou apenas um status 304.

Vamos ao código (roubando o exemplo dado por Ryan Daigle em seu blog):

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    # informado o identificador
	    response.last_modified = @article.published_at.utc
	    response.etag = @article

	    # verificando se houve mudanças
	    if request.fresh?(response)
	      head :not_modified
	    else
	      respond_to do |wants|
	        # retornando conteúdo normalmente
	      end
	    end
	end

Note que estou atribuindo valores para `response.last_modified` e `response.etag`, e logo em seguinda usando o método `request.fresh?(response)` para determinar se houve alguma mudança ou não. Caso os dois cabeçalhos continuem iguais eu apenas retorno um status 304 e o browser do usuário usará o conteúdo que está armazenado no seu cache.

Quanto ao método `etag`, também podemos passar um **array** se for o caso:

	response.etag = [@article, current_user]

## Uma forma mais simples de usar ETags

Também ganhamos mais dois novos métodos que devem facilitar a forma como vamos implementar ETags. Os métodos `etag!` e `last_modified!`.

Veja a implementação destes métodos direto do código fonte do Rails:

	# Sets the Last-Modified response header. Returns 304 Not Modified if the
	# If-Modified-Since request header is <= last modified.
	def last_modified!(utc_time)
	  head(:not_modified) if response.last_modified!(utc_time)
	end

	# Sets the ETag response header. Returns 304 Not Modified if the
	# If-None-Match request header matches.
	def etag!(etag)
	  head(:not_modified) if response.etag!(etag)
	end

Isto facilita muito as coisas. Veja como ficaria o exemplo dado no tópico anterior usando estes novos métodos:

	class ArticlesController < ApplicationController
	  def show
	    @article = Article.find(params[:id])

	    etag! @article
	    last_modified! @article.published_at.utc
	  end
	end

Bem mais simples!
