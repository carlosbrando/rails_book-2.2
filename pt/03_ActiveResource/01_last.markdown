## Recuperando o último registro do ActiveResource

Seguindo o padrão do `ActiveRecord`, também foi adicionado ao método `find` do `ActiveResource` a opção `:last`.

	Person.find(:last, :from => :managers)
	# => GET /people/managers.xml

Desta forma podemos recuperar o último recurso encontrado.
