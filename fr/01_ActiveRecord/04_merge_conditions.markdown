## La méthode merge\_conditions d'ActiveRecord est maintenant publique

La méthode `merge_conditions` d'`ActiveRecord` est maintenant publique, ce qui signifie qu'elle sera disponible dans tous vos modèles.

Tout est dans le nom : la méthode combine en une seule les multiples `conditions` passées en paramètre.

	class Post < ActiveRecord::Base
	end

	a = { :author => 'Carlos Brando' }
	b = [ 'title = ?', 'Edge Rails' ]

	Post.merge_conditions(a, b)
	# => "(\"posts\".\"author\" = 'Carlos Brando') AND (title = 'Edge Rails')"

Note : les `conditions` sont toujours combinées avec **AND**.
