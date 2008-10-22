## What is a singleton route?

Besides `map.resources`, you can also declare routes to singleton resources with `map.resource`. It makes a lot of sense to use a singleton route when you have a resource that is only instantiated once in the application or in the current user's session.

For example, if you were building an online personal organizer in which each user had his/her own address book, you could create the route to the address book like this:

	map.resource :address_book

This would make it possible to use the following routes to access the address book:

	GET/PUT address_book_url
	GET     edit_address_book_url
	PUT     update_address_book_url

Note that everything is in the singular form. We are assuming that, in the present context, it is not necessary to specify which address book we want, because each user only has one.

The relationship between the address book table and the current user is not automatic. You need to authenticate the user and return the correct address book. There is no magic here; it's just another routing technique that has been made available to you, if you need it.