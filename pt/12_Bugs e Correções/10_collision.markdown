## Erro ao criar dois controllers com o mesmo nome

No Rails 2.1 em alguns casos ao se criar dois controllers com o mesmo nome, mas em namespaces diferentes um erro acontece, veja:

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

Mais um bug corrigido nesta versão.
