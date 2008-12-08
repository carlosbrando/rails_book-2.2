## Recupeare la stringa corrente dal metodo cycle

Probabilmente avrete già familiarità con il metodo `cycle`. E' utilizzato per alternare i colori delle righe di una table HTML, cambiando la classe CSS di ogni riga.

	@items = [1,2,3,4]
	<table>
	  <% @items.each do |item| %>
	  <tr class="<%= cycle("even", "odd") -%>">
	    <td>item</td>
	  </tr>
	  <% end %>
	</table>

Un nuovo metodo di supporto è stato creato per lavorare insieme a `cycle` in tutte quelle situazioni che lo richiedono, o dove è necessario recuperare il valore della stringa per l'iterazione corrente. Vediamo il seguente esempio che utilizza il nuovo metodo `current_cycle`:

	@items = [1,2,3,4]
	<% @items.each do |item| %>
	<div style="background-color:<%= cycle("red", "white", "blue") %>">
	  <span style="background-color:<%= current_cycle %>"><%= item %></span>
	</div>
	<% end %>