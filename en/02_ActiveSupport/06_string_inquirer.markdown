## StringInquirer

A new class called `StringInquirer` has been added to Rails.

To understand how it works, I will need to explain with some terms. Let's create a class called `Client`, which contains a method that returns the `status` of the client:

	class Client
	  def status
	    "active"
	  end
	end

	c = Client.new
	c.status
	# => "active"

	c.status == "active"
	# => true

	c.status == "inactive"
	# => false

Ok, to this point everything is as expected. Now I will modify the implementation of the status method using the `StringInquirer` class, keeping in mind that the return value of `status` can come from a database column (of course)&mdash;this is only an example:

	class Client
	  def status
	    ActiveSupport::StringInquirer.new("active")
	  end
	end

	c = Client.new
	c.status
	# => "active"

	# Here is the big difference:
	c.status.active?
	# => true

	c.status.inactive?
	# => false

To verify that the `status` of the client is what you expected, instead of comparing `Strings`, I use a method with the status value and an exclamation point.
[FIXME question point]

Of course this usage has already begun in Rails itself. For example, if you need to verify that Rails was loaded in a production environment, you can substitute the old `Rails.env == "production"` for:

	Rails.env.production?
