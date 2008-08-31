## Suporte ao Thin melhorado no Rails

O `script/server` agora verifica a disponibilidade do **Thin** e o usa. Muito conveniente se vocês estiver usando **Thin** no seu ambiente de produção (e quiser rodar o mesmo em desenvolvimento). Você deve acrescentar a seguinte linha no seu arquivo **environment.rb** para que isto funcione.

	config.gem 'thin'
