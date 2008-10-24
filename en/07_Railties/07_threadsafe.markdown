## threadsafe!

Rails now has a new configuration method to enable threaded mode:

	config.threadsafe!

When this method is run in your configuration file (usually in **environments/production.rb**), you will be causing controller actions to be able to accept concurrent requests and connect to multiple database connections. Depending on your application and deployment environment, this may also allow your application to handle more requests, since fewer copies of Rails will be loaded in memory.

This also disables post-initialization dependency loading. For more details about this, look up the "Enabling and disabling dependency loading" in the **ActiveSupport** chapter.