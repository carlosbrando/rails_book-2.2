## polymorphic\_url now works with singleton resources

For more information about singular resource routes, see the "Additional Information" chapter at the end of this book.

Until now, the `polymorphic_url` helper did not work properly with singleton resources.

A new patch has been made to allow a singleton resource to be specified with symbols, like you can with namespaces. For example:

	# This code
	polymorphic_url([:admin, @user, :blog, @post])

	# is the same as
	admin_user_blog_post_url(@user, @post)