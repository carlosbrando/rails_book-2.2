## cache\_classes now enabled by default

In your project's configuration files there is probably the following line:

	config.cache_classes = false

This tells Rails that it shouldn't cache your project's code; that is, for each request that comes in, it shouldn't reload all the code again. Although this slows down execution, it's ideal for development because it keeps you from having to restart the server every time you change something.

In production mode it's critical that you keep this enabled.

In Rails 2.1 projects, if the line above is not in your configuration file, Rails will assume that it should not cache classes&mdash;this is the default behavior.

In Rails 2.2 this has been inverted; if no configuration option is found, it will assume that it should cache classes. This helps inexperienced Rails users not to deploy their projects in development mode.