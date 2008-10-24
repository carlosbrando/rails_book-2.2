## ActiveRecord

### Correção de uma colisão entre named\_scope e :joins.

Quando se usava `with_scope` junto com `:joins` todos os atributos da tabelas secundárias eram adicionados ao modelo da tabela principal.

### Método find\_all falhando no named\_scope

Quando você executava o método `find_all` em um `named_scope` o método não estava sendo direcionado para o `proxy_found` conforme o esperado. Isto fazia com que um erro `NoMethodError` fosse retornado.

	Topic.base.find_all(&:approved)
	# => NoMethodError: undefined method `find_all' for #<Class:0x19a0fb4>

Este problema podia ser contornado usando o método `to_a`:

	Topic.base.to_a.find_all(&:approved)
	# => [#<Reply:0x179e720>#<Topic:0x179e388>#<Reply:0x179e20c>]

Nesta versão do Ruby on Rails isto já foi resolvido.

### Partial updates não atualizavam o lock\_version se nada foi alterado.

Quando usávamos optimistic locking com partial updates, tínhamos queries extras quando na verdade elas não eram necessárias.
