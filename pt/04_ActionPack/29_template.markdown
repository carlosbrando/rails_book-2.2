## Caminho completo da view no caso de uma exceção

Quando uma exceção é dispara recebemos em nossa view uma mensagem semelhante a esta:

	NoMethodError in Administration/groups#show
	Showing app/views//_list.erb where line ...

Quando na verdade deveríamos receber uma mensagem com o caminho completo do arquivo que disparou o erro, assim:

	NoMethodError in Administration/groups#show
	Showing app/views/administration/reports/_list.erb where line ...

Este problema já está corrigido nesta nova versão do Rails, facilitando nosso trabalho.
