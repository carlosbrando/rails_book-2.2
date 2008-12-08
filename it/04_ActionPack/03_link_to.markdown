## Il metodo link\_to ora accetta blocchi

Il metodo `link_to` è stato aggiornato affinché accetti i blocchi. Ciò è molto utile quando avete stringhe di testo molto lunghe nei vostri link. Ad esempio, se prima era necessario qualcosa del genere:

	<%= link_to "<strong>#{@profile.name}</strong> -- <span>Check it out!!</span>", @profile %>

Ora potete ottenere il medesimo risultato con:

	<% link_to(@profile) do %>
	  <strong><%= @profile.name %></strong> -- <span>Check it out!!</span>
	<% end %>

Benché non sia un cambiamento significativo, vi permette di scrivere codice più leggibile e manutenibile, il che è molto importante.
