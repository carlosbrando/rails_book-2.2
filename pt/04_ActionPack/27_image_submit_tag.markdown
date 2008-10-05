## Opção :confirm no método image\_submit\_tag

A opção `:confirm`, muito utilizada em helpers como o `link_to`, agora também está disponível para o método `image_submit_tag`.

Esta opção faz com que uma caixa de confirmação, com uma pergunta personalizada, seja exibida ao se clicar na imagem. Se o usuário aceitar, o formulário é enviado normalmente, caso contrário nada acontece.

	image_submit_tag("delete.gif", :confirm => "Are you sure?")
	# => <input type="image" src="/images/delete.gif" 
	#						onclick="return confirm('Are you sure?');"/>
