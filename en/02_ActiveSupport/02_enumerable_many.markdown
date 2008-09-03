## New method: Enumerable#many?

A new method called `many?` was added to the `Enumerable` module. And just as its name seems to say, it tells you if the collection contains more than one object; that is to say, if it contains many objects.

This method is an alias to `collection.size > 1`. Let's look at a few examples:

	>> [].many?
	# => false

	>> [ 1 ].many?
	# => false

	>> [ 1, 2 ].many?
	# => true

Besides the format shown in these examples, this method also got a new implementation that allows it to receive blocks, which work the same way as the `any?` method.

Check out these examples:

	>> x = %w{ a b c b c }
	# => ["a", "b", "c", "b", "c"]

	>> x.many?
	# => true

	>> x.many? { |y| y == 'a' }
	# => false

	>> x.many? { |y| y == 'b' }
	# => true


	# another example...
	people.many? { |p| p.age > 26 }

Just to remind and reiterate, this method only returns `true` if more than one iteration of the block returns true, and when the collection has more than one object if called without a block.

As an interesting side note, the method was initially going to be called `several?` but it ended up as `many?`.