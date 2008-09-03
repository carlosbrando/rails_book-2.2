## Using the :accessible option to do mass attributions in ActiveRecord

All the association methods in **ActiveRecord** (`belongs_to`, `has_one`, `has_many` and `has_and_belongs_to_many`) got a new option that allows values for their associated models to be specified using nested hashes.

Let's take a look at an example of a model called **Post**:

	class Post < ActiveRecord::Base
	  belongs_to :author, :accessible => true
	  has_many :comments, :accessible => true
	end

Note that right after associating this model with **author** and **comments** I am setting the new `:accessible` option to `true`. This allows me to do something like this:

	post = Post.create({
	  :title => 'Accessible Attributes',
	  :author => { :name => 'David Dollar' },
	  :comments => [
	    { :body => 'First Post!' },
	    { :body => 'Nested Hashes are great!' }
	  ]
	})
	
Notice how I can create all the associations using a single **hash**, with sub-levels for each association. This wasn't possible to do automatically in Rails before.

I could also do something like this to add a new comment:

post.comments << { :body => 'Another Comment' }