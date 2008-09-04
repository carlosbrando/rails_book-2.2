## Ligando e desligando carga de dependências

Um novo parâmetro de inicialização foi adicionado ao Rails, afim de ligar ou desligar a carga de novas classes durante uma requisição.

	config.dependency_loading = true
	# ou
	config.dependency_loading = false

Se `dependency_loading` for verdadeiro, durante uma requisição o Rails estará apto a carregar em memória qualquer classe que não tenha sido inicialmente carregada durante a inicialização do projeto. Caso ele seja falso, estas classes serão ignoradas.

Se você for executar seu projeto em um ambiente de threads concorrentes deve desabilitar esta opção e carregar todas estas classes usando eager load ou através do método `require` na inicialização do sistema.
