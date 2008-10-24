## Connection Pools in Rails

One of the complaints that a lot of folks make about Rails is that it's slow. We know this isn't exactly true, but we also know that a lot could be done to improve Rails' performance. 

And something has been done. A database **connection pool** has been added to Rails.

Every time a database query is made, some time is lost opening a new connection before data can be retrieved or saved. At first glance it may seem trivial, but opening a database connection is not so simple. It is necessary to open a network connection with the database server, perform authentication, and verify a number of things. All of this takes resources and time. After creating this connection, Rails uses it for all applicable database requests, and heavier queries can delay the execution of other requests. This goes to show how the database can become the achilles heel of some large Rails projects.

The solution for this problem is to reuse previously-created database connections, having them perform more tasks before closing. Or in more technical terms, we need a connection pool.

Here's how it works: A database connection is opened so a query can be performed. After this, instead of closing it, it gets saves in a connection pool. When another query is executed, instead of opening a new conneciton, the system takes advantage of the one that has already been created, reducing the time and resources required to get the task done. Many connections can be stored in the pool at the same time, and requests get distributed between them. This means that a slow query can be running on the database while the application still receives requests and executes queries using the other connections in the pool.

In Rails, a new pool gets created every time the `establish_connection` method is called. In other words, every database listed in **database.yml** will have its own connection pool.

The pool starts out empty and grows until it reaches the default limit of five connections, but you can increase this default by adding the `pool` option in the database configuration:

	development:
	  adapter: mysql
	  host: localhost
	  username: myuser
	  password: mypass
	  database: somedatabase
	  pool: 10
	  wait_timeout: 15

If no connection is available, a thread will wait five seconds (default) for another connection before it times out. This waiting period can also be configured by adding the `wait_timeout` option to the database configuration.

If you want to use connection pools outside of `ActionPack`, there is a method called  `ActiveRecord::Base.connection_pool`, which allows you to manually handle the reserving (checking out) and releasing (checking in) of the connections in the pool. Don't forget to check in a connection after you're done using it so that it can be reused by other requests.

	connection = ActiveRecord::Base.connection_pool.checkout
	# do something in the database
	ActiveRecord::Base.connection_pool.checkin(connection)

You can also use the `ActiveRecord::Base.connection_pool.with_connection` method, which does the checkout/checkin for you, making your code a little more secure.

	ActiveRecord::Base.connection_pool.with_connection do |connection|
	  # do something in the database
	end
