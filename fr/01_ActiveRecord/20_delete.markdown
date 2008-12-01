## Nouvelle méthode Model#delete

Une nouvelle méthode a été créée pour rendre `ActiveRecord` plus cohérent : `Model#delete`. Elle est similaire à la méthode de classe du même nom. Contrairement à la méthode `destroy`, la méthode `delete` efface l'enregistrement en base de données sans appeler les méthodes *callback* telles que `before_destroy` et `after_destroy`.

Cette méthode ignore aussi les contraintes comme `:dependent`.

	client = Client.find(1)
	client.delete