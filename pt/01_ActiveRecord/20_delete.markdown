## Novo método de instância Model#delete

Para tornar o `ActiveRecord` mais consistente foi adicionado o método de instância `Model#delete`. Ele é similar ao método de classe com o mesmo nome. O método `delete`, diferente do método `destroy`, apaga o registro do banco de dados sem disparar callbacks, como o `before_destroy` e o `after_destroy`.

Este método também não aplicará nenhuma das regras impostas na associação através de cláusulas como `:dependent`.

	client = Client.find(1)
	client.delete
