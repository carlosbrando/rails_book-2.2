## ActiveRecord

### Correction to a namespace clash between named\_scope and :joins.

When you used `with_scope` together with `:joins`, all the secondary table attributes were added to the model of the main table.

### find\_all method not working in named\_scope

When you executed the `find_all` method in a `named_scope`, the method was not being redirected to the `proxy_found` method as expected. This caused the `NoMethodError` exception to be raised.

	Topic.base.find_all(&:approved)
	# => NoMethodError: undefined method `find_all' for #<Class:0x19a0fb4>

This problem could be sidestepped using the `to_a` method:

	Topic.base.to_a.find_all(&:approved)
	# => [#<Reply:0x179e720>#<Topic:0x179e388>#<Reply:0x179e20c>]

In this version of Ruby on Rails, this has already been resolved.

### Partial updates did not update the lock\_version if nothing was altered

When you used optimistic locking with partial updates, unecessary extra queries used to be executed. This has been fixed. 

** Not sure if that last sentence is right **