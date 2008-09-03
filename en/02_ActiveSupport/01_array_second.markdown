## Array#second through Array#tenth

In the **Array** class we already had the `first` and `last` methods, so why not add the `second`, `third`, `fourth`, and so on? That's just what they did. These methods return the element at the specified offset of the array.

Here is an example:

	array = (1..10).to_a

	array.second  # => array[1]
	array.third   # => array[2]
	array.fourth  # => array[3]
	array.fifth   # => array[4]
	array.sixth   # => array[5]
	array.seventh # => array[6]
	array.eighth  # => array[7]
	array.ninth   # => array[8]
	array.tenth   # => array[9]
