## Activation et désactivation du chargement des dépendances

Un nouveau paramètre d'initialisation a été ajouté à Rails ; il active ou désactive le chargement des nouvelles classes pendant une requête.

	config.dependency_loading = true
	# or
	config.dependency_loading = false

Mettre `dependency_loading` à `true` provoquera, lors d'une requête, le chargement de nouvelles classes qui n'ont pas été chargées pendant la phase d'initialisation. Ce comportement est désactivé à  `false`.

Désactivez cette option si vous voulez exécuter votre projet dans un environnement à processus légers (*threaded environment*) et pré-chargez toutes vos classes à l'initialisation.
