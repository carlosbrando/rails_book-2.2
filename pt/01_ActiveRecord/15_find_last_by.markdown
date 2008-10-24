## Mais um finder dinâmico

Aumentando o número de finders dinâmicos do `ActiveRecord`, agora temos o `find_last_by`. Já tínhamos os famosos `find_by` e o `find_all_by`.

Além de simplificar, ficou muito mais elegante recuperar o último comentário feito por um usuário, por exemplo. Veja:

	Comment.find_last_by_author("Carlos Brando")

	# é a mesma coisa que
	
	Comment.last(:conditions => { :author => "Carlos Brando" })
