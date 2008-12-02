## Adding a prefix to delegates

The `Module#delegate` now has a new `:prefix` option that can be used when you want the target class's name to be prefixed to the method name. Let's take a look at two examples. First, here is the way you usually work with delegates:

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client
	end

	Invoice.new.street
	Invoice.new.city
	Invoice.new.name

And here is an example that uses the new `:prefix` option:

	class Invoice < ActiveRecord::Base
	  delegate :street, :city, :name, :to => :client, :prefix => true
	end

	Invoice.new.client_street
	Invoice.new.client_city
	Invoice.new.client_name

You can also use a custom name for the prefix:

	class Invoice < ActiveRecord::Base
		delegate :street, :city, :name, :to => :client, :prefix => :customer
	end

	Invoice.new.customer_street
	Invoice.new.customer_city
	Invoice.new.customer_name
