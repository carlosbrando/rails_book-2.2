## Tornando atributos do ActiveRecord privados

No Rails 2.2 você poderá definir atributos do `ActiveRecord` como `private`. Como estes atributos são criados via metaprogramação, até agora isto era impossível.

Para entender como isto funcionará, vamos tornar o atributo `name` da classe `User` privado:

	class User < ActiveRecord::Base

	  private
	  def name
	    "I'm private"
	  end

	end

Agora ao tentar recuperar o valor do atributo `name`:

	user = User.first
	# => #<User id: 1, name: "teste", created_at: "2008-09-26 21:55:23", updated_at: "2008-09-26 21:55:23">

	user.name
	# => NoMethodError: undefined method `NoMethodError' for #<User:0x234df08>
	#    from /Users/carlosbrando/Projects/sandbox/edge/vendor/rails/activerecord/lib/active_record/attribute_methods.rb:260:in `method_missing'
	#    from /Users/carlosbrando/Projects/sandbox/edge/vendor/rails/activerecord/lib/active_record/attribute_methods.rb:236:in `method_missing'
	#    from (irb):3

Veja que uma exceção `NoMethodError` foi disparada ao executar o método que agora é privado. Por outro lado eu posso alterar o nome do usuário, já que o método `name=` é ainda público.

	user.name = "Carlos"
	# => "Carlos"
