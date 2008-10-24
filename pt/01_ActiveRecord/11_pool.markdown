## Pool de Conexões no Rails

Algo que muita gente reclama sobre o Rails é que ele é lento. Sabemos que isto não é totalmente verdade, mas também sabemos que muita coisa pode ser feita para melhorar a performance dele.

Uma destas coisas acabou de se feita. Foi incluído ao Rails um **Pool de Conexões** com o banco de dados.

Toda vez que uma requisição ao banco de dados é feita, perde-se algum tempo criando uma nova conexão e só depois é que a pesquisa ou gravação é realizada. Olhando superficialmente pode parecer algo muito rápido e simples, mas abrir uma conexão com o banco de dados não é tão simples assim. É necessário estabelecer uma conexão física com o servidor do banco, autenticar a conexão e realizar mais uma série de validações. Tudo isto consome recursos e tempo. Após criar esta conexão, o Rails a usa para todas as requisições necessárias, e queries mais pesadas podem atrasar a execução de outras requisições. Isto explica muito bem o porque de o banco de dados se tornar o vilão de alguns grandes projetos criados em Rails.

A solução para este tipo de problema é criar um pool de conexões com o banco de dados e distribuir as requisições feitas entre estas conexões.

O processo é o seguinte: Uma conexão com o banco de dados é aberta e utilizada para realizar uma pesquisa. Depois disso, ao invés de fecha-la, ela é armazena no pool de conexões. Quando uma outra requisição é feita, ao invés de abrir uma nova conexão, o sistema reaproveita uma que já foi aberta, diminuindo o tempo e os recursos necessários para realizar a tarefa. Várias conexões podem ser armazenadas no pool ao mesmo tempo e as requisições serão distribuídas entre elas. Isto significa que mesmo com uma querie lenta sendo executada no banco de dados, a aplicação continuará recebendo e executando outras queries usando as demais conexões armazenadas no pool.

No Rails será criado um novo pool para cada execução do método `establish_connection`. Em outras palavras, cada banco de dados cadastrado no arquivo **database.yml** terá seu próprio pool de conexões.

O pool começa vazio e vai crescendo até o limite de 5 conexões (padrão), mas você pode aumentar este limite acrescentando a opção `pool` na configuração do banco de dados.

	development:
	  adapter: mysql
	  host: localhost
	  username: myuser
	  password: mypass
	  database: somedatabase
	  pool: 10
	  wait_timeout: 15

Se nenhuma das conexões estiver disponível, uma thread irá esperar durante 5 segundos (padrão) antes de desistir de esperar por uma conexão. Este tempo também pode ser configurado adicionando a chave `wait_timeout` na configuração do banco de dados.

Se você desejar usar o pool de conexões fora do `ActionPack`, existe o método `ActiveRecord::Base.connection_pool` que permite que você manualmente faça o checkout/checkin das conexões. Não esqueça de fazer o checkin quando terminar de usar a conexão.

	connection = ActiveRecord::Base.connection_pool.checkout

	# faz alguma coisa no banco de dados

	ActiveRecord::Base.connection_pool.checkin(connection)

Você também pode usar o método `ActiveRecord::Base.connection_pool.with_connection` que já faz o checkout/checkin automaticamente para você, tornando-se uma opção mais segura.

	ActiveRecord::Base.connection_pool.with_connection do |connection|
	  # faz alguma coisa no banco de dados
	end
