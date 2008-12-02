## Opzione :index per fields\_for

Spesso, l'opzione `:index` del metodo `select` è molto utile, ad esempio quando occorre creare più select dinamiche su una singola pagina.

Fino ad ora, il metodo `fields_for` non inoltrava questa opzione ai metodi `select`, `collection_select`, `country_select` e `time_zone_select`, limitandone l'utilità in alcuni casi.

Nella corrente versione di Rails questo è stato corretto. Esempio:

	fields_for :post, @post, :index => 108 do |f|
	  concat f.select(:category, %w( abe <mus> hest))
	end

Restituisce:

	<select id=\"post_108_category\" name=\"post[108][category]\">
	  <option value=\"abe\">abe</option>
	  <option value=\"&lt;mus&gt;\" selected=\"selected\">&lt;mus&gt;</option>
	  <option value=\"hest\">hest</option>
	</select>

Notate che abbiamo utilizzato l'opzione `:index => 108` nel metodo `fields_for`. Osservate le proprietà `id` e `name` del tag HTML generato dal metodo `select`: benché nessuna opzione sia stata passata a questo metodo, è stato comunque aggiunto l'opportuno indice all'output.
