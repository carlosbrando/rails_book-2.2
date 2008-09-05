## Recuperando a string atual do método cycle

Muito provavelmente você já conhece o método `cycle`. Ele é muito usado para alternar as cores de linhas em um tabela, alterando a propriedade **class** de cada **row**.

	@items = [1,2,3,4]
	<table>
	  <% @items.each do |item| %>
	  <tr class="<%= cycle("even", "odd") -%>">
	    <td>item</td>
	  </tr>
	  <% end %>
	</table>

Um novo método foi criado para auxiliar o uso do método `cycle` em tabelas mais complexas ou outros tipos de design onde se faça necessário recuperar a string corrente desde a última execução do método `cycle`. Veja um exemplo similar ao mostrado acima usando o novo método `current_cycle`:

	@items = [1,2,3,4]
	<% @items.each do |item| %>
	<div style="background-color:<%= cycle("red", "white", "blue") %>">
	  <span style="background-color:<%= current_cycle %>"><%= item %></span>
	</div>
	<% end %>
