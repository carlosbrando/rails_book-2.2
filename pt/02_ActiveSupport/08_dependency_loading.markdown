## Ligando e desligando carga de dependências

Se você desejar permitir ou restringir a carga de dependências durante o ciclo de um requisição, pode fazer uso de um novo parâmetro de configuração.

	config.dependency_loading = true
	# ou
	config.dependency_loading = false

Se `dependency_loading` for alterado para `true` (verdadeiro) ele permitirá que novas classes sejam carregadas durante uma requisição. Alterando para `false` (falso) este comportamento será desativado.

Se você quiser rodar seu projeto em um ambiente que permita concorrências, deve desabilitar esta opção e carregar (usando `require`, por exemplo) todas as suas dependências nos arquivos de inicialização.

Se a opção `cache_classes` estiver desabilitada, a carga de dependências estará sempre ligada.
