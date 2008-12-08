## Opzioni nel metodo field\_set\_tag

Il metodo `field_set_tag` riceve un nuovo parametro che rende la formattazione dell'HTML più semplice. Questo parametro accetta tutte le opzioni del metodo `tag`. Esempio:

	<% field_set_tag nil, :class => 'format' do %>
	  <p>Some text</p>
	<% end %>

Questo codice produce:

	<fieldset class="format">
	  <p>Some text</p>
	</fieldset>
