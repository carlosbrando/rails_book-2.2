## Executing multiple instances of a project in subdirectories

Sometimes you need to run multiple copies of the same project. Maybe you have a product that will be used by various clients, or maybe you just want to run a test version and a production version of your app at the same time.

The easiest way of doing this is to have multiple (sub)domains, each with its own instance of the app. But if this isn't possible, you can put your application in a subdirectory and use a prefix on its URL to distinguish each instance of your app. For example, you could run blogs for different users with URLs like:

* http://www.nomedojogo.com/johndoe/blog
* http://www.nomedojogo.com/jilldoe/blog
* http://www.nomedojogo.com/joedoe/blog

In these cases, the prefixes **johndoe**, **jilldoe** and **joedoe** identify the instances of the app that are running in corresponding subdirectories of the same name. The application routing happens after this. You can tell Rails to ignore this part of the URLs when a request is made, but still put it on the URLs that it generates. This can be configured using the **RAILS\_RELATIVE\_URL\_ROOT** constant or the `AbstractRequest.relative_url_root` method.

If your Rails project is running on Apache, however, this feature is already activated automatically, so in many cases it is not necessary to worry about configuring this. Once again, this is only if you are using Apache.

In Rails 2.2, however, the `relative_url_root` will not be automatically configured by the HTTP header. This will need to be done manually, putting a line in each of your apps'
**environment.rb** files that looks something like this:

	config.action_controller.relative_url_root = "/johndoe"

That done, your application will ignore the "johndoe" prefix that occurs after the domain. But when it generate URLs it will always put this prefix in to guarantee that you will be accessing the project in the right subdirectory.