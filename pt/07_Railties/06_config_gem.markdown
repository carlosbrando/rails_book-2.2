## Fazendo o config.gem não carregar o gem

Uma das novidades introduzidas no Rails 2.1 foi o `config.gem`, que nos permitia configurar de quais gems nosso projeto era dependente.

Com isto ganhamos diversas tarefas que facilitaram nosso trabalho, como o `rake gems:install` que instala todas as dependências automaticamente.

Mas tínhamos de tomar alguns cuidados ao configurar as dependências, porque em alguns casos o nome da gem não é necessariamente o nome da biblioteca que o método `require` precisa carregar. Por exemplo, a gem **aws-s3** deve ser carregada com o nome **aws/s3**, trocando o traço por uma barra invertida. Prevendo este tipo de coisa, foi incluído no `config.gem` a opção `:lib`. Veja como ficaria o caso acima:

	config.gem 'aws-s3', :lib => 'aws/s3'

Depois de um tempo surgiu um outro problema, meu projeto depende desta gem, mas eu não quero que ela seja carregada neste momento. Como fazer?

Até agora nada, mas nesta nova versão podemos configurar a opção `:lib` como `false` e isto fará com que o Rails não carregue a gem.

	config.gem 'aws-s3', :lib => false

Mesmo sem carregá-la ela ainda será instalada caso você execute a tarefa `rake gems:install` e estará incluída em qualquer outra tarefa relacionada a gems.
