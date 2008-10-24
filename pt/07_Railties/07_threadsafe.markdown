## threadsafe!

Foi incluído no Rails um novo método de configuração para ligar o threaded mode.

	config.threadsafe!

Ao executar este método em seu arquivo de configuração (normalmente no **environments/production.rb**), você estará fazendo com que as actions de um controller aceitem requisições concorrentes e múltiplas conexões com o banco de dados. E dependendo da infraestrutura do seu servidor você poderá receber mais requisições enquanto mantém menos cópias do Rails em memória.

Ele também desliga o carregamento de dependências após a inicialização. Para mais detalhes sobre isto veja o tópico "Ligando e desligando carga de dependências" no capítulo de **ActiveSupport**.
