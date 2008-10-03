## Atualizando uma associação através de sua foreign key

Não sei dizer se isto é um bug ou não, mas na minha opinião isto representa um problema. Veja o código abaixo, onde tento alterar a conta de um usuário usando sua foreign key em um projeto Rails 2.1 ou anterior:

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

Note que estou alterando a conta do usuário, mas a associação não foi atualizada. Mesmo depois de salvar o objeto `user`, se ele não for recarregado, a associação continuará mostrando a conta errada.

No Rails 2.2 este problema foi corrigido, veja:

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

Veja que ao alterar o `post` por meio de sua foreign key, automaticamente a associação foi atualizada.
