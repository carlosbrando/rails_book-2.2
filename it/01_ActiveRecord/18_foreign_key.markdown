## Aggiornare un'associazione utilizzando le sue foreign key

Non sono sicuro che questo sia bug ma, a mio parere, ha causato problemi. Osservate il seguente codice, dove cerco di modificare un account utente utilizzando le sue foreign key in un progetto su Rails 2.1 (o anteriore):

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

Notate come io stia modificando l'account dell'utente (user), ma l'associazione non viene alterata. Anche dopo aver salvato l'oggetto `user`, se non viene ricaricato, l'associazione continuerà a mostrare l'account sbagliato.

Questo problema è stato risolto in Rails 2.2. Osserviamo:

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

Notate che modificando il `post` utilizzando le sue foreign key, l'associazione viene aggiornata automaticamente. 
