## Indicating another primary\_key in associations

A new option called `:primary_key` has been added to the `has_many` and `has_one` methods.

Using this option, you can define which method and associated model will return the primary key that will be used in the association. Obviously the standard primary key is **id**.

Look at this usage example:

	has_many :clients_using_primary_key, :class_name => 'Client',
		:primary_key => 'name', :foreign_key => 'firm_name'

The `has_one` method functions exactly as explained above.