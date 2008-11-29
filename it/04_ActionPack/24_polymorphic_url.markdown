## Route polimorfici

I metodi `*_polymorphic_url` e `*_polymorphic_path`, molto utilizzati per generare URL a partire dai record del database, adesso accettano un parametro opzionale. Oltre agli usuali parametri accettano anche un hash di opzioni, rendendo di fatto possibile generare nuovi route con parametri addizionali nell'URL.

Vediamo qualche esempio. Sotto a ciascun esempio viene mostrato un commento contenente il metodo equivalente:

	edit_polymorphic_url(@article, :param1 => '10')
	# => edit_article_url(@article, :param1 => '10')

	polymorphic_url(@article, :param1 => '10')
	# => article_url(@article, :param1 => '10')

	polymorphic_url(@article, :format => :pdf, :param1 => '10')
	# => formatted_article_url(@article, :pdf, :param1 => '10')
