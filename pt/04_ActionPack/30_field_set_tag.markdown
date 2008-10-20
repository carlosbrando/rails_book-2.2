## Opções no método field\_set\_tag

Foi adicionado ao método `field_set_tag` um parâmetro opcional para facilitar a formatação do HTML. Este parâmetro aceita todas as opções que o método `tag` já aceita. Exemplo:

	<% field_set_tag nil, :class => 'format' do %>
	  <p>Some text</p>
	<% end %>

O código acima retornará o seguinte:

	<fieldset class="format">
	  <p>Some text</p>
	</fieldset>
