## Pool de connexions

Beaucoup de gens se plaignent de la lenteur de Rails. Nous savons que ce n'est pas totalement vrai, mais beaucoup de choses peuvent être faites pour améliorer les performances de Rails.

Et quelque chose a été fait : un *pool* de connexions a été ajouté.

Chaque fois qu'une requête est passée, du temps est perdu à ouvrir une nouvelle connexion avant que les données puissent être récupérées ou enregistrées. Cela peut paraître facile à première vue, mais l'ouverture d'une connexion à la base de données n'est pas si simple. Il faut ouvrir une connexion réseau avec le serveur de base de données, effectuer l'authentification et faire des vérifications. Tout ceci consomme des ressources et du temps. Après avoir créé cette connexion, Rails l'utilise pour toutes les requêtes applicables, et les requêtes les plus lourdes peuvent retarder l'exécution d'autres requêtes. Cela peut faire de la base de données le talon d'Achille de certains gros projets Rails.

La solution à ce problème est de créer un *pool* de connexions et de répartir les requêtes entre ces connexions.

Le processus est le suivant : une connexion avec la base de données est ouverte et utilisée pour exécuter une requête. Ensuite, au lieu d'être fermée, la connexion est stockée dans le *pool*. Quand une autre requête est exécutée, le système utilise une connexion déjà créée, ce qui diminue le temps et les ressources nécessaires à la tâche. Plusieurs connexions peuvent être stockées simultanément et les requêtes sont réparties entre elles. Cela signifie qu'une requête longue (*slow query*) peut être en cours d'exécution alors que l'application continue à traiter des requêtes avec les autres connexions du *pool*.

Rails crée un nouveau *pool* chaque fois que la méthode `establish_connection` est invoquée. En d'autres mots, chaque base de données listée dans **database.yml** aura son propre *pool* de connexion.

Le *pool* est vide au départ et grossit jusqu'à la limite par défaut de cinq connexions, mais vous pouvez augmenter le défaut en ajoutant l'option `pool` dans la configuration de la base de données :

	development:
	  adapter: mysql
	  host: localhost
	  username: myuser
	  password: mypass
	  database: somedatabase
	  pool: 10
	  wait_timeout: 15

Si aucune connexion n'est disponible, un processus attendra une connexion cinq secondes avant d'abandonner. Cette période est configurable avec l'option `wait_timeout` dans la configuration de la base.

Si vous voulez utiliser les *pools* de connexion en dehors d'`ActionPack`, vous disposez de la méthode `ActiveRecord::Base.connection_pool` qui vous permet la réservation (*check in*) et la libération (*check out*) manuelles des connexions du *pool*. N'oubliez pas de libérer la connexion après l'avoir utilisée.

	connection = ActiveRecord::Base.connection_pool.checkout
	
	# faire des opérations dans la base
	
	ActiveRecord::Base.connection_pool.checkin(connection)

Vous pouvez aussi utiliser la méthode `ActiveRecord::Base.connection_pool.with_connection`, qui fait la réservation et la libération automatiquement, ce qui est plus sûr.

	ActiveRecord::Base.connection_pool.with_connection do |connection|
	  # faire des opérations dans la base
	end
