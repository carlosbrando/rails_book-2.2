## Simplifying resource access

Nested routes have been around for a while. As you build your routes, it's not uncommon to do something like this:

	map.resources :users do |user|
	  user.resources :posts do |post|
	    post.resources :comments
	  end
	end

In the code above, I am making it clear that my users have posts, and these posts have comments. In accordance with the way my routes have been configured, I can retrieve a user's posts using the URL '**/users/1/posts**', or retrieve a particular post with the URL '**/users/1/posts/5/comments**'.

With the new `:shallow => true` option, we gain more flexibility. Note that when you add this option to the first resource, all other resources within it will inherit this characteristic.

	map.resources :users, :shallow => true do |user|
	  user.resources :posts do |post|
	    post.resources :comments
	  end
	end

With this option enabled, I can keep retrieving data like I did before. The advantage is that I can now also retrieve all the comments for a post without specifying a user, with the following URL: '**/posts/2/comments**'. Or I can retrieve a certain post using only '**/posts/2**'.

The `:shallow` option also works with resources that use `has_many` or `has_one`, as follows:

	map.resources :users, :has_many => { :posts => :comments }, :shallow => true

All the helpers for accessing the routes directly also get created, such as:

	user_posts_path(@user) # => '/users/1/posts'
	posts_path # => '/posts'
	post_comments_path(@post) # => /posts/5/comments
