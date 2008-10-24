## Error creating two controllers with the same name

In Rails 2.1, in some instances, when you created two controllers with the same name in different namespaces, you got an error, like this:

	$ rails -v
	Rails 2.1.0

	$ ruby -v
	ruby 1.8.6 (2008-03-03 patchlevel 114) [universal-darwin9.0]

	$ rails test
	$ cd test/
	$ script/generate scaffold Posts title:string body:text
	$ script/generate controller -t Admin::Posts
	The name 'Admin::PostsHelper' is either already used in your application or reserved by Ruby on Rails.
	  Please choose an alternative and run this generator again.
	  ...

Yet another bug that has been fixed in this version.