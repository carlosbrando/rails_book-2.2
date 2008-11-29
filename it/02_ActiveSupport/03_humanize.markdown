## Descrivere regole per String#humanize

Per diverso tempo Pratik Naik ha chiesto che tale patch fosse accettata in Rails, e sembra proprio che alla fine ci sia riuscito.

In **config/initializers/inflections.rb** possiamo aggiungere nuove inflessioni per la pluralizzazione, singolarizzazione, et similia:

	Inflector.inflections do |inflect|
	  inflect.plural /^(ox)$/i, '\\1en'
	  inflect.singular /^(ox)en/i, '\\1'
	  inflect.irregular 'person', 'people'
	  inflect.uncountable %w( fish sheep )
	end

In Rails 2.2 possiamo anche aggiungere inflessioni per il metodo `humanize` della classe `String`.
Vediamo qualche interessante esempio:

	'jargon_cnt'.humanize # => "Jargon cnt"
	'nomedojogo'.humanize # => "Nomedojogo"

	ActiveSupport::Inflector.inflections do |inflect|
	  inflect.human(/_cnt$/i, '\\1_count')
	  inflect.human('nomedojogo', 'Nome do Jogo')
	end

	'jargon_cnt'.humanize # => "Jargon count"
	'nomedojogo'.humanize # => "Nome do jogo"
