## Semplificare l'accesso alle risorse

I route annidati sono ormai un argomento ben consolidato in Rails. Quando create i vostri route, è usuale avere un codice del genere:

	map.resources :users do |user|
	  user.resources :posts do |post|
	    post.resources :comments
	  end
	end

Nel codice precedente stiamo esplicitando il fatto che i nostri users hanno dei posts, e questi posts hanno dei commenti. In accordo con tale impostazione dei route, possiamo accedere ai post di uno user utilizzando l'URL '**/users/1/posts**', oppure recuperare i commenti di un particolare post con l'URL '**/users/1/posts/5/comments**'.

Con la nuova opzione `:shallow => true` otteniamo maggiore flessibilità. Notate che aggiungendo tale opzione alla risorsa più esterna, tutte le altre risorse (annidate) ereditano questa caratteristica.

	map.resources :users, :shallow => true do |user|
	  user.resources :posts do |post|
	    post.resources :comments
	  end
	end

Con questa opzione abilitata, possiamo comunque continuare a recuperare i dati come di consueto. Il vantaggio risiede nel poter, ad esempio, recuperare tutti commenti di un post senza dover indicare lo user (es: '**/posts/2/comments**'). Oppure possiamo recuperare un determinato post utilizzando solamente '**/posts/2**'.

L'opzione `:shallow` funziona anche con risorse che usano `has_many` oppure `has_one`, come le seguenti:

	map.resources :users, :has_many => { :posts => :comments }, :shallow => true

Vengono creati anche tutti gli helper per accedere direttamente ai route:

	user_posts_path(@user) # => '/users/1/posts'
	posts_path # => '/posts'
	post_comments_path(@post) # => /posts/5/comments


## Definire route con array di verbi HTTP validi

Adesso è possibile passare un array di metodi a nuovi membri o collezioni di route. Ciò elimina la necessità di definire un route che accetti ogni verbo HTTP (`:any`) quando vogliamo che risponda solamente a qualche verbo. In Rails 2.2 possiamo dichiarare un route del genere così:

	map.resources :photos, :collection => { :search => [:get, :post] }
