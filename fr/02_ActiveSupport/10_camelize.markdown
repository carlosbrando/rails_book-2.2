## camelize(:lower)

By default, the `camelize` method in Rails is used to convert a string to the **UpperCamelCase** format, meaning that the first word of the string will be capitalized along with every other word. It is now possible to convert a string to **lowerCamelCase** (first word lowercase and other words capitalized) using the `:lower` argument. If, however, you try to execute the following code:

	'Capital'.camelize(:lower)
	# => "Capital"

The first letter is not rendered in lowercase. This has been corrected. Here is the same code being executed under Rails 2.2:

	'Capital'.camelize(:lower)
	# => "capital"
