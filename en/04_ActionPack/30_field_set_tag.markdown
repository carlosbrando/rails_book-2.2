## Options in the field\_set\_tag method

The `field_set_tag` method has gotten a new option parameter that makes HTML formmating easier. This parameter accepts all the options that the `tag` method accepts. For example:

	<% field_set_tag nil, :class => 'format' do %>
	  <p>Some text</p>
	<% end %>

This code will return the following:

	<fieldset class="format">
	  <p>Some text</p>
	</fieldset>
