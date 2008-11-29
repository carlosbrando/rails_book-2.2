## Nouvelle option :from pour les fonctions d'agrégation d'ActiveRecord

Il y a une nouvelle option pour les fonctions d'agrégation d'`ActiveRecord` (`count`, `sum`, `average`, `minimum` and `maximum`).

En utilisant l'option `:from`, vous pouvez supplanter le nom de la table choisi par `ActiveRecord`. Ça ne semble pas très utile au premier abord, mais une possibilité intéressante est de forcer MySQL à utiliser un index spécifique.

Voyez ces exemples :

	# Force MySQL à utiliser un index pour l'agrégation
	Edge.count :all, :from => 'edges USE INDEX(unique_edge_index)',
	           :conditions => 'sink_id < 5')

	# Agréger avec une table autre aue celle associée à la classe
	Company.count :all, :from => 'accounts'