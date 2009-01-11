## L'option :index fonctionne maintenant dans fields\_for

L'option `:index` de la méthode `select` est souvent utile, par exemple quand vous voulez créer dynamiquement plusieurs contrôles select dans une même page.

Jusqu'à maintenant, la méthode `fields_for` ne repassait pas cette option aux méthodes comme `select`, `collection_select`, `country_select` et `time_zone_select`, ce qui limitait son utilité à certains cas.

Cela a été corrigé dans cette version de Rails. Voyez ce code par exemple&nbsp;:

	fields_for :post, @post, :index => 108 do |f|
	  concat f.select(:category, %w( abe <mus> hest))
	end

Il renverra&nbsp;:

	<select id=\"post_108_category\" name=\"post[108][category]\">
	  <option value=\"abe\">abe</option>
	  <option value=\"&lt;mus&gt;\" selected=\"selected\">&lt;mus&gt;</option>
	  <option value=\"hest\">hest</option>
	</select>

Notez que j'utilise l'option `:index => 108` dans la méthode `fields_for`. Jetez un coup d'oeil aux propriétés `id` et `name` du tag construit par la méthode `select`. Bien qu'aucune option n'ait été passée à cette méthode, l'index est intégré dans les tags.
