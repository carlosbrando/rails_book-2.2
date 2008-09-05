## Recovering the last record from ActiveResource

Following the `ActiveRecord` convention, `ActiveResource`'s find method now accepts the `:last` option:

	Person.find(:last, :from => :managers)
	# => GET /people/managers.xml

You can use this to recover the last item in a collection of resources.