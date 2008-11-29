## link\_to method now accepts blocks

The `link_to` method has been updated to work with blocks. This is useful when you have really long strings in your links. For example, while before you might have done something like this:

	<%= link_to "<strong>#{@profile.name}</strong> -- <span>Check it out!!</span>", @profile %>

You can now do something like this, with the same result:

	<% link_to(@profile) do %>
	  <strong><%= @profile.name %></strong> -- <span>Check it out!!</span>
	<% end %>

It is not a significant change in functionality, but it does allow you to write more legible code, which is also important.