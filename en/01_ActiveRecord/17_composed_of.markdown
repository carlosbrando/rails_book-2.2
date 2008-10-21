## New options for the composed\_of method

The `composed_of` method has two new options: `:constructor` and `:converter`.

The `constructor` option can receive a symbol with the name of a method or a `Proc`. By default, the composite class is created by the `new` method, receiving all the mapped attributes as parameters, exactly in the order that they were mapped. If, for some reason, your class does not follow this convention, you should use the `:constructor` option. It allows you to change the way your class gets created. Take a look at this example, taken from Rails' own documentation:

	composed_of :ip_address,
	  :class_name => 'IPAddr',
	  :mapping => %w(ip to_i),
	  :constructor => Proc.new { |ip| IPAddr.new(ip, Socket::AF_INET) }

As you can see from the example, upon creating a new instance of the `IPAddr` class, it is necessary to supply an additional parameter to the constructor. Using the `:constructor` option makes this easy.

As for the `:converter` option, it also accepts a symbol representing a method from the class in `:class_name`, or a `Proc`, and it is called when the value of the composed field gets assigned from another instance and requires conversion. Here is an example:

	composed_of :balance,
	  :class_name => "Money",
	  :mapping => %w(balance amount),
	  :converter => Proc.new { |balance| Money.parse(balance) }

In this example, the `balance=` method will always be expecting an instance of the `Money` class, but, if another type of object is passed, it should be converted using the `parse` method of the `Money` object.

You should use this new `:converter` option instead of the conversion block that the method used to allow.