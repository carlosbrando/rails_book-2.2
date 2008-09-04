## Enabling and disabling dependency loading

If you want to allow or restrict dependency loading during the course of a request, you can use a new configuration parameter.

	config.dependency_loading = true
	# or
	config.dependency_loading = false

Changing `dependency_loading` to `true` causes new classes to be loaded during a request. Changing it to `false` will disable this.

If you want to run your project in an environment that allows concurrency, you should disable this option and load all your dependencies in the initialization files (using `require`, for example).

If the `cache_classes` option is disabled, dependency loading will always be enabled.