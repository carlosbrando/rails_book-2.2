## Retrieving the current string from the cycle method

You probably are already familiar with the `cycle` method. It is used to alternate the colors of table rows, changing each row's CSS class.

	@items = [1,2,3,4]
	<table>
	  <% @items.each do |item| %>
	  <tr class="<%= cycle("even", "odd") -%>">
	    <td>item</td>
	  </tr>
	  <% end %>
	</table>

A new auxiliary method has been created to help when using `cycle` in more complex tables or other situations where it may be necessary to retrieve the class string for the current iteration. Look at this similar example to the one before, which uses the new `current_cycle` method:

	@items = [1,2,3,4]
	<% @items.each do |item| %>
	<div style="background-color:<%= cycle("red", "white", "blue") %>">
	  <span style="background-color:<%= current_cycle %>"><%= item %></span>
	</div>
	<% end %>