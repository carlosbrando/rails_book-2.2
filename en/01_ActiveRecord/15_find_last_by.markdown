## Another dynamic finder

In addition to the existing `ActiveRecord` finders, we now have `find_last_by`. The others are `find_by` and `find_all_by`.

Besides being simpler, this also offers a much more elegant way of retrieving the last comment made by a certain user, for example. Check it out:

	Comment.find_last_by_author("Carlos Brando")