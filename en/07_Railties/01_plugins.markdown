## Are plugins a thing of the past?

In Rails 2.1, it became possible to use gems as plugins in your projects. To do this, you just had to create a folder called **rails** inside of the gem's project and include a file called **init.rb**.

This brought with it a bunch of new things like `config.gem` and `rake:gems`. But it makes you wonder, since it's now possible to load gems inside your Rails application, could it only be a matter of time before plugins disappear?

And it looks like this might actually happen. In this version of Rails, for example, a change has been made that allows you to initialize plugins either using **init.rb** in plugin's root directory, or in **rails/init.rb** (the same way you do with gems). This second option is the preferred method.

So, I could for example make a gem (which would function as a plugin) and install it in two ways:

`./script/plugin install git://github.com/user/plugin.git`

`sudo gem install user-plugin --source=http://gems.github.com`

This also prevents you from having to maintain two **init.rb** files (one in the plugin's root and the other in the rails directory).