## Changes to the number\_with\_delimeter method's signature

The `number_with_delimiter` method has been reimplemented. Besides making the code cleaner, the method's signature also changed. Check out how it was before:

	def number_with_delimiter(number, delimiter=",", separator=".")

	# usage examples
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, ".") # => 12.345.678
	number_with_delimiter(98765432.98, " ", ",")

Here is the new version:

	def number_with_delimiter(number, *args)

	# usage examples
	number_with_delimiter(12345678) # => 12,345,678
	number_with_delimiter(12345678.05) # => 12,345,678.05
	number_with_delimiter(12345678, :delimiter => ".") # => 12.345.678
	number_with_delimiter(12345678, :seperator => ",") # => 12,345,678
	number_with_delimiter(98765432.98, :delimiter => " ", :separator => ",")

So make sure, when you use the `number_with_delimiter` method, that you specify the options with symbolized hash keys.