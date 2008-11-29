## L'option :limit spécifie la taille en octets

À partir de cette version de Rails, l'option `:limit` spécifie la taille en octets des colonnes de type *integer* de MySQL et PostgreSQL (c'était déjà le cas pour SQLite).

Le type de colonne utilisé dans la base dépend du nombre d'octets spécifié. Voici le code qui détermine le type de colonne dans MySQL :

	when 1; 'tinyint'
	when 2; 'smallint'
	when 3; 'mediumint'
	when nil, 4, 11; 'int(11)' # compatibility with MySQL default
	when 5..8; 'bigint'
	else raise(ActiveRecordError, "No integer type has byte size #{limit}")

Et pour PostgreSQL :

	when 1..2; 'smallint'
	when 3..4, nil; 'integer'
	when 5..8; 'bigint'
