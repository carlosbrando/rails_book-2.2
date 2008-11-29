## Modification in the assert\_difference method

When you used the `assert_difference` method with more than one expression, and an error occurred, it was difficult to know which expression was the one that failed the assertion, since the error message didn't include this information.

In Rails 2.2, the error message explains exactly which method failed the assertion. For example:

	assert_difference ['Post.count', 'current_user.posts.count'] do
	  Post.create(params)
	end

The code above displays the following message, in the event that the second expression doesn't pass:

**<current\_user.posts.count> was expression that failed. <1> expected but was <0>.**