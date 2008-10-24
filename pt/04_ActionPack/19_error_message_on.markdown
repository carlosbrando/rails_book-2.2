## Alteração no método error\_message\_on

O método `error_message_on` é extremamente útil. Com ele podemos exibir mensagens de erro retornadas por determinados métodos em um objeto de uma forma bem simples.

	<%= error_message_on "post", "title" %>

	<!-- ou -->

	<%= error_message_on @post, "title" %>

Isto fará com que uma mensagem de erro seja exibida na sua página dentro de uma tag DIV, caso um erro esteja associado ao campo title do modelo post.

Mas o mais interessante do método `error_message_on` é que podemos personaliza-lo para que exibida mensagens mais amigáveis. E é aqui que entra a alteração para o Rails 2.2.

Na versão atual os parâmetros de personalização são passadas diretamente para o método, mas no Rails 2.2 serão passadas via um `Hash` de opções:

	<%= error_message_on "post", "title",
	      :prepend_text => "Title simply ",
	      :append_text => " (or it won't work).",
	      :css_class => "inputError" %>

Fique tranqüilo quanto a uma possível migração de seus projetos atuais, pois o código está preparado para funcionar também da forma antiga (pelo menos por um tempo), mas emitindo um aviso de alerta para que o código seja atualizado.

## Mais métodos atualizados para receber Hashes de opções

Os seguintes métodos também foram alterados para aceitarem seus argumentos na forma de um `Hash` de opções, tornando o código mais legível e facilitando a manutenção.

### truncate

	truncate("Once upon a time in a world far far away")
	# => Once upon a time in a world f...

	truncate("Once upon a time in a world far far away", :length => 14)
	# => Once upon a...

	truncate("And they found that many people were sleeping better.", 
		:omission => "... (continued)", :length => 15)
	# => And they found... (continued)

### highlight

	highlight('You searched for: rails', ['for', 'rails'], :highlighter => '<em>\\1</em>')
	# => You searched <em>for</em>: <em>rails</em>

	highlight('You searched for: rails', 'rails', :highlighter => '<a href="search?q=\\1">\\1</a>')
	# => You searched for: <a href="search?q=rails">rails</a>

### excerpt

	excerpt('This is an example', 'an', :radius => 5)
	# => ...s is an exam...

	excerpt('This is an example', 'is', :radius => 5)
	# => This is a...

	excerpt('This next thing is an example', 'ex', :radius => 2)
	# => ...next...

	excerpt('This is also an example', 'an', :radius => 8, :omission => '<chop> ')
	# => <chop> is also an example

### word\_wrap

	word_wrap('Once upon a time', :line_width => 8)
	# => Once upon\na time

	word_wrap('Once upon a time', :line_width => 1)
	# => Once\nupon\na\ntime

### auto\_link

	post_body = "Welcome to my blog at http://www.nomedojogo.com/. Please e-mail me at me@email.com."

	auto_link(post_body, :urls)
	# => "Welcome to my blog at 
		<a href=\"http://www.nomedojogo.com/\">http://www.nomedojogo.com</a>. 
		Please e-mail me at me@email.com."

	auto_link(post_body, :all, :target => "_blank")
	# => "Welcome to my blog at 
		<a href=\"http://www.nomedojogo.com/\" target=\"_blank\">http://www.nomedojogo.com</a>. 
		Please e-mail me at <a href=\"mailto:me@email.com\">me@email.com</a>."

	auto_link(post_body, :link => :all, :html => {:target => "_blank"})
	# => "Welcome to my blog at 
		<a href=\"http://www.nomedojogo.com/\" target=\"_blank\">http://www.nomedojogo.com</a>. 
		Please e-mail me at <a href=\"mailto:me@email.com\">me@email.com</a>."

Todos os métodos continuam funcionando da forma antiga por enquanto, mas alertas serão emitidos no terminal para lembra-lo de atualizar seu código o mais rápido possível.
