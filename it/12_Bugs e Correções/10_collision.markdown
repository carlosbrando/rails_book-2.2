## Errore nel creare due controller con lo stesso nome

In alcuni casi con Rails 2.1 se cercavate di creare due controller con lo stesso nome, ma in namespace differenti, veniva comunque generato un errore:

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

Ancora un altro bug corretto con questa versione.
