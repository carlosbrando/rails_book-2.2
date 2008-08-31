## ActiveRecord

### Correção de uma colisão entre named\_scope e :joins.

Quando se usava `with_scope` junto com `:joins` todos os atributos da tabelas secundárias eram adicionados ao modelo da tabela principal.

### Partial updates não atualizavam o lock\_version se nada foi alterado.

Quando usávamos optimistic locking com partial updates, tinhamos queries extras quando na verdade elas não eram necessárias.
