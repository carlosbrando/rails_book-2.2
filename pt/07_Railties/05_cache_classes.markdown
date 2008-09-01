## cache\_classes agora estará ligado por padrão

Nos arquivos de configuração do seu projeto provavelmente deve haver uma linha assim:

	config.cache_classes = false

Esta linha informa ao Rails que ele não deve fazer cache do código de seu projeto, ou seja, para cada requisição feita ele carregará o código novamente. Embora isto torne a execução de seu código mais lenta, é ótimo para o ambiente de desenvolvimento, assim você não precisa ficar recarregando o seu servidor web a cada alteração.

Em produção é importantíssimo que você deixe isto ligado.

Em projetos Rails 2.1, caso a linha acima não se encontre em seus arquivos de configuração, o Rails assumirá que não deve fazer o cache, esta era a condição padrão.

No Rails 2.2 isto foi invertido, caso nenhuma configuração seja encontrada ele assumirá que deve fazer o cache. Isto ajudará os inexperientes que colocam seus projetos em produção sem configurá-lo corretamente.
