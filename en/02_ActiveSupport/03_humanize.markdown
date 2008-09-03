## Make rules for the String#humanize

For some time now Pratik Naik has been trying to get this patch accepted in Rails and it looks like he finally succeeded.

In **config/initializers/inflections.rb** you have the option of adding new inflections to pluralization, singularization and others:

	Inflector.inflections do |inflect|
	  inflect.plural /^(ox)$/i, '\1en'
	  inflect.singular /^(ox)en/i, '\1'
	  inflect.irregular 'person', 'people'
	  inflect.uncountable %w( fish sheep )
	end

In Rails 2.2 you can also include inflections for the `String` class's `humanize` method. Let's look at some awesome examples:

	'jargon_cnt'.humanize # => "Jargon cnt"
	'nomedojogo'.humanize # => "Nomedojogo"

	ActiveSupport::Inflector.inflections do |inflect|
	  inflect.human(/_cnt$/i, '\1_count')
	  inflect.human('nomedojogo', 'Nome do Jogo')
	end

	'jargon_cnt'.humanize # => "Jargon count"
	'nomedojogo'.humanize # => "Nome do jogo"
