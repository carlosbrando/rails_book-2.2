## Debug no console do Rails

Da mesma forma como temos o `script/server --debugger`, agora também temos o `script/console --debugger`. Esta opção basicamente carrega a biblioteca **ruby-debug** ao iniciar o console.

É mais fácil usar esta opção do que executar um `require 'ruby-debug'` no console toda vez que precisar deste recurso.
