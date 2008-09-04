## Opção :index funcionando no fields\_for

Muitas vezes a opção `:index` do método `select` pode ser útil, como por exemplo quando se precisa criar diversos dropdowns dinamicamente em uma página.

Até agora o método `fields_for` não repassava esta opção para métodos como `select`, `collection_select`, `country_select` e `time_zone_select`, o que limitava o seu uso em determinados casos.

Isto já foi corrigido nesta versão do Rails. Por exemplo, apenas para efeito de teste veja o código abaixo e o seu retorno:

	fields_for :post, @post, :index => 108 do |f|
	  concat f.select(:category, %w( abe <mus> hest))
	end

	<select id=\"post_108_category\" name=\"post[108][category]\">
	  <option value=\"abe\">abe</option>
	  <option value=\"&lt;mus&gt;\" selected=\"selected\">&lt;mus&gt;</option>
	  <option value=\"hest\">hest</option>
	</select>
