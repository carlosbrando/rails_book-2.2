## Dando um nome para a variável local de uma coleção de partials

No código abaixo estamos usando uma **partial** com uma coleção de dados:

	render :partial => "admin_person", :collection => @winners

Dentro da **partial** podemos usar então a variável **admin\_person** para acessar os itens da coleção. Mas temos de concordar que este nome de variável é meio ruim.

Agora temos a opção de personalizar o nome desta variável usando a opção `:as`. Vamos alterar o exemplo acima:

	render :partial => "admin_person", :collection => @winners, :as => :person

Agora podemos acessar cada item da coleção usando a variável **person** que tem um nome mais intuitivo.

## Partials não vão mais definir as variáveis locais implicitamente

No exemplo abaixo estou renderizando uma partial, e não estou informando qual variável ela deve usar para preencher o conteúdo. Hoje o Rails encara que como tenho uma variável de instância com o mesmo nome, implicitamente é esta que deve ser usada.

	@customer = Customer.new("Carlos Brando")
	render :partial => "customer"

Isto funciona mas é um pouco arriscado. A partir do Rails 2.2, esta funcionalidade continua funcionando mas sempre emitindo uma aviso de que será por pouco tempo:

"@customer will no longer be implicitly assigned to customer"

Sim, este recurso será removido do Rails numa futura versão.
