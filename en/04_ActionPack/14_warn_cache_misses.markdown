## Recebendo alertas para melhoria de desempenho

O Rails recebeu mais um parâmetro de configuração que faz com que ele emita um alerta caso esteja renderizando um template fora do diretório especificado para views. Isto é muito bom já que arquivos fora dos diretórios especificados para views não são armazenados em cache o que resulta em mais operações no disco.

Para começar a receber os avisos basta incluir a seguinte linha no arquivo **environment.rb** do projeto:

	config.action_view.warn_cache_misses = true

Fazendo isto a seguinte mensagem aparecerá caso algum arquivo fora dos diretórios configurados seja renderizado:

`[PERFORMANCE] Rendering a template that was
not found in view path. Templates outside the view path are
not cached and result in expensive disk operations. Move this
file into /Users/user/project/app/views or add the folder to your
view path list`

Esta configuração está desligada como padrão.
