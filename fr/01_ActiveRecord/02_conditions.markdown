## La nouvelle façon de spécifier les conditions de requête avec un hash

Dans les requêtes de base de données, il fallait parfois utiliser l'option `:joins`, soit pour améliorer la performance, soit pour extraire des données dépendant de plusieurs tables.

Par exemple, pour sélectionner tous les utilisateurs ayant acheté des objets rouges, vous pouviez faire ceci :

	User.all :joins => :items, :conditions => ["items.color = ?", 'red']

La syntaxe est un peu étrange, puisqu'il fallait inclure le nom de la table (ici **items**) dans une chaîne de caractères.

Il y a une nouvelle façon de faire en Rails&nbsp;2.2, en utilisant une clef de hash pour identifier la table :

	User.all :joins => :items, :conditions => {
	  :age => 10,
	  :items => { :color => 'red' }
	}

	# un autre exemple peut-être plus clair
	User.all :joins => :items, :conditions => {
	  :users => { :age => 10 },
	  :items => { :color => 'red' }
	}

À mon avis, le code est plus clair ainsi, en particulier quand cumule les conditions de nombreux champs de plusieurs tables.

Souvenez-vous que la clef à utiliser est le nom de la table (au pluriel) ou l'alias si vous l'avez spécifié dans la requête.
