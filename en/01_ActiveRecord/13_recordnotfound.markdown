## New destructive versions of ActiveRecord find methods

The `ActiveRecord` dynamic finders now have destructive counterparts that raise a `RecordNotFound` exception when the result set is empty, instead of returning `nil` like the original behavior.

To use these destructive versions, just add an exclamation point to the end of the method. Here is an example:

	Topic.find_by_title!("The First Topic!")
	# => ActiveRecord::RecordNotFound
