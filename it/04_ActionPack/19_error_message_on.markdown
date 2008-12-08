## Modifiche in error\_message\_on

Il messaggio `error_message_on` è molto utile. Potete utilizzarlo per accedere ai messaggi di errore restituiti da certi metodi di un oggetto.

	<%= error_message_on "post", "title" %>

	<!-- oppure -->

	<%= error_message_on @post, "title" %>

Questo visualizza un messaggio di errore all'interno di un tag DIV se c'è un errore associato al campo "title" del modello "Post".

Ma l'aspetto più interessante del metodo `error_message_on` è che possiamo personalizzarlo per visualizzare messaggio più "amichevoli". Qui entrano in gioco le modifiche introdotte con Rails 2.2.

Nella precedente versione i parametri di personalizzazione venivano passati direttamente al metodo, mentre il Rails 2.2 vengono passati con un `Hash`:

	<%= error_message_on "post", "title",
	      :prepend_text => "Title simply ",
	      :append_text => " (or it won't work).",
	      :css_class => "inputError" %>

Non preoccupatevi del vostro vecchio codice, poiché continua a funzionare anche la vecchia modalità (almeno per un po') con qualche messaggio di warning che vi invita ad aggiornare il vostro codice.


## Diversi metodi sono stati modificati per accettare opzioni tramite Hash

Anche i seguenti metodi sono modificati per accettare i propri argomenti come `Hash`, rendendo il vostro codice più leggibile e facile da manutenere.


### truncate

	truncate("Once upon a time in a world far far away")
	# => Once upon a time in a world f...

	truncate("Once upon a time in a world far far away", :length => 14)
	# => Once upon a...

	truncate("And they found that many people were sleeping better.", :omission => "... (continued)", 
		:length => 15)
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

Tutti questi metodi continuano a funzionare con il vecchio formato (per il momento), limitandosi a mostrare messaggi di warning nei log dell'applicazione per ricordarvi di aggiornare il vostro codice al più presto.