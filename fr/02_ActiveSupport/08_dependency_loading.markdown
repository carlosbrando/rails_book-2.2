## Enabling and disabling dependency loading

A new initialization parameter as been added to Rails that allows you to enable or disable the loading of new classes during a request.

	config.dependency_loading = true
	# or
	config.dependency_loading = false

If `dependency_loading` is `true`, during a request, Rails will attempt to load into memory any class that wasn't initially loaded during initialization. If it is `false`, these classes are ignored.

If you want to run your project in a threaded environment, you should disable this option and load all classes using eager loading, or by using the `require` method during system initialization.