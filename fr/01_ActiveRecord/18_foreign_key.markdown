## Mettre à jour une association via sa clef étrangère

Je ne sais pas si c'est un bug ou pas, mais à mon avis c'est un problème. Regardez le code ci-dessous, dans lequel je tente de modifier le compte  (*account*) d'un utilisateur (*user*) via sa clef étrangère dans un projet Rails&nbsp;2.1 ou antérieur.

	class User < ActiveRecord::Base
	  belongs_to :account
	end

	user = User.first
	# => #<User id: 1, login: "admin", account_id: 1>

	user.account
	# => #<Account id: 1, name: "My Account">

	user.account_id = 2
	# => 2

	user.account
	# => #<Account id: 1, name: "My Account">

Vous remarquez que je modifie le compte de l'utilisateur mais que l'association n'a pas été mise à jour. Même après avoir enregistré l'objet `user`, s'il n'est pas rechargé en mémoire, l'association continue à montrer le mauvais compte.

Ce comportement a été corrigé en Rails&nbsp;2.2 :

	class Comment < ActiveRecord::Base
	  belongs_to :post
	end

	comment = Comment.first
	# => #<Comment id: 1>

	>> comment.post
	# => #<Post id: 1>

	>> comment.post_id = 2
	# => 2

	>> comment.post
	# => #<Post id: 2>

Vous remarquez qu'après la modification du `post` via sa clef étrangère, l'association est mise à jour automatiquement.
