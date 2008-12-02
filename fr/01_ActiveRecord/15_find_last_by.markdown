## Une nouvelle méthode *find*

Augmentant le nombre méthodes *find* d'`ActiveRecord`, nous avons maintenant `find_last_by` en plus des célèbres `find_by` et `find_all_by`.

En plus d'être simple, elle offre un moyen beaucoup pluys élégant de récupérer, par exemple, le dernier commentaire d'un utilisateur :

	Comment.find_last_by_author("Carlos Brando")
	
		# fait la même chose que
	
	Comment.last(:conditions => { :author => "Carlos Brando" })