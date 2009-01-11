## La méthode link\_to accepte maintenant les blocs

Il est maintenant possible d'utiliser la méthode `link_to` avec un bloc. C'est utile si vous avez de longs textes dans vos liens. Par exemple vous auriez pu écrire ceci&nbsp;:

	<%= link_to "<strong>#{@profile.name}</strong> -- <span>Check it out!!</span>", @profile %>

Vous pouvez maintenant l'écrire ainsi, avec le même résultat&nbsp;:

	<% link_to(@profile) do %>
	  <strong><%= @profile.name %></strong> -- <span>Check it out!!</span>
	<% end %>

Ce n'est pas un changement significatif de fonctionnalité, mais ça rend le code plus lisible, ce qui est important aussi.
