## Nommage de la variable locale dans une collection de partials

Dans le code ci-dessous, un `partial` est utilisé avec une collection d'objets&nbsp;:

	render :partial => "admin_person", :collection => @winners

Il est possible, dans le `partial`, d'utiliser la variable `admin_person` pour accéder aux éléments de la collection. Mais cette convention de nommage est plutôt douteuse.

Vous pouvez maintenant choisir le nom de cette variable avec l'option `:as`. Réécrivons ce dernier exemple&nbsp;:

	render :partial => "admin_person", :collection => @winners, :as => :person

Maintenant nous pouvons accéder à chaque item de la collection en utilisant la variable `person `qui a un nom plus intuitif.

## Les partials ne définissent plus les variables locales implicitement

Dans l'exemple ci-dessous, j'interprète un partial sans indiquer quelle variable doit être remplie dans le contenu. Rails supposait auparavant qu'il fallait utiliser la variable d'instance du même nom que le partial.

	@customer = Customer.new("Carlos Brando")
	render :partial => "customer"

Ça marche mais c'est un peu risqué. À partir de Rails 2.2, la fonctionnalité marche encore mais émet un warning&nbsp;:

"@customer will no longer be implicitly assigned to customer"

Cette fonction sera supprimée dans le futur.