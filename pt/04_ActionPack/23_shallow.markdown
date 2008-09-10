## Simplificando o acesso aos resources

Rotas aninhadas já não é mais novidade. Ao configurar nossas rotas é comum codificarmos algo mais ou menos assim:

	map.resources :users do |user|
	  user.resources :posts do |post|
	    post.resources :comments
	  end
	end

No código acima estou deixando claro que meus usuários tem posts, que por sua vez tem comentários. Da forma como minhas rotas estão configuradas posso recuperar os posts de um usuário através da url '**/users/1/posts**'. Ou recuperar os comentários de um determinado post através da url '**/users/1/posts/5/comments**'.

Com a nova opção `:shallow => true`, ganhamos mais flexibilidade. Note que ao adicionar esta opção no primeiro resource, todos os outros que estiverem abaixo dele herdarão esta característica.

	map.resources :users, :shallow => true do |user|
	  user.resources :posts do |post|
	    post.resources :comments
	  end
	end

Com esta opção habilitada eu posso continuar recuperando dados da mesma forma como fazia antes. A vantagem é que agora eu também posso recuperar todas os comentários de um post sem precisar informar o usuário, através da url '**/posts/2/comments**'. Ou recuperar um determinado post usando apenas a url '**/posts/2**'.

A opção `:shallow` também funciona em recursos que estão usando as notações `has_many` ou `has_one`, por exemplo:

	map.resources :users, :has_many => { :posts => :comments }, :shallow => true

Todos os helpers para acessar as rotas diretamente também são criados, como:

	user_posts_path(@user) # => '/users/1/posts'
	posts_path # => '/posts'
	post_comments_path(@post) # => /posts/5/comments
