## The merge\_conditions method in ActiveRecord is now public

The `merge_conditions` method in `ActiveRecord` is now a public method, which means that it will be available in all your **Models**.

This method does exactly what its name says&mdash;it allows you provide many different **conditions** in your parameters that get combined into a single condition.

	class Post < ActiveRecord::Base
	end

	a = { :author => 'Carlos Brando' }
	b = [ 'title = ?', 'Edge Rails' ]

	Post.merge_conditions(a, b)
	# => "(\"posts\".\"author\" = 'Carlos Brando') AND (title = 'Edge Rails')"

Note that the **conditions** always get combined with **AND**.