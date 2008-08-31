## A new way of specifying conditions with a Hash

When performing database queries, sometimes you need to use the `:joins` option, either to improve application performance or when you need to retrieve information that depends on results from more than one table.

For example, if you wanted to retrieve all users who bought red items, you could do something like this:

	User.all :joins => :items, :conditions => ["items.color = ?", 'red']

This syntax is a little painful, since you need to include the name of the table (**items** in this case) inside a **string**. The code seems weird.

In Rails 2.2 there is a new way of doing this, using a hash key to identify the table:

	User.all :joins => :items, :conditions => {
	  :age => 10,
	  :items => { :color => 'red' }
	}

	# another example that perhaps makes the code a little clearer
	User.all :joins => :items, :conditions => {
	  :users => { :age => 10 },
	  :items => { :color => 'red' }
	}

In my opinion, the code is a lot clearer this way, especially when you need to provide conditions for many fields from various tables.

Just keep in mind that the key you use is the (plural) name of the table or an alias, if you have specified one in the query.