## alias\_attribute works with dirty objects

To understand this modification, we will need to analyze a code snippet running in both previous and 2.2 versions of Rails. Let's look at an example model:

	class Comment < ActiveRecord::Base
	  alias_attribute :text, :body
	end

Note that I am using the `alias_attribute` method to create an alias for the `body` attribute called `text`. In theory, this method should replicate all the various dynamic methods that get created by `ActiveRecord` that involve the `body` attribute. But look at this example code running in Rails 2.1 or earlier:

	c = Comment.first
	# => #<Comment id: 1, body: "my comment">

	c.body
	# => "my comment"

	c.text
	# => "my comment"

	c.body = "a new message"
	# => "a new message"

	c.body_changed?
	# => true

	c.text_changed?
	# => NoMethodError: undefined method `text_changed?' ...

Upon running the `text_changed?` method, we have an error, because the `alias_attribute` call was replicating the tracking methods, but this has now been corrected. Check out the same code running in a Rails 2.2 project:

	c = Comment.first
	# => #<Comment id: 1, body: "my comment">

	c.body
	# => "my comment"

	c.text
	# => "my comment"

	c.body = "a new message"
	# => "a new message"

	c.body_changed?
	# => true

	c.text_changed?
	# => true

	c.text_change
	# => ["my comment", "a new message"]