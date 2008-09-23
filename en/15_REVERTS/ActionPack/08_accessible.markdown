## Using the :accessible option in your forms

In the `ActiveRecord` chapter I talked about a new way of setting values for associations using the `:accessible` option.

Now I will show you one of the big advantages of this option. By using this new feature we can improve the way we use the `fields_for` method. Here is an example based on previous code:

	<% form_for @post do |f| %>
	  <%= f.text_field :body %>
	  <% fields_for :author do |a_f| %>
	    <%= a_f.text_field :name %>
	  <% end %>
	  <%= submit_tag %>
	<% end %>

I'm using the `fields_for` method to add the author's name to the post creation page. Here is the best part.  Take a look at how easy it is to create a post and an author using this new feature:

	class PostController < ApplicationController

	  def new
	    @post = Post.create(params[:post])
	    respond_to do |wants|
	      ...
	    end
	  end
	end

Note how all I need to use is the `create` method of the `Post` class. Since the `:accessible => true` option was added to the association between this class and the `Author` class, the creation of the author is automatic and transparent.