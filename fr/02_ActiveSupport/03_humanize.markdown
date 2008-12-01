## Régles spécifiques pour String#humanize

Pratik Naik essaye de faire accepter ce patch depuis un moment et il semble qu'il a finalement réussi.

Vous pouvez ajouter de nouvelles inflexions (pluriel, singulier ou autre) dans **config/initializers/inflections.rb** :

	Inflector.inflections do |inflect|
	  inflect.plural /^(ox)$/i, '\\1en'
	  inflect.singular /^(ox)en/i, '\\1'
	  inflect.irregular 'person', 'people'
	  inflect.uncountable %w( fish sheep )
	end

Dans Rails&nbsp;2.2 vous pouvez aussi ajouter des inflexions pour la méthode `humanize` de la classe `String`. Voyons ces exemples célèbres :

	'jargon_cnt'.humanize # => "Jargon cnt"
	'nomedojogo'.humanize # => "Nomedojogo"

	ActiveSupport::Inflector.inflections do |inflect|
	  inflect.human(/_cnt$/i, '\\1_count')
	  inflect.human('nomedojogo', 'Nome do Jogo')
	end

	'jargon_cnt'.humanize # => "Jargon count"
	'nomedojogo'.humanize # => "Nome do jogo"
