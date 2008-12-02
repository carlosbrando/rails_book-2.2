## ActiveRecord#count method does not include an alias for associations

Let's say you have the following association `has_many :through`:

	class Author < ActiveRecord::Base
	  has_many :authorships
	  has_many :books, :through => :authorships
	end

When you search for a book, you can include author information:

	author.books.find(:all, :include => :authorships,
	                  :conditions => ["authorships.primary = ?", true])

This works well, without any problems. But try to do the same thing with the `count` method:

	author.books.count(:include => :authorships,
	                   :conditions => ["authorships.primary = ?", true])

We have an error. This happens because the **authorships** table was included twice in the same query.

The `find` method is more clever, because it creates an alias for the table, which the `count` method doesn't. I know that the example shown is not the best, but I use it just to demonstrate the problem with the `count` method.

This bug has been fixed. Now the `count` method behaves exactly like the `find` method as far as `:include` is concerned.

## Bug fix in ActiveRecord#count

There was a bug in `ActiveRecord#count` that happened when you used `has_many` with the `:limit` or `:offset` options. Let's look at an example:

	class Post < ActiveRecord::Base
	  has_many :comments, :limit=> 2
	end

In the code above, when you try to retrieve the comments for a post, only two comments should be returned.

	post.comments.length # => 2

	# Veja o SQL usado:
	# SELECT * AS count_all FROM "comments" WHERE
	# ("comments".post_id = 1) LIMIT 2

	But, when we use the count method:

	post.comments.count # => 3

	# Veja o SQL usado:
	# SELECT count(*) AS count_all FROM "comments" WHERE
	# ("comments".post_id = 1)

As you can see, the error occured because the `LIMIT 2` clause was not included in the SQL query.

Of course, this has already been corrected and is now working in Rails 2.2.