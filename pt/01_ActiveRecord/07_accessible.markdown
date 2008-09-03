## Usando a opção :accessible para fazer atribuições em massa no ActiveRecord

Todos os métodos de associações do **ActiveRecord** (`belongs_to`, `has_one`, `has_many` e `has_and_belongs_to_many`) receberam um nova opção que permite a atribuição de valores para suas associações usando **hashes** aninhados.

Vamos pegar como exemplo um modelo chamado **Post**:

	class Post < ActiveRecord::Base
	  belongs_to :author, :accessible => true
	  has_many :comments, :accessible => true
	end

Note que logo após associar este modelo com **author** e **comments** estou definindo a nova opção `:accessible` como `true` (verdadeiro). Com esta opção "ligada" eu posso fazer algo assim:

	post = Post.create({
	  :title => 'Accessible Attributes',
	  :author => { :name => 'David Dollar' },
	  :comments => [
	    { :body => 'First Post!' },
	    { :body => 'Nested Hashes are great!' }
	  ]
	})

Veja que estou criando todas as associações usando apenas um único **hash** com sub-níveis para cada associação. Isto não era possível de forma automática no Rails.

Eu também poderia fazer algo assim, para adicionar um novo comentário:

	post.comments << { :body => 'Another Comment' }
