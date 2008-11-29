## Nouvelle version destructive des méthodes find d'ActiveRecord

Les méthodes de recherche dynamiques (*dynamic finders*) ont maintenant leur contrepartie qui signale une exception quand l'ensemble résultat est vide, au lieu de renvoyer `nil` comme la version d'origine.

Pour utiliser ces méthodes, ajoutez simplement un point d'exclamation (*bang*) au nom de la méthode. Voici un exemple :

	Topic.find_by_title!("Le premier chapitre !")
	# => ActiveRecord::RecordNotFound
