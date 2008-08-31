## Método merge\_conditions do ActiveRecord agora é público

O método `merge_conditions` do **ActiveRecord** agora é um método público, o que significa que ele estará presente em todas os seus **Models**.

Este método faz exatamente o que o nome diz. Você pode informar várias **conditions** separadas em seus parâmetros e ele junta tudo em uma condition só. Por exemplo:

	class Post < ActiveRecord::Base
	end

	a = { :author => 'Carlos Brando' }
	b = [ 'title = ?', 'Edge Rails' ]

	Post.merge_conditions(a, b)
	# => "(\"posts\".\"author\" = 'Carlos Brando') AND (title = 'Edge Rails')"

Note que ele une as **conditions** com um **AND**, sempre.
