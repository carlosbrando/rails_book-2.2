## Giving a name to the local variable in a collection of partials

In the code below, a **partial** is being used with a collection of objects:

	render :partial => "admin_person", :collection => @winners

Inside the **partial** it then becomes possible to use the **admin\_person** variable to access the elements of the collection. But this variable naming convention is kind of lousy.

You now have the option of choosing a custom name for this variable using the `:as` option. Let's change that last example:

	render :partial => "admin_person", :collection => @winners, :as => :person

Now each item in the collection can be accessed using the more intuitive **person** variable.