## Inflector#parameterize makes it easier to create pretty URLs

A new inflector has been added to Rails that I find particularly useful. The `parameterize` method makes any text URL-friendly. Take a look at this example.

Model:

	class User
	  def to_param
	    "#{id}-#{name.parameterize}"
	  end
	end

Controller:

	@user = User.find(1)
	# => #<User id: 1, name: "Carlos E. Brando">

View:

	link_to @user.name, user_path
	# => <a href="/users/1-carlos-e-brando">Carlos E. Brando</a>

One interesting thing to note about this feature is that it initially didn't work on accented characters, which was a significant problem for many people around the world. One day after the initial implementation, Michael Koziarski came to the rescue by adding this support. In spite of this, the code still wasn't perfect, so the code of the excellent [slugalizer](http://github.com/henrik/slugalizer/tree/master) plugin, created by Henrik Nyh, was adapted to this purpose. Now it really is perfect!

For those who are not using Rails 2.2 yet, the slugalizer plugin can be used.