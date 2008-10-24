## Giving a name to the local variable in a collection of partials

In the code below, a **partial** is being used with a collection of objects:

	render :partial => "admin_person", :collection => @winners

Inside the **partial** it then becomes possible to use the **admin\_person** variable to access the elements of the collection. But this variable naming convention is kind of lousy.

You now have the option of choosing a custom name for this variable using the `:as` option. Let's change that last example:

	render :partial => "admin_person", :collection => @winners, :as => :person

Now each item in the collection can be accessed using the more intuitive **person** variable.

## Partials no longer define local variables implicitly

In the example below, I am rendering a partial, and I'm not indicating which variable it should use to fill in the content. Previously, Rails would assume that it should use the instance variable of the same name as the partial.

	@customer = Customer.new("Carlos Brando")
	render :partial => "customer"

This works, but it is a little risky. Starting with Rails 2.2, this functionality still works but now emits a deprecation warning:

"@customer will no longer be implicitly assigned to customer"

You can expect this feature to be removed completely in the future.