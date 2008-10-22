## Cookie de sessão agora é Http Only

Ao se criar um cookie existe uma opção esquecida por muita gente. A opção `http_only` faz com que o cookie somente seja acessível via HTTP, impedindo que um trecho de código em javascript consiga acessá-lo. O valor padrão para esta opção é `false`.

No Rails 2.2 o cookie que armazena a sessão do usuário terá a opção `http_only` ligada por padrão. A intenção é aumentar a segurança em nossos projetos. Obviamente esta opção pode ser desligada caso necessário. Se este for o caso, basta incluir a seguinte linha no `ApplicationController` ou em um controller especifico:

	session :session_http_only => false
