## Récupérer le dernier enregistrement avec ActiveResource

Suivant le modèle d'`ActiveRecord`, la méthode find d'`ActiveResource` accepte maintenant l'option `:last`&nbsp;:

	Person.find(:last, :from => :managers)
	# => GET /people/managers.xml

Vous pouvez ainsi récupérer la dernière ressource trouvée.
