## Dando um nome para a variável local de uma coleção de partials

No código abaixo estamos usando uma **partial** com uma coleção de dados:

	render :partial => "admin_person", :collection => @winners

Dentro da **partial** podemos usar então a variável **admin\_person** para acessar os itens da coleção. Mas temos de concordar que este nome de variável é meio ruim.

Agora temos a opção de personalizar o nome desta variável usando a opção `:as`. Vamos alterar o exemplo acima:

	render :partial => "admin_person", :collection => @winners, :as => :person

Agora podemos acessar cada item da coleção usando a variável **person** que tem um nome mais intuitivo.
