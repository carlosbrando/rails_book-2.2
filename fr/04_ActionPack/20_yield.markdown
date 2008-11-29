## More features for partials

Take a look at the following example:

	<!-- _layout.html.erb -->
	beginning
	<%= yield %>
	ending

	<!-- some view -->
	<%= render :layout => 'layout' do %>
	middle
	<% end %>

The output of this code would be:

	beginning
	middle
	ending

In the example above I'm including a partial inside my view and using the `yield` method to customize the content, which is specified inside a block that gets passed to the `render` method.

Until now, however, you couldn't pass any arguments to the block. In Rails 2.2 this is now possible. You can do some pretty cool stuff. Check out this example involving a collection of books:

	<!-- app/views/books/_book.html.erb -->
	<div class="book">
	  Price: $<%= book.price %>
	  <%= yield book %>
	</div>

	<!-- app/views/books/index.html.erb -->
	<% render :layout => @books do |book| %>
	  Title: <%= book.title %>
	<% end %>

This would return something like:

	<div class="book">
	  Price: $29.74
	  Title: Advanced Rails
	</div>

Notice how, inside the block, I'm specifying the book's title, but in another view I can also add the remaining stock or other relevant information, while always using the same view.

You can also use the same partial many times in the same view and use blocks to differentiate between page sections, for example:

	<!-- app/views/books/_book.html.erb -->
	<div class="book">
	  <%= yield book, :header %>
	  Price: $<%= book.price %>
	  <%= yield book, :footer %>
	</div>

	<!-- app/views/books/index.html.erb -->
	<% render :layout => @books do |book, section| %>
	  <%- case section when :header -%>
	    Title: <%= book.title %>
	  <%- when :footer -%>
	    (<%= book.reviews.count %> customer reviews)
	  <%- end -%>
	<% end %>