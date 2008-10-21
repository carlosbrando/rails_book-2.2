## Updating an association using its foreign key

I'm not sure if this is a bug or not, but in my opinion, this has been a problem. Check out the following code, in which I try to modify a user's account using its foreign key in a project that uses Rails 2.1 or earlier:

	class User < ActiveRecord::Base
	  belongs_to :account
	end

	user = User.first
	# => #<User id: 1, login: "admin", account_id: 1>

	user.account
	# => #<Account id: 1, name: "My Account">

	user.account_id = 2
	# => 2

	user.account
	# => #<Account id: 1, name: "My Account">

Note that I am modifying the user's account, but the association wasn't updated. Even after saving the `user` object, if it is not reloaded, the association will continue to show the wrong account.

This has been fixed in Rails 2.2. Take a look:

	class Comment < ActiveRecord::Base
	  belongs_to :post
	end

	comment = Comment.first
	# => #<Comment id: 1>

	>> comment.post
	# => #<Post id: 1>

	>> comment.post_id = 2
	# => 2

	>> comment.post
	# => #<Post id: 2>

Notice that, upon modifying the `post` using its foreign key, the association gets updated automatically.