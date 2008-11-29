## New Model#delete instance method

To make `ActiveRecord` more consistent, an additional instance method has been created: `Model#delete`. It is similar to the class method with the same name. The `delete` method, contrary to the `destroy` method, erases the database record without calling any callback methods, such as `before_destroy` and `after_destroy`.

This method also disregards constraint options, such as the `:dependent` option, which specifies what should be done with associated objects when a record is destroyed.

	client = Client.find(1)
	client.delete