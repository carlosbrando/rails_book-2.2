## Meilleure performance dans les méthodes association\_id

Vous avez deux modèles, `Post` et `Comment`, où un post a plusieurs (`has_many`) commentaires ; si vous exécutez :

	Post.first.comment_ids
	
Rails utilisera la requête suivante pour récupérer les *id* :

	SELECT * FROM `comments` WHERE (`comments`.post_id = 1)

Mais dans ce cas nous n'avons pas besoin des objets complets. La requête suivante suffirait et serait plus performante :

	SELECT `comments`.id FROM `comments` WHERE (`comments`.post_id = 1)

Le code de Rails a été modifié pour `has_many` et `has_many :through` et comporte cette amélioration.
