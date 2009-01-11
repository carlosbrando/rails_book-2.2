## Nouvelle option :layout pour la méthode caches\_action

Un  option nommée :layout a été ajoutée à la méthode `caches_action`.

	class ListsController < ApplicationController
	  ...

	  caches_action :index, :layout => false

	  ...
	end

Dans l'exemple ci-dessus, j'ai spécifié `:layout => false`, qui signifie que seul le contenu de l'action et non son layout sera enregistré en cache. C'est très utile quand on a des éléments dynamiques dans le contenu (ce qui arrive souvent).

Si vous ne spécifiez rien, le comportement restera le même qu'avant&nbsp;, de même que pour  `true`.

## Templates dans le cache

Pour améliorer les performances de Rails, les pages de template seront automatiquement enregistrées en cache dans l'environnement de production.

Autrement dit, si vous modifiez un template en production, il faudra relancer le serveur pour que la modification ait un effet.
