## Crie regras para o String#humanize

Já faz um certo tempo que Pratik Naik estava tentando colocar este patch no Rails e parece que finalmente conseguiu.

No arquivo **config/initializers/inflections.rb** você tem a opção de acrescentar novas inflexões para pluralização, singularização e outros:

	Inflector.inflections do |inflect|
	  inflect.plural /^(ox)$/i, '\\1en'
	  inflect.singular /^(ox)en/i, '\\1'
	  inflect.irregular 'person', 'people'
	  inflect.uncountable %w( fish sheep )
	end

No Rails 2.2 você também pode incluir inflexões para o método `humanize` da classe `String`. Vamos aos famosos exemplos:

	'jargon_cnt'.humanize # => "Jargon cnt"
	'nomedojogo'.humanize # => "Nomedojogo"

	ActiveSupport::Inflector.inflections do |inflect|
	  inflect.human(/_cnt$/i, '\\1_count')
	  inflect.human('nomedojogo', 'Nome do Jogo')
	end

	'jargon_cnt'.humanize # => "Jargon count"
	'nomedojogo'.humanize # => "Nome do jogo"
