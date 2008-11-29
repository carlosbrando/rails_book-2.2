## Indiquer une autre clef primaire dans les associations

L'option `:primary_key` a été ajoutée aux méthodes `has_many` et `has_one`.

Grâce à cette option, vous pouvez définir quelle méthode du modèle associé renverra la clef primaire qui sera utilisée dans l'association. La clef primaire par défaut est bien sûr `id`.

Voyez cet exemple :

	has_many :clients_using_primary_key, :class_name => 'Client',
		:primary_key => 'name', :foreign_key => 'firm_name'

La méthode `has_one` fonctionne exactement comme expliqué ci-dessus.