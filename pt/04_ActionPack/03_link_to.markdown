## Método link\_to com blocos

O método **link\_to** recebeu uma atualização que permite seu uso com blocos. Isto é interessante para os casos onde temos textos muito longos no hyperlink. Por exemplo, se hoje fazemos assim:

	<%= link_to "<strong>#{@profile.name}</strong> -- <span>Check it out!!</span>", @profile %>

Agora podemos fazer assim, que teremos o mesmo resultado:

	<% link_to(@profile) do %>
	  <strong><%= @profile.name %></strong> -- <span>Check it out!!</span>
	<% end %>

Não é uma mudança significativa em funcionalidade, mas permite deixar o código mais legivel, e isto também é importante.
