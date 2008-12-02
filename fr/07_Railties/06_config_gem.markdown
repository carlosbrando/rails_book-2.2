## Making config.gem not load the gem

One of the new features introduced in Rails 2.1 was `config.gem`, which allows you to specify which gems your project depends on.

With this feature we gain a number of tasks that make our work easier, such as `rake gems:install`, which install all dependencies automatically.

But you had to be careful when configuring your dependencies, because in some cases the name of the gem isn't the name of the file that should be passed to `require`. For example, the **aws-s3** gem should be loaded with the name **aws/s3**, replacing the dash with a slash. Anticipating this situation, a `:lib` option has been added to `config.gem`. This is how it would look for the example above:

	config.gem 'aws-s3', :lib => 'aws/s3'

After a while another problem came up: "My project depends on this gem, but I don't want it to be loaded right now. What do I do?"

This new version allows us to set the `:lib` option to `false`, which causes Rails not to load the gem.

	config.gem 'aws-s3', :lib => false

Even without loading the gem, it will still be installed when you run `rake gems:install`, and it will be included in any other task related to gems.