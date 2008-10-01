## Improving performance in association\_id methods.

If you have two models, `Post` and `Comment`, where a post has many (`has_many`) comments, if you execute the following:

	Post.first.comment_ids
	
Rails will use the following query to retrieve the ids:

	SELECT * FROM `comments` WHERE (`comments`.post_id = 1)

But in this case, we don't need the entire objects. The following query would be more than sufficient for this method to function, and it would also perform better:

	SELECT `comments`.id FROM `comments` WHERE (`comments`.post_id = 1)

For both `has_many` and `has_many :through` associations, the Rails code base has been updated to include this performance enhancement from this version on.