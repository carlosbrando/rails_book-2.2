## Introducing Memoizable for attribute caching

Performance is important, and one of the most commonly used methods for improving code execution speed is caching. You've probably written code like this before:

	class Person < ActiveRecord::Base
	  def age
	    @age ||= a_very_complex_calculation
	  end
	end

In this version of Rails we have a more elegant way of doing this, using the `memoize` method (it is really `memoize` and not **memorize**). Let's change the example above to use this new functionality:

	class Person < ActiveRecord::Base
	  def age
	    a_very_complex_calculation
	  end
	  memoize :age
	end

The `age` method will be executed just once and its return value will be stored in memory and returned from memory for future calls to the method.

There is just one difference between the two examples above. In the first, as the method is always executed, if the value stored in `@age` is `nil` or `false`, the complex calculation will be executed again until you get the person's age. In the second example, the `age` method will only be executed once and the return value will always be returned for future calls, even if it's `nil` or `false`.

If you ever need to disable or re-enable caching of memoized properties, you can use the `unmemoize_all` and `memoize_all` methods:

	@person = Person.first

	# To stop caching the age method
	@person.unmemoize_all

	# To re-enable caching of just the age method
	@person.memoize_all
